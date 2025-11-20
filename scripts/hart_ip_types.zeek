# Copyright 2024, Battelle Energy Alliance, LLC, ALL RIGHTS RESERVED
module HART_IP;

export {
    type general_log: record {
        ts                                                                                      : time &log;
        uid                                                                                     : string &log;
        id                                                                                      : conn_id &log;
        proto                                                                                   : transport_proto &log;
        command_number_link_id                                                                  : string &log &optional;
        direct_pdu_command_link_id                                                              : string &log &optional;
        session_log_record_link_id                                                              : string &log &optional;
        message_packet_bytes                                                                    : vector of count &log &optional;
        header_version                                                                          : count &log &optional;
        header_message_type_reserved                                                            : count &log &optional;
        header_message_type_message_type                                                        : string &log &optional;
        header_message_id                                                                       : string &log &optional;
        header_status_code                                                                      : string &log &optional;
        header_sequence_number                                                                  : count &log &optional;
        header_length                                                                           : count &log &optional;
        session_initiate_master_type                                                            : count &log &optional;
        session_initiate_inactivity_close_timer                                                 : count &log &optional;
        token_passing_pdu_delimiter_address_type                                                : string &log &optional;
        token_passing_pdu_delimiter_expansion_bytes                                             : count &log &optional;
        token_passing_pdu_delimiter_physical_layer_type                                         : string &log &optional;
        token_passing_pdu_delimiter_frame_type                                                  : string &log &optional;
        token_passing_pdu_address_v4                                                            : count &log &optional;
        token_passing_pdu_address_v6                                                            : string &log &optional;
        token_passing_pdu_command_number                                                        : string &log &optional;
        token_passing_pdu_byte_count                                                            : count &log &optional;
        token_passing_pdu_check_byte                                                            : count &log &optional;
        token_passing_pdu_contents_data_data                                                    : vector of count &log &optional;
        token_passing_pdu_contents_response_response_code                                       : count &log &optional;
        token_passing_pdu_contents_response_device_status_device_malfunction                    : bool &log &optional;
        token_passing_pdu_contents_response_device_status_configuration_changed                 : bool &log &optional;
        token_passing_pdu_contents_response_device_status_cold_start                            : bool &log &optional;
        token_passing_pdu_contents_response_device_status_more_status_available                 : bool &log &optional;
        token_passing_pdu_contents_response_device_status_loop_current_fixed                    : bool &log &optional;
        token_passing_pdu_contents_response_device_status_loop_current_saturated                : bool &log &optional;
        token_passing_pdu_contents_response_device_status_non_primary_variable_out_of_limits    : bool &log &optional;
        token_passing_pdu_contents_response_device_status_primary_variable_out_of_limits        : bool &log &optional;
        direct_pdu_device_status_device_malfunction                                             : bool &log &optional;
        direct_pdu_device_status_configuration_changed                                          : bool &log &optional;
        direct_pdu_device_status_cold_start                                                     : bool &log &optional;
        direct_pdu_device_status_more_status_available                                          : bool &log &optional;
        direct_pdu_device_status_loop_current_fixed                                             : bool &log &optional;
        direct_pdu_device_status_loop_current_saturated                                         : bool &log &optional;
        direct_pdu_device_status_non_primary_variable_out_of_limits                             : bool &log &optional;
        direct_pdu_device_status_primary_variable_out_of_limits                                 : bool &log &optional;
        direct_pdu_extended_status_undefined_bits                                               : count &log &optional;
        direct_pdu_extended_status_function_check                                               : bool &log &optional;
        direct_pdu_extended_status_out_of_specification                                         : bool &log &optional;
        direct_pdu_extended_status_failure                                                      : bool &log &optional;
        direct_pdu_extended_status_critical_power_failure                                       : bool &log &optional;
        direct_pdu_extended_status_device_variable_alert                                        : bool &log &optional;
        direct_pdu_extended_status_maintenance_required                                         : bool &log &optional;
        read_audit_log_start_record                                                             : count &log &optional;
        read_audit_log_number_of_records                                                        : count &log &optional;
        read_audit_log_power_up_time                                                            : time &log &optional; #changed from count to time
        read_audit_log_last_security_change                                                     : time &log &optional; #changed from count to time
        read_audit_log_server_status_undefined_bits                                             : count &log &optional;
        read_audit_log_server_status_insecure_syslog_connection                                 : bool &log &optional;
        read_audit_log_server_status_syslog_server_located_but_connection_failed                : bool &log &optional;
        read_audit_log_server_status_unable_to_locate_syslog_server                             : bool &log &optional;
        read_audit_log_session_record_size                                                      : count &log &optional;
    };

    type direct_pdu_command_log: record {
        ts                                          : time &log;
        uid                                         : string &log;
        id                                          : conn_id &log;
        proto                                       : transport_proto &log;
        direct_pdu_command_link_id                  : string &log &optional;
        command_number_link_id                      : string &log &optional;
        direct_pdu_command_data_data                : vector of count &log &optional;
        direct_pdu_command_command_number           : string &log &optional;
        direct_pdu_command_byte_count               : count &log &optional;
        direct_pdu_contents_response_response_code  : count &log &optional;
    };

    type session_log_record_log: record {
        ts                                                                      : time &log;
        uid                                                                     : string &log;
        id                                                                      : conn_id &log;
        proto                                                                   : transport_proto &log;
        session_log_record_link_id                                              : string &log &optional;
        session_log_record_client_i_pv4_address                                 : addr &log &optional;
        session_log_record_client_i_pv6_address                                 : addr &log &optional;
        session_log_record_client_port                                          : count &log &optional;
        session_log_record_server_port                                          : count &log &optional;
        session_log_record_connect_time                                         : time &log &optional; #changed from count to time
        session_log_record_disconnect_time                                      : time &log &optional; #changed from count to time
        session_log_record_session_status_summary_undefined_bits                : count &log &optional;
        session_log_record_session_status_summary_insecure_session              : bool &log &optional;
        session_log_record_session_status_summary_session_timeout               : bool &log &optional;
        session_log_record_session_status_summary_aborted_session               : bool &log &optional;
        session_log_record_session_status_summary_bad_session_initialization    : bool &log &optional;
        session_log_record_session_status_summary_writes_occured                : bool &log &optional;
        session_log_record_start_configuration_change_count                     : count &log &optional;
        session_log_record_end_configuration_change_count                       : count &log &optional;
        session_log_record_num_publish_pdu                                      : count &log &optional;
        session_log_record_num_request_pdu                                      : count &log &optional;
        session_log_record_num_response_pdu                                     : count &log &optional;
    };

}
