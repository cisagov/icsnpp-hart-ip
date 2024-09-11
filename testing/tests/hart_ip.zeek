# @TEST-EXEC: touch hart_ip_general.log hart_ip_universal_commands.log
# @TEST-EXEC: zeek -C -r ${TRACES}/hart-ip.pcap ${PACKAGE} %INPUT
# Keep only non-random fields
# @TEST-EXEC: zeek-cut id.orig_h id.orig_p id.resp_h id.resp_p proto service < conn.log > conn.tmp && mv conn.tmp conn.log
# @TEST-EXEC: zeek-cut -n command_number_link_id direct_pdu_command_link_id session_log_record_link_id < hart_ip_general.log > hart_ip_general.tmp && mv hart_ip_general.tmp hart_ip_general.log
# @TEST-EXEC: zeek-cut -n command_number_link_id < hart_ip_universal_commands.log > hart_ip_universal_commands.tmp && mv hart_ip_universal_commands.tmp hart_ip_universal_commands.log
# Actual run the diffs
# @TEST-EXEC: btest-diff conn.log
# @TEST-EXEC: btest-diff hart_ip_general.log
# @TEST-EXEC: btest-diff hart_ip_universal_commands.log
#
# @TEST-DOC: Test hart-ip analyzer with hart_ip.pcap
