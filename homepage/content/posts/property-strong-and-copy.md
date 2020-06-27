---
title: "Property: strong and copy"
date: 2014-02-25T22:36:00
tags: [apple, development, ObjC, pointer]
categories: [computer]
---

<!--more-->

```objc
//
//  main.m
//  strong_retain_copy
//
//  Created by Christopher Loessl on 25/02/14.
//  Copyright (c) 2014 Christopher Loessl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *nick;

@end

@implementation Person

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Person *per = [[Person alloc] init];
        NSMutableString *aName = [NSMutableString stringWithString:@"Christopher"];

        // The pointer "per.name" is changed.
        // "per.name" points at the same location as "someName" afterwards
        per.name = aName;

        // This is equal to
        // per.address = [someName copy];
        // Therefore the points are not the same afterwards
        per.nick = aName;

        // Changing "someName" to
        [aName setString:@"hashier"];

        NSLog(@"per.name   : %@", per.name);
        NSLog(@"per.nick   : %@", per.nick);
        NSLog(@"someName   : %@", aName);
        NSLog(@"\nPointer 1: %p\nPointer 2: %p\nPointer 3: %p", per.name, per.nick, aName);

    }
    return 0;
}
```

You can find this code in my github gists [here](https://gist.github.com/hashier/9218108) for easy copy and compile[^1].

The code is commented so you should really quickly see what the difference between `copy` and `strong` is doing here. By marking the pointer `copy` the object is copied during assignment and not just the pointer is copied over. For that to work, the `NSCopying` has the be implemented for that class. Luckily `NSString`, `NSDictionary`, and many others already support this protocol.

So now after you know what it makes for a difference with pointers, let’s see when you would want to use one over the other.

Even though `per.name` is `NSString` and should not be mutable it is possible to alter it through the 2nd pointer to the same address which is a `NSMutableString` pointer. This said you can use `copy` to help you prevent this kind of trap so you might always want to use `copy` if the immutable class you are using conforms to `NSCopying`.

On the other hand, if you keep good track of your pointers and you know what you are doing, this could save you time during assignment because the assignment is much faster than copying the whole object[^2]. So if you are only using immutable objects pointer assignments can help get some more speed. But remember

> Premature optimization is the root of all evil [Knuth]

[^1]: clang -std=c99 -framework Foundation <file.m>

[^2]: Depending of the implementation of the object, this might be a shallow or deep copy.
