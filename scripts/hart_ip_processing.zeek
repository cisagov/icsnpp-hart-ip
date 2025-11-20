# Copyright 2024, Battelle Energy Alliance, LLC, ALL RIGHTS RESERVED
module HART_IP;

hook set_session_general_log(c: connection) {
    if ( ! c?$hart_ip_general_log )
        c$hart_ip_general_log = general_log(
            $ts=network_time(),
            $uid=c$uid,
            $id=c$id,
            $proto=get_conn_transport_proto(c$id));
}

hook set_session_direct_pdu_command_log(c: connection) {
    if ( ! c?$hart_ip_direct_pdu_command_log )
        c$hart_ip_direct_pdu_command_log = direct_pdu_command_log(
            $ts=network_time(),
            $uid=c$uid,
            $id=c$id,
            $proto=get_conn_transport_proto(c$id));
}

hook set_session_session_log_record_log(c: connection) {
    if ( ! c?$hart_ip_session_log_record_log )
        c$hart_ip_session_log_record_log = session_log_record_log(
            $ts=network_time(),
            $uid=c$uid,
            $id=c$id,
            $proto=get_conn_transport_proto(c$id));
}

event HART_IP::MessageEvt (c: connection, is_orig: bool, message: HART_IP::Message) {
    hook set_session_general_log(c);

    local info_general_log = c$hart_ip_general_log;

    info_general_log$header_version = message$header$version;
    info_general_log$header_message_type_reserved = message$header$messageType$reserved;
    info_general_log$header_message_type_message_type = HART_IP_ENUM::MESSAGE_TYPE[message$header$messageType$messageType];
    info_general_log$header_message_id = HART_IP_ENUM::MESSAGE_ID[message$header$messageID];
    info_general_log$header_status_code = HART_IP_ENUM::STATUS_CODE[message$header$statusCode];
    info_general_log$header_sequence_number = message$header$sequenceNumber;
    info_general_log$header_length = message$header$length;
    if (message?$body){
        if (message$body?$sessionInitiate){
            info_general_log$session_initiate_master_type = message$body$sessionInitiate$masterType;
            info_general_log$session_initiate_inactivity_close_timer = message$body$sessionInitiate$inactivityCloseTimer;
        }
        if (message$body?$tokenPassingPDU){
            info_general_log$token_passing_pdu_delimiter_address_type = HART_IP_ENUM::ADDRESS_TYPE[message$body$tokenPassingPDU$delimiter$addressType];
            info_general_log$token_passing_pdu_delimiter_expansion_bytes = message$body$tokenPassingPDU$delimiter$expansionBytes;
            info_general_log$token_passing_pdu_delimiter_physical_layer_type = HART_IP_ENUM::PHYSICAL_LAYER_TYPE[message$body$tokenPassingPDU$delimiter$physicalLayerType];
            info_general_log$token_passing_pdu_delimiter_frame_type = HART_IP_ENUM::FRAME_TYPE[message$body$tokenPassingPDU$delimiter$frameType];
            if (message$body$tokenPassingPDU?$addressV4){
                info_general_log$token_passing_pdu_address_v4 = message$body$tokenPassingPDU$addressV4;
            }
            if (message$body$tokenPassingPDU?$addressV6){
                info_general_log$token_passing_pdu_address_v6 = message$body$tokenPassingPDU$addressV6;
            }
            info_general_log$token_passing_pdu_command_number = HART_IP_ENUM::COMMAND_NUMBER8_BIT[message$body$tokenPassingPDU$commandNumber];
            info_general_log$token_passing_pdu_byte_count = message$body$tokenPassingPDU$byteCount;
            if (message$body$tokenPassingPDU?$tokenPassingPDUContentsRequest){
                if (message$body$tokenPassingPDU$tokenPassingPDUContentsRequest?$command){
                    info_general_log$command_number_link_id = message$body$tokenPassingPDU$tokenPassingPDUContentsRequest$command$commandNumberLinkID;
                    if (message$body$tokenPassingPDU$tokenPassingPDUContentsRequest$command?$data){
                        info_general_log$token_passing_pdu_contents_data_data = message$body$tokenPassingPDU$tokenPassingPDUContentsRequest$command$data;
                    }
                }
            }
            if (message$body$tokenPassingPDU?$tokenPassingPDUContentsResponse){
                info_general_log$token_passing_pdu_contents_response_response_code = message$body$tokenPassingPDU$tokenPassingPDUContentsResponse$responseCode;
                info_general_log$token_passing_pdu_contents_response_device_status_device_malfunction = message$body$tokenPassingPDU$tokenPassingPDUContentsResponse$deviceStatus$DEVICE_MALFUNCTION;
                info_general_log$token_passing_pdu_contents_response_device_status_configuration_changed = message$body$tokenPassingPDU$tokenPassingPDUContentsResponse$deviceStatus$CONFIGURATION_CHANGED;
                info_general_log$token_passing_pdu_contents_response_device_status_cold_start = message$body$tokenPassingPDU$tokenPassingPDUContentsResponse$deviceStatus$COLD_START;
                info_general_log$token_passing_pdu_contents_response_device_status_more_status_available = message$body$tokenPassingPDU$tokenPassingPDUContentsResponse$deviceStatus$MORE_STATUS_AVAILABLE;
                info_general_log$token_passing_pdu_contents_response_device_status_loop_current_fixed = message$body$tokenPassingPDU$tokenPassingPDUContentsResponse$deviceStatus$LOOP_CURRENT_FIXED;
                info_general_log$token_passing_pdu_contents_response_device_status_loop_current_saturated = message$body$tokenPassingPDU$tokenPassingPDUContentsResponse$deviceStatus$LOOP_CURRENT_SATURATED;
                info_general_log$token_passing_pdu_contents_response_device_status_non_primary_variable_out_of_limits = message$body$tokenPassingPDU$tokenPassingPDUContentsResponse$deviceStatus$NON_PRIMARY_VARIABLE_OUT_OF_LIMITS;
                info_general_log$token_passing_pdu_contents_response_device_status_primary_variable_out_of_limits = message$body$tokenPassingPDU$tokenPassingPDUContentsResponse$deviceStatus$PRIMARY_VARIABLE_OUT_OF_LIMITS;
                if (message$body$tokenPassingPDU$tokenPassingPDUContentsResponse?$command){
                    info_general_log$command_number_link_id = message$body$tokenPassingPDU$tokenPassingPDUContentsResponse$command$commandNumberLinkID;
                    if (message$body$tokenPassingPDU$tokenPassingPDUContentsResponse$command?$data){
                        info_general_log$token_passing_pdu_contents_data_data = message$body$tokenPassingPDU$tokenPassingPDUContentsResponse$command$data;
                    }
                }
            }
            info_general_log$token_passing_pdu_check_byte = message$body$tokenPassingPDU$checkByte;
        }
        if (message$body?$directPDU){
            info_general_log$direct_pdu_command_link_id = message$body$directPDU$directPDUCommandLinkID;
            info_general_log$direct_pdu_device_status_device_malfunction = message$body$directPDU$deviceStatus$DEVICE_MALFUNCTION;
            info_general_log$direct_pdu_device_status_configuration_changed = message$body$directPDU$deviceStatus$CONFIGURATION_CHANGED;
            info_general_log$direct_pdu_device_status_cold_start = message$body$directPDU$deviceStatus$COLD_START;
            info_general_log$direct_pdu_device_status_more_status_available = message$body$directPDU$deviceStatus$MORE_STATUS_AVAILABLE;
            info_general_log$direct_pdu_device_status_loop_current_fixed = message$body$directPDU$deviceStatus$LOOP_CURRENT_FIXED;
            info_general_log$direct_pdu_device_status_loop_current_saturated = message$body$directPDU$deviceStatus$LOOP_CURRENT_SATURATED;
            info_general_log$direct_pdu_device_status_non_primary_variable_out_of_limits = message$body$directPDU$deviceStatus$NON_PRIMARY_VARIABLE_OUT_OF_LIMITS;
            info_general_log$direct_pdu_device_status_primary_variable_out_of_limits = message$body$directPDU$deviceStatus$PRIMARY_VARIABLE_OUT_OF_LIMITS;
            info_general_log$direct_pdu_extended_status_undefined_bits = message$body$directPDU$extendedStatus$UNDEFINED_BITS;
            info_general_log$direct_pdu_extended_status_function_check = message$body$directPDU$extendedStatus$FUNCTION_CHECK;
            info_general_log$direct_pdu_extended_status_out_of_specification = message$body$directPDU$extendedStatus$OUT_OF_SPECIFICATION;
            info_general_log$direct_pdu_extended_status_failure = message$body$directPDU$extendedStatus$FAILURE;
            info_general_log$direct_pdu_extended_status_critical_power_failure = message$body$directPDU$extendedStatus$CRITICAL_POWER_FAILURE;
            info_general_log$direct_pdu_extended_status_device_variable_alert = message$body$directPDU$extendedStatus$DEVICE_VARIABLE_ALERT;
            info_general_log$direct_pdu_extended_status_maintenance_required = message$body$directPDU$extendedStatus$MAINTENANCE_REQUIRED;
        }
        if (message$body?$readAuditLog){
            info_general_log$session_log_record_link_id = message$body$readAuditLog$sessionLogRecordLinkID;
            info_general_log$read_audit_log_start_record = message$body$readAuditLog$startRecord;
            info_general_log$read_audit_log_number_of_records = message$body$readAuditLog$numberOfRecords;
            if (message$body$readAuditLog?$powerUpTime){
                info_general_log$read_audit_log_power_up_time = double_to_time(message$body$readAuditLog$powerUpTime);
            }
            if (message$body$readAuditLog?$lastSecurityChange){
                info_general_log$read_audit_log_last_security_change = double_to_time(message$body$readAuditLog$lastSecurityChange);
            }
            if (message$body$readAuditLog?$serverStatus){
                info_general_log$read_audit_log_server_status_undefined_bits = message$body$readAuditLog$serverStatus$UNDEFINED_BITS;
                info_general_log$read_audit_log_server_status_insecure_syslog_connection = message$body$readAuditLog$serverStatus$INSECURE_SYSLOG_CONNECTION;
                info_general_log$read_audit_log_server_status_syslog_server_located_but_connection_failed = message$body$readAuditLog$serverStatus$SYSLOG_SERVER_LOCATED_BUT_CONNECTION_FAILED;
                info_general_log$read_audit_log_server_status_unable_to_locate_syslog_server = message$body$readAuditLog$serverStatus$UNABLE_TO_LOCATE_SYSLOG_SERVER;
            }
            if (message$body$readAuditLog?$sessionRecordSize){
                info_general_log$read_audit_log_session_record_size = message$body$readAuditLog$sessionRecordSize;
            }
            if (message$body$readAuditLog?$sessionLogRecords){
            }
        }
    }
    if (message?$packetBytes){
        info_general_log$message_packet_bytes = message$packetBytes;
    }
    HART_IP::emit_hart_ip_general_log(c);
}

