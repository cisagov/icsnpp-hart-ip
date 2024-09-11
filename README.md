# HART-IP

## Overview

HART-IP is a Zeek plugin (written in [Spicy](https://docs.zeek.org/projects/spicy/en/latest/)) for parsing and logging fields used by the HART-IP protocol.

HART-IP is the IP extension of the Highway Addressable Remote Transducer (HART) protocol.
The HART protocol is a hybrid analog+digital industrial automation open protocol.
It is currently maintained by the FieldComm Group (https://www.fieldcommgroup.org/).

This parser is a minimal release. While many commands are parsed, not all of them are currently implemented. Additional commands may be added based on community feedback.

## Installation

### Package Manager (Remote Repository)
This script is available as a package for [Zeek Package Manger](https://docs.zeek.org/projects/package-manager/en/stable/index.html)

```bash
zkg refresh
zkg install icsnpp-hart-ip
```

If ZKG is configured to load packages (see @load packages in quickstart guide), this script will automatically be loaded and ready to go.
[ZKG Quickstart Guide](https://docs.zeek.org/projects/package-manager/en/stable/quickstart.html)

If users are not using site/local.zeek or another site installation of Zeek and want to run this script on a packet capture, they can add `icsnpp-hart-ip` to the command to run this script on the packet capture from a cloned version of this repository:

```bash
zeek -Cr <path_to_pcap> icsnpp-hart-ip
```

### Package Manager (Local Folder)
To install from a local version of the repository, navigate to a clean locally cloned version of the repository and run the following commands:

```bash
zkg install .
zeek -Cr <path_to_pcap> local
```

## ICSNPP Packages

All ICSNPP Packages:

* [ICSNPP](https://github.com/cisagov/icsnpp)

### License

Copyright 2024 Battelle Energy Alliance, LLC. Released under the terms of the 3-Clause BSD License (see [`LICENSE.txt`](./LICENSE.txt)).
