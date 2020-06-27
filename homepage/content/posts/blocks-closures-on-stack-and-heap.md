---
title: "Blocks and Closures on Stack and Heap"
date: 2014-03-04T01:56:00
tags: [apple, block, clang, closure, gcc, ObjC, pointer, development]
categories: [computer]
---

## Blocks on the Stack

While reading through Apple’s open source code (headers) I came across [queue.h](http://opensource.apple.com/source/libdispatch/libdispatch-339.1.9/dispatch/queue.h) and stumbled over the following warning:

<!--more-->

```objc
/*!
 *
 [...]
 *
 * dispatch_block_t block;
 *
 * if (x) {
 *     block = ^{ printf("true\n"); };
 * } else {
 *     block = ^{ printf("false\n"); };
 * }
 * block(); // unsafe!!!
 *
 * What is happening behind the scenes:
 *
 * if (x) {
 *     struct Block __tmp_1 = ...; // setup details
 *     block = &__tmp_1;
 * } else {
 *     struct Block __tmp_2 = ...; // setup details
 *     block = &__tmp_2;
 * }
 *
 * As the example demonstrates, the address of a stack variable is escaping the
 * scope in which it is allocated. That is a classic C bug.
 */
```

I got curious and so I followed the rabbit [down](http://opensource.apple.com/source/libdispatch/libdispatch-339.1.9/dispatch/queue.h) [the](http://objectivistc.tumblr.com/post/10523983325/would-you-please-crash-my-out-of-scope-stack-closure) [rabbit](http://www.friday.com/bbum/2009/08/29/blocks-tips-tricks/) [hole](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Blocks/Articles/bxUsing.html).

First of, a block in C is defined by `{ ... }`. Identifiers defined inside this block have scope visibility / lifetime (used from now on interchangeable) limited to that block. The `if (x)` statement in Apple’s example above is creating such a C block, in which a struct is created and that struct is assigned to (Objective-C) block (called closures from now on for easier differentiation).
Every C block creates a new visibility scope were stack variables are stored (stack area) similar to [stack frames](https://en.wikipedia.org/wiki/Call_stack#Structure). Which means after the block is closed it is not save any more to access these memory locations.

Closures are (apparently) the only Objective-C objects that start on the stack, the problem with that is, that the visibility is gone after the closing brace of the if-then-else and hence the block is lost. So the block has to be “saved” by copying it from the stack to the heap before the C block is finished.

## Compilers

If you run the example code from Apple you will realise, that the code works flawless. It does not crash with a dreaded segfault and it even behaves exactly as you would expect it to.
Why? This is because clang does not reuse stack areas that were previously used and therefore nothing overwrite the memory location with something different (assuming you are not doing it from a different thread). The situation looks different if you are using gcc with the -O2 flag. gcc then reuses stack areas and overwrites your stack area. Since gcc is not capable of closures and clang doesn’t reuse stack areas you might be never run actually into a problem (There is a [caveat](#closures-inside-of-an-array) tought[^1]). This behaviour is, though, just an implementation detail that might change or vary from compiler to compiler and therefore you should not bet on it, it might change.
You can find some demo source code [here](http://objectivistc.tumblr.com/post/10523983325/would-you-please-crash-my-out-of-scope-stack-closure) that shows `gcc -O0` versus `gcc -O2`.

## Closures inside of an Array

A time where you run into problems is, when you try to save closures in an array like this:

```objc
typedef int(^Blocky)(void);
Blocky b[3];

for (int i=0; i<3; i++) {
    b[i] = ^{ return i;};
}
for (int i=0; i<3; i++) {
    printf("b %d", b[i]());
}
```

[Code](http://www.friday.com/bbum/2009/08/29/blocks-tips-tricks/)

The output is “2 2 2” instead of the expected "1 2 3". This is because the stack area used for the `for loop` is the same for all iterations and therefore every new created closures overwrites the closures created in the previous iteration. In `b[1]`, `b[2]` and `b[3]` is just a pointer stored to the closure and since the place of creation on the stack was the same for all three closures the pointer is the same which leads to `b[1]==b[2]==b[3]`.

I wrote a small program that shows the different behaviours of closures on stack, closures on heap and blocks that use different stack areas.

```objc
#import <Foundation/Foundation.h>

int main(int argc, char *argv[]) {
    @autoreleasepool {

        typedef int(^Block)(void);

        void *p0, *p1;

        Block blockOnStack[3];
        Block blockOnHeap [3];

        for (int i=0; i<3; i++) {
            int int1 = 5;
            int int2 = 10;
            Block closure = ^{ return i; };

            blockOnStack[i] =             closure;
            blockOnHeap [i] = Block_copy( closure );

            printf("closure pointer:     %p\n",                blockOnStack[i] );
            printf("Block_copy pointer:                 %p\n", blockOnHeap [i] );
        }

        printf("\nExecuting blocks from the stack\n");
        for (int i = 0; i < 3; i++) {
            printf("pointer b[%d]: %p\n", i, blockOnStack[i]   );
            printf("Execute b[%d]: %d\n", i, blockOnStack[i]() );
        }
        printf("\nExecuting blocks from the heap\n");
        for (int i = 0; i < 3; i++) {
            printf("pointer b[%d]: %p\n", i, blockOnHeap[i]   );
            printf("Execute b[%d]: %d\n", i, blockOnHeap[i]() );
        }
        printf("\nC blocks\n");
        // "normal" C block scope 1
        {
            int blockInt0 = 5;
            p0 = &blockInt0;
        }

        // "normal" block scope 2
        {
            int blockInt1 = 10;
            p1 = &blockInt1;
        }

        printf("p0 = %p\np1 = %p\n", p0, p1);

        return 0;
    }
}
```

```bash
Every closure that is created inside the
for loop is created at the exact same
memory location on the stack.

The copied closures on the heap all have
different pointer addresses

closure pointer:     0x7fff54850bf0
Block_copy pointer:                 0x7fe5eac07c70
closure pointer:     0x7fff54850bf0
Block_copy pointer:                 0x7fe5eac07ca0
closure pointer:     0x7fff54850bf0
Block_copy pointer:                 0x7fe5eac07cd0
Stack pointers, all same ^^^^^^^^^^
Heap pointers, all distinct         ^^^^^^^^^^^^^^

Executing blocks from the stack
pointer b[0]: 0x7fff54850bf0
Execute b[0]: 2
pointer b[1]: 0x7fff54850bf0
Execute b[1]: 2
pointer b[2]: 0x7fff54850bf0
Execute b[2]: 2

Executing blocks from the heap
pointer b[0]: 0x7fe5eac07c70
Execute b[0]: 0
pointer b[1]: 0x7fe5eac07ca0
Execute b[1]: 1
pointer b[2]: 0x7fe5eac07cd0
Execute b[2]: 2

C blocks
Unlike the for loop C block scopes create a new stack
area for every visibility scope.
Unless compiled with e.g. gcc -O2
Remember: This is a implementation detail!!!
p0 = 0x7fff54850be4
p1 = 0x7fff54850be0
```

The code and output can be found for easy reading and copying in this [gist](https://gist.github.com/hashier/9317235).

[^1]: there always is
