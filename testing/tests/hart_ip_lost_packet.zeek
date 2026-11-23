# Copyright 2024, Battelle Energy Alliance, LLC, ALL RIGHTS RESERVED
# @TEST-EXEC: touch hart_ip_general.log hart_ip_universal_commands.log weird.log
# @TEST-EXEC: zeek -C -r ${TRACES}/hart-ip_lost_packet.pcap ${PACKAGE} %INPUT
# Keep only non-random fields
# @TEST-EXEC: zeek-cut id.orig_h id.orig_p id.resp_h id.resp_p proto service < conn.log > conn.tmp && mv conn.tmp conn.log
# @TEST-EXEC: zeek-cut -n command_number_link_id direct_pdu_command_link_id session_log_record_link_id < hart_ip_general.log > hart_ip_general.tmp && mv hart_ip_general.tmp hart_ip_general.log
# @TEST-EXEC: zeek-cut -n command_number_link_id < hart_ip_universal_commands.log > hart_ip_universal_commands.tmp && mv hart_ip_universal_commands.tmp hart_ip_universal_commands.log
# @TEST-EXEC: zeek-cut name < weird.log | sort | uniq -c > weird.tmp && mv weird.tmp weird.log
# Actual run the diffs
# @TEST-EXEC: btest-diff conn.log
# @TEST-EXEC: btest-diff hart_ip_general.log
# @TEST-EXEC: btest-diff hart_ip_universal_commands.log
# @TEST-EXEC: btest-diff weird.log
#
# @TEST-DOC: hart_ip.pcap with one TCP segment from the server removed: the analyzer resumes at the next message header and logs the messages after the gap
