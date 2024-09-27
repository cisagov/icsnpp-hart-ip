##! main.zeek
##!
##! ICSNPP-HART_IP
##!
##! Zeek script type/record definitions describing the information
##! that will be written to the log files.
##!

module HART_IP;

export {
    redef enum Log::ID += {
                            LOG_GENERAL_LOG,
                            LOG_DIRECT_PDU_COMMAND_LOG,
                            LOG_SESSION_LOG_RECORD_LOG,
                            LOG_COMMON_COMMANDS_LOG,
                            LOG_UNIVERSAL_COMMANDS_LOG
                           };

    global log_general_log: event(rec: general_log);
    global log_policy_general_log: Log::PolicyHook;
    global log_direct_pdu_command_log: event(rec: direct_pdu_command_log);
    global log_policy_direct_pdu_command_log: Log::PolicyHook;
    global log_session_log_record_log: event(rec: session_log_record_log);
    global log_policy_session_log_record_log: Log::PolicyHook;
    global log_common_commands_log: event(rec: HART_IP_COMMON_COMMANDS::common_commands_log);
    global log_policy_common_commands_log: Log::PolicyHook;
    global log_universal_commands_log: event(rec: HART_IP_UNIVERSAL_COMMANDS::universal_commands_log);
    global log_policy_universal_commands_log: Log::PolicyHook;
    global emit_hart_ip_general_log: function(c: connection);
    global emit_hart_ip_direct_pdu_command_log: function(c: connection);
    global emit_hart_ip_session_log_record_log: function(c: connection);
    global emit_hart_ip_common_commands_log: function(c: connection);
    global emit_hart_ip_universal_commands_log: function(c: connection);

}

# redefine connection record to contain one of each of the hart_ip records
redef record connection += {
    hart_ip_proto: string &optional;
    hart_ip_general_log: general_log &optional;
    hart_ip_direct_pdu_command_log: direct_pdu_command_log &optional;
    hart_ip_session_log_record_log: session_log_record_log &optional;
    hart_ip_common_commands_log: HART_IP_COMMON_COMMANDS::common_commands_log &optional;
    hart_ip_universal_commands_log: HART_IP_UNIVERSAL_COMMANDS::universal_commands_log &optional;
};

# Define tcp ports
const tcp_ports = {
    5094/tcp,
};

# Define udp ports
const udp_ports = {
    5094/udp,
};

# Initialization Function
event zeek_init() &priority=5 {
    # initialize logging streams for all hart_ip logs
    Log::create_stream(HART_IP::LOG_GENERAL_LOG,
    [$columns=general_log,
    $ev=log_general_log,
    $path="hart_ip_general",
    $policy=log_policy_general_log]);
    Log::create_stream(HART_IP::LOG_DIRECT_PDU_COMMAND_LOG,
    [$columns=direct_pdu_command_log,
    $ev=log_direct_pdu_command_log,
    $path="hart_ip_direct_pdu_command",
    $policy=log_policy_direct_pdu_command_log]);
    Log::create_stream(HART_IP::LOG_SESSION_LOG_RECORD_LOG,
    [$columns=session_log_record_log,
    $ev=log_session_log_record_log,
    $path="hart_ip_session_record",
    $policy=log_policy_session_log_record_log]);
    Log::create_stream(HART_IP::LOG_COMMON_COMMANDS_LOG,
    [$columns=HART_IP_COMMON_COMMANDS::common_commands_log,
    $ev=log_common_commands_log,
    $path="hart_ip_common_commands",
    $policy=log_policy_common_commands_log]);
    Log::create_stream(HART_IP::LOG_UNIVERSAL_COMMANDS_LOG,
    [$columns=HART_IP_UNIVERSAL_COMMANDS::universal_commands_log,
    $ev=log_universal_commands_log,
    $path="hart_ip_universal_commands",
    $policy=log_policy_universal_commands_log]);
    Analyzer::register_for_ports(Analyzer::HART_IP_TCP, tcp_ports);
    Analyzer::register_for_ports(Analyzer::HART_IP_UDP, udp_ports);
}

function emit_hart_ip_general_log(c: connection) {
    if (! c?$hart_ip_general_log )
        return;
    if ( c?$hart_ip_proto )
        c$hart_ip_general_log$proto = c$hart_ip_proto;
    Log::write(HART_IP::LOG_GENERAL_LOG, c$hart_ip_general_log);
    delete c$hart_ip_general_log;
}

function emit_hart_ip_direct_pdu_command_log(c: connection) {
    if (! c?$hart_ip_direct_pdu_command_log )
        return;
    if ( c?$hart_ip_proto )
        c$hart_ip_direct_pdu_command_log$proto = c$hart_ip_proto;
    Log::write(HART_IP::LOG_DIRECT_PDU_COMMAND_LOG, c$hart_ip_direct_pdu_command_log);
    delete c$hart_ip_direct_pdu_command_log;
}

function emit_hart_ip_session_log_record_log(c: connection) {
    if (! c?$hart_ip_session_log_record_log )
        return;
    if ( c?$hart_ip_proto )
        c$hart_ip_session_log_record_log$proto = c$hart_ip_proto;
    Log::write(HART_IP::LOG_SESSION_LOG_RECORD_LOG, c$hart_ip_session_log_record_log);
    delete c$hart_ip_session_log_record_log;
}

function emit_hart_ip_common_commands_log(c: connection) {
    if (! c?$hart_ip_common_commands_log )
        return;
    if ( c?$hart_ip_proto )
        c$hart_ip_common_commands_log$proto = c$hart_ip_proto;
    Log::write(HART_IP::LOG_COMMON_COMMANDS_LOG, c$hart_ip_common_commands_log);
    delete c$hart_ip_common_commands_log;
}

function emit_hart_ip_universal_commands_log(c: connection) {
    if (! c?$hart_ip_universal_commands_log )
        return;
    if ( c?$hart_ip_proto )
        c$hart_ip_universal_commands_log$proto = c$hart_ip_proto;
    Log::write(HART_IP::LOG_UNIVERSAL_COMMANDS_LOG, c$hart_ip_universal_commands_log);
    delete c$hart_ip_universal_commands_log;
}


