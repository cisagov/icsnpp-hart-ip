# Build Status

| Source       | `main` Status | `main` Timestamp |
|--------------|--------------|------------|
| **CISAGOV** | ![Build Status](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fcisagov%2Ficsnpp-hart-ip%2Fcommits%2Fmain%2Fstatus&query=state&label=build) | ![Last Build](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fcisagov%2Ficsnpp-hart-ip%2Fcommits%2Fmain%2Fstatus&query=statuses[0].updated_at&label=last%20build&color=lightgrey) |
| **Development** | ![Build Status](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fparsitects%2Ficsnpp-hart-ip%2Fcommits%2Fmain%2Fstatus&query=state&label=build) | ![Last Build](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fparsitects%2Ficsnpp-hart-ip%2Fcommits%2Fmain%2Fstatus&query=statuses[0].updated_at&label=last%20build&color=lightgrey) |

# HART-IP

## Overview

HART-IP is a Zeek plugin (written in [Spicy](https://docs.zeek.org/projects/spicy/en/latest/)) for parsing and logging fields used by the HART-IP protocol.

HART-IP is the IP extension of the Highway Addressable Remote Transducer (HART) protocol.
The HART protocol is a hybrid analog+digital industrial automation open protocol.
It is currently maintained by the FieldComm Group (https://www.fieldcommgroup.org/).

This parser is a minimal release. While many commands are parsed, not all of them are currently implemented. Additional commands may be added based on community feedback.

## Installation (via zkg)

### Package Manager

This script is available as a package for [Zeek Package Manager](https://docs.zeek.org/projects/package-manager/en/stable/index.html). Zeek includes Spicy support by default as of [v6.0.0](https://github.com/zeek/zeek/releases/tag/v6.0.0).

```bash
zkg refresh
zkg install icsnpp-hart-ip
```

If this package is installed from ZKG it will be added to the available plugins. This can be tested by running `zeek -NN | grep ANALYZER_SPICY_HART_IP`. If installed correctly you will see:

```bash
[Analyzer] spicy_HART_IP_TCP (ANALYZER_SPICY_HART_IP_TCP, enabled)
[Analyzer] spicy_HART_IP_UDP (ANALYZER_SPICY_HART_IP_UDP, enabled)
```

If you have ZKG configured to load packages (see `@load packages` in the [ZKG Quickstart Guide](https://docs.zeek.org/projects/package-manager/en/stable/quickstart.html)), this plugin and scripts will automatically be loaded and ready to go.

## Installation (via git clone)

```bash
git clone https://github.com/cisagov/icsnpp-hart-ip.git
cd icsnpp-hart-ip
mkdir build && cd build && cmake .. && make
```

From here you can install the locally built files through `zkg install ./icsnpp-hart-ip` and run it like you would normally.
Or you can manually run the parser without installing it: `zeek ./build/hart_ip.hlto ./scripts/__load__.zeek  -Cr <pcap>`

## ICSNPP Packages

All ICSNPP Packages:

* [ICSNPP](https://github.com/cisagov/icsnpp)

### License

Copyright 2024 Battelle Energy Alliance, LLC. Released under the terms of the 3-Clause BSD License (see [`LICENSE.txt`](./LICENSE.txt)).