event HART_IP::DirectPDUCommandEvt (c: connection, is_orig: bool, directpducommand: HART_IP::DirectPDUCommand) {
    hook set_session_direct_pdu_command_log(c);

    local info_direct_pdu_command_log = c$hart_ip_direct_pdu_command_log;

    info_direct_pdu_command_log$direct_pdu_command_link_id = directpducommand$directPDUCommandLinkID;
    info_direct_pdu_command_log$direct_pdu_command_command_number = HART_IP_ENUM::COMMAND_NUMBER16_BIT[directpducommand$commandNumber];
    info_direct_pdu_command_log$direct_pdu_command_byte_count = directpducommand$byteCount;
    if (directpducommand?$directPDUContentsRequest){
        if (directpducommand$directPDUContentsRequest?$command){
            info_direct_pdu_command_log$command_number_link_id = directpducommand$directPDUContentsRequest$command$commandNumberLinkID;
            if (directpducommand$directPDUContentsRequest$command?$data){
                info_direct_pdu_command_log$direct_pdu_command_data_data = directpducommand$directPDUContentsRequest$command$data;
            }
        }
    }
    if (directpducommand?$directPDUContentsResponse){
        info_direct_pdu_command_log$direct_pdu_contents_response_response_code = directpducommand$directPDUContentsResponse$responseCode;
        if (directpducommand$directPDUContentsResponse?$command){
            info_direct_pdu_command_log$command_number_link_id = directpducommand$directPDUContentsResponse$command$commandNumberLinkID;
            if (directpducommand$directPDUContentsResponse$command?$data){
                info_direct_pdu_command_log$direct_pdu_command_data_data = directpducommand$directPDUContentsResponse$command$data;
            }
        }
    }
    HART_IP::emit_hart_ip_direct_pdu_command_log(c);
}

