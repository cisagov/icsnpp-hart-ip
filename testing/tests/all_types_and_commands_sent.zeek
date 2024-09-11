# @TEST-EXEC: touch hart_ip_common_commands.log hart_ip_direct_pdu_command.log hart_ip_general.log hart_ip_session_record.log hart_ip_universal_commands.log
# @TEST-EXEC: zeek -C -r ${TRACES}/hart-ip_all_types_and_commands_sent.pcapng ${PACKAGE} %INPUT
# Keep only non-random fields
# @TEST-EXEC: zeek-cut id.orig_h id.orig_p id.resp_h id.resp_p proto service < conn.log > conn.tmp && mv conn.tmp conn.log
# @TEST-EXEC: zeek-cut -n command_number_link_id < hart_ip_common_commands.log > hart_ip_common_commands.tmp && mv hart_ip_common_commands.tmp hart_ip_common_commands.log
# @TEST-EXEC: zeek-cut -n direct_pdu_command_link_id command_number_link_id < hart_ip_direct_pdu_command.log > hart_ip_direct_pdu_command.tmp && mv hart_ip_direct_pdu_command.tmp hart_ip_direct_pdu_command.log
# @TEST-EXEC: zeek-cut -n command_number_link_id direct_pdu_command_link_id session_log_record_link_id < hart_ip_general.log > hart_ip_general.tmp && mv hart_ip_general.tmp hart_ip_general.log
# @TEST-EXEC: zeek-cut -n session_log_record_link_id < hart_ip_session_record.log > hart_ip_session_record.tmp && mv hart_ip_session_record.tmp hart_ip_session_record.log
# @TEST-EXEC: zeek-cut -n command_number_link_id < hart_ip_universal_commands.log > hart_ip_universal_commands.tmp && mv hart_ip_universal_commands.tmp hart_ip_universal_commands.log
# Actual run the diffs
# @TEST-EXEC: btest-diff conn.log
# @TEST-EXEC: btest-diff hart_ip_common_commands.log
# @TEST-EXEC: btest-diff hart_ip_direct_pdu_command.log
# @TEST-EXEC: btest-diff hart_ip_general.log
# @TEST-EXEC: btest-diff hart_ip_session_record.log
# @TEST-EXEC: btest-diff hart_ip_universal_commands.log
#
# @TEST-DOC: Test hart-ip analyzer with hart-ip_all_types_and_commands_sent.pcapng
