# Copyright 2024, Battelle Energy Alliance, LLC, ALL RIGHTS RESERVED
# @TEST-DOC: Invalid custom-port entries warn and are ignored without aborting initialization or registering port zero.
#
# @TEST-EXEC: ZEEK_HART_IP_PORTS="bad,70000/tcp" zeek ${DIST}/testing/scripts/load-without-signatures.zeek %INPUT 2> invalid.stderr
# @TEST-EXEC: grep -q "Ignoring invalid ZEEK_HART_IP_PORTS entry 'bad'" invalid.stderr
# @TEST-EXEC: grep -q "Ignoring out-of-range ZEEK_HART_IP_PORTS entry '70000/tcp'" invalid.stderr

event zeek_init() &priority=-10
    {
    assert(0/tcp !in HART_IP::tcp_ports);
    assert(0/tcp !in Analyzer::registered_ports(Analyzer::ANALYZER_SPICY_HART_IP_TCP));
    }
