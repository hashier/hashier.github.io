---
title: "Improving the security of your SSH private key files — Martin Kleppmann’s blog"
date: 2013-07-03T17:50:00
tags: [config, key, security, ssh, tip]
categories: [computer]
aliases:
---

<!--more-->

Read this great article:

[Improving the security of your SSH private key files — Martin Kleppmann’s blog.](http://martin.kleppmann.com/2013/05/24/improving-security-of-ssh-private-keys.html)

For my own convenience I just put all the important commands together but won't explain anything. Again: Go and read the article.

Reading "normal" ASN.1 key (RSA and DSA without passphrase):

```bash
openssl asn1parse -in test_rsa_key
```

Reading passphrase protected RSA key:

```bash
openssl rsa -text -in test_rsa_key
```

Update key from MD5 hashing to PKCS:

```bash
mv key key.old
openssl pkcs8 -topk8 -v2 des3 -in key.old -out key
chmod 600 key # IMPORTANT !
```

The key is now back to ASN.1 structure so you can read it with:

```bash
openssl asn1parse -in test_rsa_key
```

Test the new key. If it works just remove the old one. If it doesn't you still have you old key.

Done.