event HART_IP::SessionLogRecordEvt (c: connection, is_orig: bool, sessionlogrecord: HART_IP::SessionLogRecord) {
    hook set_session_session_log_record_log(c);

    local info_session_log_record_log = c$hart_ip_session_log_record_log;

    info_session_log_record_log$session_log_record_link_id = sessionlogrecord$sessionLogRecordLinkID;
    info_session_log_record_log$session_log_record_client_i_pv4_address = sessionlogrecord$clientIPv4Address;
    info_session_log_record_log$session_log_record_client_i_pv6_address = sessionlogrecord$clientIPv6Address;
    info_session_log_record_log$session_log_record_client_port = sessionlogrecord$clientPort;
    info_session_log_record_log$session_log_record_server_port = sessionlogrecord$serverPort;
    info_session_log_record_log$session_log_record_connect_time = double_to_time(sessionlogrecord$connectTime);
    info_session_log_record_log$session_log_record_disconnect_time = double_to_time(sessionlogrecord$disconnectTime);
    info_session_log_record_log$session_log_record_session_status_summary_undefined_bits = sessionlogrecord$sessionStatusSummary$UNDEFINED_BITS;
    info_session_log_record_log$session_log_record_session_status_summary_insecure_session = sessionlogrecord$sessionStatusSummary$INSECURE_SESSION;
    info_session_log_record_log$session_log_record_session_status_summary_session_timeout = sessionlogrecord$sessionStatusSummary$SESSION_TIMEOUT;
    info_session_log_record_log$session_log_record_session_status_summary_aborted_session = sessionlogrecord$sessionStatusSummary$ABORTED_SESSION;
    info_session_log_record_log$session_log_record_session_status_summary_bad_session_initialization = sessionlogrecord$sessionStatusSummary$BAD_SESSION_INITIALIZATION;
    info_session_log_record_log$session_log_record_session_status_summary_writes_occured = sessionlogrecord$sessionStatusSummary$WRITES_OCCURED;
    info_session_log_record_log$session_log_record_start_configuration_change_count = sessionlogrecord$startConfigurationChangeCount;
    info_session_log_record_log$session_log_record_end_configuration_change_count = sessionlogrecord$endConfigurationChangeCount;
    info_session_log_record_log$session_log_record_num_publish_pdu = sessionlogrecord$numPublishPDU;
    info_session_log_record_log$session_log_record_num_request_pdu = sessionlogrecord$numRequestPDU;
    info_session_log_record_log$session_log_record_num_response_pdu = sessionlogrecord$numResponsePDU;
    HART_IP::emit_hart_ip_session_log_record_log(c);
}


