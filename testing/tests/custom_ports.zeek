# Copyright 2024, Battelle Energy Alliance, LLC, ALL RIGHTS RESERVED
# @TEST-DOC: Verify non-standard TCP and UDP ports, UDP direction inference, payload signatures, and invalid environment entries.
#
# @TEST-EXEC: base64 -d ${DIST}/testing/files/hart-custom-tcp.pcapng.b64 > custom-tcp.pcapng
# @TEST-EXEC: base64 -d ${DIST}/testing/files/hart-custom-udp-c2s.pcapng.b64 > custom-udp-c2s.pcapng
# @TEST-EXEC: base64 -d ${DIST}/testing/files/hart-custom-udp-s2c.pcapng.b64 > custom-udp-s2c.pcapng
#
# The unconfigured port is not parsed when signatures are deliberately omitted.
# @TEST-EXEC: zeek -C -r custom-tcp.pcapng ${DIST}/testing/scripts/load-without-signatures.zeek
# @TEST-EXEC: test ! -e hart_ip_general.log
# @TEST-EXEC: rm -f *.log
# @TEST-EXEC: zeek -C -r custom-udp-c2s.pcapng ${DIST}/testing/scripts/load-without-signatures.zeek
# @TEST-EXEC: test ! -e hart_ip_general.log
# @TEST-EXEC: rm -f *.log
# @TEST-EXEC: zeek -C -r custom-udp-s2c.pcapng ${DIST}/testing/scripts/load-without-signatures.zeek
# @TEST-EXEC: test ! -e hart_ip_general.log
# @TEST-EXEC: rm -f *.log
#
# Direct set configuration activates TCP, request-first UDP, and response-first UDP.
# @TEST-EXEC: zeek -C -r custom-tcp.pcapng ${DIST}/testing/scripts/load-without-signatures.zeek %INPUT "HART_IP::tcp_ports+={12345/tcp}" "HART_IP::udp_ports+={12345/udp}"
# @TEST-EXEC: test "$(zeek-cut id.resp_p < hart_ip_general.log)" = "12345"
# @TEST-EXEC: rm -f *.log
# @TEST-EXEC: zeek -C -r custom-udp-c2s.pcapng ${DIST}/testing/scripts/load-without-signatures.zeek %INPUT "HART_IP::tcp_ports+={12345/tcp}" "HART_IP::udp_ports+={12345/udp}"
# @TEST-EXEC: test "$(zeek-cut id.resp_p < hart_ip_general.log)" = "12345"
# @TEST-EXEC: rm -f *.log
# @TEST-EXEC: zeek -C -r custom-udp-s2c.pcapng ${DIST}/testing/scripts/load-without-signatures.zeek %INPUT "HART_IP::tcp_ports+={12345/tcp}" "HART_IP::udp_ports+={12345/udp}"
# @TEST-EXEC: test "$(zeek-cut id.resp_p < hart_ip_general.log)" = "12345"
# @TEST-EXEC: rm -f *.log
#
# Environment configuration activates both transport analyzers and accepts surrounding whitespace.
# @TEST-EXEC: ZEEK_HART_IP_PORTS="12345/tcp, 12345/udp" zeek -C -r custom-tcp.pcapng ${DIST}/testing/scripts/load-without-signatures.zeek %INPUT
# @TEST-EXEC: test "$(zeek-cut id.resp_p < hart_ip_general.log)" = "12345"
# @TEST-EXEC: rm -f *.log
# @TEST-EXEC: ZEEK_HART_IP_PORTS="12345/tcp, 12345/udp" zeek -C -r custom-udp-s2c.pcapng ${DIST}/testing/scripts/load-without-signatures.zeek %INPUT
# @TEST-EXEC: test "$(zeek-cut id.resp_p < hart_ip_general.log)" = "12345"
# @TEST-EXEC: rm -f *.log
#
# With normal package loading, port-independent DPD detects TCP and both UDP directions without configuration.
# @TEST-EXEC: zeek -C -r custom-tcp.pcapng ${PACKAGE}
# @TEST-EXEC: test -e hart_ip_general.log
# @TEST-EXEC: rm -f *.log
# @TEST-EXEC: zeek -C -r custom-udp-c2s.pcapng ${PACKAGE}
# @TEST-EXEC: test -e hart_ip_general.log
# @TEST-EXEC: rm -f *.log
# @TEST-EXEC: zeek -C -r custom-udp-s2c.pcapng ${PACKAGE}
# @TEST-EXEC: test -e hart_ip_general.log
#
# @TEST-DOC: Custom ports are registered with their transport analyzers and added to likely_server_ports.

event zeek_init() &priority=-10
    {
    assert(12345/tcp in HART_IP::tcp_ports);
    assert(12345/udp in HART_IP::udp_ports);
    assert(12345/tcp in likely_server_ports);
    assert(12345/udp in likely_server_ports);
    assert(12345/tcp in Analyzer::registered_ports(Analyzer::ANALYZER_SPICY_HART_IP_TCP));
    assert(12345/udp in Analyzer::registered_ports(Analyzer::ANALYZER_SPICY_HART_IP_UDP));
    }
