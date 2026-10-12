# Copyright 2024, Battelle Energy Alliance, LLC, ALL RIGHTS RESERVED
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

    ## TCP ports assigned directly to the HART-IP TCP analyzer.
    const tcp_ports: set[port] = {
        5094/tcp,
    } &redef;

    ## UDP ports assigned directly to the HART-IP UDP analyzer.
    const udp_ports: set[port] = {
        5094/udp,
    } &redef;
}

# redefine connection record to contain one of each of the hart_ip records
redef record connection += {
    hart_ip_general_log: general_log &optional;
    hart_ip_direct_pdu_command_log: direct_pdu_command_log &optional;
    hart_ip_session_log_record_log: session_log_record_log &optional;
    hart_ip_common_commands_log: HART_IP_COMMON_COMMANDS::common_commands_log &optional;
    hart_ip_universal_commands_log: HART_IP_UNIVERSAL_COMMANDS::universal_commands_log &optional;
};

# Additional HART-IP ports supplied through env variable.
global hartip_ports_str: string = getenv("ZEEK_HART_IP_PORTS");

function add_environment_ports()
    {
    if ( hartip_ports_str == "" )
        return;

    local custom_ports = split_string(hartip_ports_str, /,/);

    for ( port_idx in custom_ports )
        {
        local port_string = strip(custom_ports[port_idx]);

        if ( /^[0-9]{1,5}\/(tcp|udp)$/ !in port_string )
            {
            Reporter::warning(fmt("Ignoring invalid ZEEK_HART_IP_PORTS entry '%s'; expected NUMBER/tcp or NUMBER/udp", port_string));
            next;
            }

        local port_parts = split_string(port_string, /\//);
        local port_number = to_count(port_parts[0]);

        if ( port_number > 65535 )
            {
            Reporter::warning(fmt("Ignoring out-of-range ZEEK_HART_IP_PORTS entry '%s'", port_string));
            next;
            }

        if ( port_parts[1] == "tcp" )
            add tcp_ports[count_to_port(port_number, tcp)];
        else
            add udp_ports[count_to_port(port_number, udp)];
        }
    }

# Initialization Function
event zeek_init() &priority=5 {
    add_environment_ports();

    for ( p in tcp_ports )
        add likely_server_ports[p];

    for ( p in udp_ports )
        add likely_server_ports[p];

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
    Analyzer::register_for_ports(Analyzer::ANALYZER_SPICY_HART_IP_TCP, tcp_ports);
    Analyzer::register_for_ports(Analyzer::ANALYZER_SPICY_HART_IP_UDP, udp_ports);
}

function emit_hart_ip_general_log(c: connection) {
    if (! c?$hart_ip_general_log )
        return;
    Log::write(HART_IP::LOG_GENERAL_LOG, c$hart_ip_general_log);
    delete c$hart_ip_general_log;
}

function emit_hart_ip_direct_pdu_command_log(c: connection) {
    if (! c?$hart_ip_direct_pdu_command_log )
        return;
    Log::write(HART_IP::LOG_DIRECT_PDU_COMMAND_LOG, c$hart_ip_direct_pdu_command_log);
    delete c$hart_ip_direct_pdu_command_log;
}

function emit_hart_ip_session_log_record_log(c: connection) {
    if (! c?$hart_ip_session_log_record_log )
        return;
    Log::write(HART_IP::LOG_SESSION_LOG_RECORD_LOG, c$hart_ip_session_log_record_log);
    delete c$hart_ip_session_log_record_log;
}

function emit_hart_ip_common_commands_log(c: connection) {
    if (! c?$hart_ip_common_commands_log )
        return;
    Log::write(HART_IP::LOG_COMMON_COMMANDS_LOG, c$hart_ip_common_commands_log);
    delete c$hart_ip_common_commands_log;
}

function emit_hart_ip_universal_commands_log(c: connection) {
    if (! c?$hart_ip_universal_commands_log )
        return;
    Log::write(HART_IP::LOG_UNIVERSAL_COMMANDS_LOG, c$hart_ip_universal_commands_log);
    delete c$hart_ip_universal_commands_log;
}

