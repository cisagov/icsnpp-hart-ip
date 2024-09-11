spicy_add_analyzer(
    NAME HART_IP
    PACKAGE_NAME HART_IP
    SOURCES zeek_hart_ip.spicy hart_ip_conversion.spicy hart_ip_conversion.cc hart_ip_generateid.spicy hart_ip_generateid.cc hart_ip.spicy hart_ip.evt hart_ip_enum.spicy hart_ip_common_commands.spicy hart_ip_common_commands.evt hart_ip_universal_commands.spicy hart_ip_universal_commands.evt
    SCRIPTS __load__.zeek main.zeek hart_ip_types.zeek hart_ip_processing.zeek hart_ip_enum.zeek hart_ip_common_commands_types.zeek hart_ip_common_commands_processing.zeek hart_ip_universal_commands_types.zeek hart_ip_universal_commands_processing.zeek
)
