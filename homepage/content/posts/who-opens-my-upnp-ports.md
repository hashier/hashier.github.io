---
title: "Who opens my UPnP ports?"
date: 2013-05-07T16:11:00
tags: [apple, application, linux, lsof, mac, network, port, software, strange, sysadmin, tcp, tip, tool, udp, upnp]
categories: [computer]
aliases:
---

Recently I turned on UPnP (Universal Plug and Play) to play a bit with it and instantly noticed that someone/something opened some ports in my router and forwarded them to my machine. So of course I wanted to know what's going on on my network.

<!--more-->

First idea "wireshark" but this only gives you information from which port these UPnP stuff goes, it doesn't tell you the application that initiated these packages. For the curious here is the [filter](http://wiki.wireshark.org/SSDP) you can use:

```bash
udp.dstport == 1900 && http && ip.addr == 192.168.1.100
```

UPnP uses the [SSDP](http://en.wikipedia.org/wiki/Simple_Service_Discovery_Protocol) protocol which isn't implemented by wireshark but you can simply use the http protocol because SSDP is based on [HTTPU](http://en.wikipedia.org/wiki/HTTPU) (yes, HTTPU).

> Imagine a picture that shows you that port 4500 and 5353 are open

So port 4500 and 5353 (both UDP) are forwarded to my Mac but which software is behind this? Strangely

```bash
lsof -i :4500
lsof -i :5353
```

Booth show nothing... which means right now nothing is listening on those ports on my machine.

<!--

 but with a small trick we get around this. In a different terminal we use the ncat command (which you can install with homebrew) with

```
ncat -u 4500
```

and when we now call again the lsof command we can see which program is causing it

```bash
$ lsof -i :4500
COMMAND   PID    USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
ncat    57954 hashier    5u  IPv6 0x9fa0d8326998071f      0t0  UDP localhost:49850->localhost:ipsec-msft

$ lsof -i :5353
COMMAND   PID    USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
ncat    57960 hashier    5u  IPv6 0x9fa0d8326998071f      0t0  UDP localhost:49851->localhost:mdns$
```

We can see that ncat is making a connections on UDP to localhost and the programs which are "answering" those requests are:
-->

Let's see which "normal" services listen on those ports. Of course this is not 100 % certain since any program could listen on those ports.

```bash
$ grep 4500 /etc/services
ipsec-msft      4500/udp    # Microsoft IPsec NAT-T
ipsec-msft      4500/tcp    # Microsoft IPsec NAT-T

$ grep 5353 /etc/services
#               5353        Unassigned
mdns            5353/udp    # Multicast DNS
mdns            5353/tcp    # Multicast DNS
```

I didn't do anything with VPN or IPsec so I started googling and found this [Apple KB entry](http://support.apple.com/kb/TS1629) which explained to me which services forward those ports and apparently it's just "Back to My Mac" and some "Bonjour" stuff.

For the case that the service is still up and running on the port the `lsof` output would look something like this, where you can easily read the `command` and `PID` that is listening on a given port:

```bash
$ lsof -i :32323
COMMAND   PID    USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
Python  21495 hashier    3u  IPv4 0x23f1441a8dbc1b79      0t0  TCP *:32323 (LISTEN)
```

In this case I just started a python script which binds to port `32323`.

Some other quick tips of `lsof`.

Print established TCP connections:

```bash
lsof -P -iTCP -sTCP:ESTABLISHED
```

Print listening TCP connections:

```bash
$ lsof -P -iTCP -sTCP:LISTEN
...
Python    21495 hashier    3u  IPv4 0x23f1441a8dbc1b79      0t0  TCP *:32323 (LISTEN)
...
```

and here we can as well see the listening python TCP server on `32323`. This is a very quick way to find out all the services that are waiting for a connection.
