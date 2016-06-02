# [sbp2udp][sbp2udp-github]

[![Package version][sbp2udp-hackage-img]][sbp2udp-hackage]
[![Dependency status][sbp2udp-hackage-deps-img]][sbp2udp-hackage-deps]

Simple utility for sending SBP binary messages to a UDP host-port pair.

### Install

    $ stack install sbp
    $ stack install sbp2udp

### Example Usage

Run a local UDP server with netcat, converting messages to SBP JSON:

    $ nc -4 -u -k -l 5000 | sbp2json

Cat a SBP JSON log file, convert it to SBP, and send to above local
UDP server:

    $ cat serial-link-20150708-110840.log.json | json2sbp | sbp2udp --host 127.0.0.1 --port 2389

[sbp2udp-github]: https://github.com/mfine/sbp2udp/tree/master/haskell
[sbp2udp-hackage-img]: https://img.shields.io/hackage/v/sbp2udp.svg?style=flat
[sbp2udp-hackage]: https://hackage.haskell.org/package/sbp2udp
[sbp2udp-hackage-deps-img]: https://img.shields.io/hackage-deps/v/sbp2udp.svg?style=flat
[sbp2udp-hackage-deps]: http://packdeps.haskellers.com/feed?needle=sbp2udp
