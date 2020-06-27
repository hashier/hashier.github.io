---
title: "cURL and Error Codes"
date: 2013-08-19T14:39:00
tags: [application, brew, code, cURL, error, ssl, funny]
categories: [computer]
aliases:
---

So brew threw this at me this morning

<!--more-->

```bash
curl: (56) SSL read: error:00000000:lib(0):func(0):reason(0), errno 54
```

This error code clearly states

```c
#define X509_V_ERR_CRL_PATH_VALIDATION_ERROR 54
```

Which is actually not interesting... but error code #50 is

```c
/* The application is not happy */
#define X509_V_ERR_APPLICATION_VERIFICATION 50
```

[Source](http://cvs.openssl.org/fileview?f=openssl/crypto/x509/x509_vfy.h&v=1.67.2.3.4.4)
