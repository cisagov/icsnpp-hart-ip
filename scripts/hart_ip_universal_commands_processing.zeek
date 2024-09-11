module HART_IP_UNIVERSAL_COMMANDS;

hook set_session_universal_commands_log(c: connection) {
    if ( ! c?$hart_ip_universal_commands_log )
        c$hart_ip_universal_commands_log = universal_commands_log(
            $ts=network_time(),
            $uid=c$uid,
            $id=c$id,
            $proto="hart_ip");
}

event HART_IP_UNIVERSAL_COMMANDS::ReadUniqueIdentifierResponseEvt (c: connection, is_orig: bool, readuniqueidentifierresponse: HART_IP_UNIVERSAL_COMMANDS::ReadUniqueIdentifierResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readuniqueidentifierresponse$commandNumberLinkID;
    info_universal_commands_log$read_unique_identifier_response__254 = readuniqueidentifierresponse$_254;
    info_universal_commands_log$read_unique_identifier_response_expanded_device_type = HART_IP_ENUM::EXPANDED_DEVICE_TYPE_CODES[readuniqueidentifierresponse$expandedDeviceType];
    info_universal_commands_log$read_unique_identifier_response_minimum_preambles_master_slave = readuniqueidentifierresponse$minimumPreamblesMasterSlave;
    info_universal_commands_log$read_unique_identifier_response_hart_protocol_major_revision = readuniqueidentifierresponse$hartProtocolMajorRevision;
    info_universal_commands_log$read_unique_identifier_response_device_revision_level = readuniqueidentifierresponse$deviceRevisionLevel;
    info_universal_commands_log$read_unique_identifier_response_software_revision_level = readuniqueidentifierresponse$softwareRevisionLevel;
    info_universal_commands_log$read_unique_identifier_response_hardware_revision_level_and_physical_signaling_codes_hardware_revision_level = readuniqueidentifierresponse$hardwareRevisionLevelAndPhysicalSignalingCodes$hardwareRevisionLevel;
    info_universal_commands_log$read_unique_identifier_response_hardware_revision_level_and_physical_signaling_codes_physical_signaling_code = HART_IP_ENUM::PHYSICAL_SIGNALING_CODES[readuniqueidentifierresponse$hardwareRevisionLevelAndPhysicalSignalingCodes$physicalSignalingCode];
    info_universal_commands_log$read_unique_identifier_response_flags_c8_psk_in_multi_drop_only = readuniqueidentifierresponse$flags$C8PSK_IN_MULTI_DROP_ONLY;
    info_universal_commands_log$read_unique_identifier_response_flags_c8_psk_capable_field_device = readuniqueidentifierresponse$flags$C8PSK_CAPABLE_FIELD_DEVICE;
    info_universal_commands_log$read_unique_identifier_response_flags_undefined_5 = readuniqueidentifierresponse$flags$UNDEFINED_5;
    info_universal_commands_log$read_unique_identifier_response_flags_safehart_capable_field_device = readuniqueidentifierresponse$flags$SAFEHART_CAPABLE_FIELD_DEVICE;
    info_universal_commands_log$read_unique_identifier_response_flags_ieee_802_15_4_dsss_o_qpsk_modulation = readuniqueidentifierresponse$flags$IEEE_802_15_4_DSSS_O_QPSK_MODULATION;
    info_universal_commands_log$read_unique_identifier_response_flags_protocol_bridge_device = readuniqueidentifierresponse$flags$PROTOCOL_BRIDGE_DEVICE;
    info_universal_commands_log$read_unique_identifier_response_flags_eeprom_control = readuniqueidentifierresponse$flags$EEPROM_CONTROL;
    info_universal_commands_log$read_unique_identifier_response_flags_mutli_sensor_field_device = readuniqueidentifierresponse$flags$MUTLI_SENSOR_FIELD_DEVICE;
    info_universal_commands_log$read_unique_identifier_response_device_id = readuniqueidentifierresponse$deviceID;
    info_universal_commands_log$read_unique_identifier_response_number_preambles_slave_master = readuniqueidentifierresponse$numberPreamblesSlaveMaster;
    info_universal_commands_log$read_unique_identifier_response_last_device_variable_this = readuniqueidentifierresponse$lastDeviceVariableThis;
    info_universal_commands_log$read_unique_identifier_response_configuration_change_counter = readuniqueidentifierresponse$configurationChangeCounter;
    info_universal_commands_log$read_unique_identifier_response_extended_field_device_status_undefined_bit_7 = readuniqueidentifierresponse$extendedFieldDeviceStatus$UNDEFINED_BIT_7;
    info_universal_commands_log$read_unique_identifier_response_extended_field_device_status_undefined_bit_6 = readuniqueidentifierresponse$extendedFieldDeviceStatus$UNDEFINED_BIT_6;
    info_universal_commands_log$read_unique_identifier_response_extended_field_device_status_function_check = readuniqueidentifierresponse$extendedFieldDeviceStatus$FUNCTION_CHECK;
    info_universal_commands_log$read_unique_identifier_response_extended_field_device_status_out_of_specification = readuniqueidentifierresponse$extendedFieldDeviceStatus$OUT_OF_SPECIFICATION;
    info_universal_commands_log$read_unique_identifier_response_extended_field_device_status_failure = readuniqueidentifierresponse$extendedFieldDeviceStatus$FAILURE;
    info_universal_commands_log$read_unique_identifier_response_extended_field_device_status_critical_power_failure = readuniqueidentifierresponse$extendedFieldDeviceStatus$CRITICAL_POWER_FAILURE;
    info_universal_commands_log$read_unique_identifier_response_extended_field_device_status_device_variable_alert = readuniqueidentifierresponse$extendedFieldDeviceStatus$DEVICE_VARIABLE_ALERT;
    info_universal_commands_log$read_unique_identifier_response_extended_field_device_status_maintenance_required = readuniqueidentifierresponse$extendedFieldDeviceStatus$MAINTENANCE_REQUIRED;
    info_universal_commands_log$read_unique_identifier_response_manufacturer_identification_code = HART_IP_ENUM::MANUFACTURER_IDENTIFICATION_CODES[readuniqueidentifierresponse$manufacturerIdentificationCode];
    info_universal_commands_log$read_unique_identifier_response_private_label_distributor_code = HART_IP_ENUM::MANUFACTURER_IDENTIFICATION_CODES[readuniqueidentifierresponse$privateLabelDistributorCode];
    info_universal_commands_log$read_unique_identifier_response_device_profile = HART_IP_ENUM::DEVICE_PROFILE_CODES[readuniqueidentifierresponse$deviceProfile];
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadPrimaryVariableResponseEvt (c: connection, is_orig: bool, readprimaryvariableresponse: HART_IP_UNIVERSAL_COMMANDS::ReadPrimaryVariableResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readprimaryvariableresponse$commandNumberLinkID;
    info_universal_commands_log$read_primary_variable_response_primary_variable_units = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readprimaryvariableresponse$primaryVariableUnits];
    info_universal_commands_log$read_primary_variable_response_primary_variable = readprimaryvariableresponse$primaryVariable;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadLoopCurrentResponseEvt (c: connection, is_orig: bool, readloopcurrentresponse: HART_IP_UNIVERSAL_COMMANDS::ReadLoopCurrentResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readloopcurrentresponse$commandNumberLinkID;
    info_universal_commands_log$read_loop_current_response_primary_variable_loop_current = readloopcurrentresponse$primaryVariableLoopCurrent;
    info_universal_commands_log$read_loop_current_response_primary_variable_percent_range = readloopcurrentresponse$primaryVariablePercentRange;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadDynamicVariableResponseEvt (c: connection, is_orig: bool, readdynamicvariableresponse: HART_IP_UNIVERSAL_COMMANDS::ReadDynamicVariableResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readdynamicvariableresponse$commandNumberLinkID;
    info_universal_commands_log$read_dynamic_variable_response_primary_variable_loop_current = readdynamicvariableresponse$primaryVariableLoopCurrent;
    if (readdynamicvariableresponse?$primaryVariableUnits){
        info_universal_commands_log$read_dynamic_variable_response_primary_variable_units = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdynamicvariableresponse$primaryVariableUnits];
    }
    if (readdynamicvariableresponse?$primaryVariable){
        info_universal_commands_log$read_dynamic_variable_response_primary_variable = readdynamicvariableresponse$primaryVariable;
    }
    if (readdynamicvariableresponse?$secondaryVariableUnits){
        info_universal_commands_log$read_dynamic_variable_response_secondary_variable_units = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdynamicvariableresponse$secondaryVariableUnits];
    }
    if (readdynamicvariableresponse?$secondaryVariable){
        info_universal_commands_log$read_dynamic_variable_response_secondary_variable = readdynamicvariableresponse$secondaryVariable;
    }
    if (readdynamicvariableresponse?$tertiaryVariableUnits){
        info_universal_commands_log$read_dynamic_variable_response_tertiary_variable_units = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdynamicvariableresponse$tertiaryVariableUnits];
    }
    if (readdynamicvariableresponse?$tertiaryVariable){
        info_universal_commands_log$read_dynamic_variable_response_tertiary_variable = readdynamicvariableresponse$tertiaryVariable;
    }
    if (readdynamicvariableresponse?$quaternaryVariableUnits){
        info_universal_commands_log$read_dynamic_variable_response_quaternary_variable_units = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdynamicvariableresponse$quaternaryVariableUnits];
    }
    if (readdynamicvariableresponse?$quaternaryVariable){
        info_universal_commands_log$read_dynamic_variable_response_quaternary_variable = readdynamicvariableresponse$quaternaryVariable;
    }
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::WritePollingAddressEvt (c: connection, is_orig: bool, writepollingaddress: HART_IP_UNIVERSAL_COMMANDS::WritePollingAddress) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = writepollingaddress$commandNumberLinkID;
    info_universal_commands_log$write_polling_address_polling_address_device = writepollingaddress$pollingAddressDevice;
    if (writepollingaddress?$loopCurrentMode){
        info_universal_commands_log$write_polling_address_loop_current_mode = HART_IP_ENUM::LOOP_CURRENT_MODE_CODES[writepollingaddress$loopCurrentMode];
    }
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadLoopConfigurationResponseEvt (c: connection, is_orig: bool, readloopconfigurationresponse: HART_IP_UNIVERSAL_COMMANDS::ReadLoopConfigurationResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readloopconfigurationresponse$commandNumberLinkID;
    info_universal_commands_log$read_loop_configuration_response_polling_address_device = readloopconfigurationresponse$pollingAddressDevice;
    info_universal_commands_log$read_loop_configuration_response_loop_current_mode = HART_IP_ENUM::LOOP_CURRENT_MODE_CODES[readloopconfigurationresponse$loopCurrentMode];
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadDynamicVariableClassificationsResponseEvt (c: connection, is_orig: bool, readdynamicvariableclassificationsresponse: HART_IP_UNIVERSAL_COMMANDS::ReadDynamicVariableClassificationsResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readdynamicvariableclassificationsresponse$commandNumberLinkID;
    info_universal_commands_log$read_dynamic_variable_classifications_response_primary_variable_classification = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdynamicvariableclassificationsresponse$primaryVariableClassification];
    info_universal_commands_log$read_dynamic_variable_classifications_response_secondary_variable_classification = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdynamicvariableclassificationsresponse$secondaryVariableClassification];
    info_universal_commands_log$read_dynamic_variable_classifications_response_tertiary_variable_classification = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdynamicvariableclassificationsresponse$tertiaryVariableClassification];
    info_universal_commands_log$read_dynamic_variable_classifications_response_quaternary_variable_classification = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdynamicvariableclassificationsresponse$quaternaryVariableClassification];
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadDeviceVariableRequestEvt (c: connection, is_orig: bool, readdevicevariablerequest: HART_IP_UNIVERSAL_COMMANDS::ReadDeviceVariableRequest) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readdevicevariablerequest$commandNumberLinkID;
    if (readdevicevariablerequest?$slot0DeviceVariableCode){
        info_universal_commands_log$read_device_variable_request_slot0_device_variable_code = readdevicevariablerequest$slot0DeviceVariableCode;
    }
    if (readdevicevariablerequest?$slot1DeviceVariableCode){
        info_universal_commands_log$read_device_variable_request_slot1_device_variable_code = readdevicevariablerequest$slot1DeviceVariableCode;
    }
    if (readdevicevariablerequest?$slot2DeviceVariableCode){
        info_universal_commands_log$read_device_variable_request_slot2_device_variable_code = readdevicevariablerequest$slot2DeviceVariableCode;
    }
    if (readdevicevariablerequest?$slot3DeviceVariableCode){
        info_universal_commands_log$read_device_variable_request_slot3_device_variable_code = readdevicevariablerequest$slot3DeviceVariableCode;
    }
    if (readdevicevariablerequest?$slot4DeviceVariableCode){
        info_universal_commands_log$read_device_variable_request_slot4_device_variable_code = readdevicevariablerequest$slot4DeviceVariableCode;
    }
    if (readdevicevariablerequest?$slot5DeviceVariableCode){
        info_universal_commands_log$read_device_variable_request_slot5_device_variable_code = readdevicevariablerequest$slot5DeviceVariableCode;
    }
    if (readdevicevariablerequest?$slot6DeviceVariableCode){
        info_universal_commands_log$read_device_variable_request_slot6_device_variable_code = readdevicevariablerequest$slot6DeviceVariableCode;
    }
    if (readdevicevariablerequest?$slot7DeviceVariableCode){
        info_universal_commands_log$read_device_variable_request_slot7_device_variable_code = readdevicevariablerequest$slot7DeviceVariableCode;
    }
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadDeviceVariableResponseEvt (c: connection, is_orig: bool, readdevicevariableresponse: HART_IP_UNIVERSAL_COMMANDS::ReadDeviceVariableResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readdevicevariableresponse$commandNumberLinkID;
    info_universal_commands_log$read_device_variable_response_extended_field_device_status_undefined_bit_7 = readdevicevariableresponse$extendedFieldDeviceStatus$UNDEFINED_BIT_7;
    info_universal_commands_log$read_device_variable_response_extended_field_device_status_undefined_bit_6 = readdevicevariableresponse$extendedFieldDeviceStatus$UNDEFINED_BIT_6;
    info_universal_commands_log$read_device_variable_response_extended_field_device_status_function_check = readdevicevariableresponse$extendedFieldDeviceStatus$FUNCTION_CHECK;
    info_universal_commands_log$read_device_variable_response_extended_field_device_status_out_of_specification = readdevicevariableresponse$extendedFieldDeviceStatus$OUT_OF_SPECIFICATION;
    info_universal_commands_log$read_device_variable_response_extended_field_device_status_failure = readdevicevariableresponse$extendedFieldDeviceStatus$FAILURE;
    info_universal_commands_log$read_device_variable_response_extended_field_device_status_critical_power_failure = readdevicevariableresponse$extendedFieldDeviceStatus$CRITICAL_POWER_FAILURE;
    info_universal_commands_log$read_device_variable_response_extended_field_device_status_device_variable_alert = readdevicevariableresponse$extendedFieldDeviceStatus$DEVICE_VARIABLE_ALERT;
    info_universal_commands_log$read_device_variable_response_extended_field_device_status_maintenance_required = readdevicevariableresponse$extendedFieldDeviceStatus$MAINTENANCE_REQUIRED;
    if (readdevicevariableresponse?$slot0DeviceVariableCode){
        info_universal_commands_log$read_device_variable_response_slot0_device_variable_code = readdevicevariableresponse$slot0DeviceVariableCode;
    }
    if (readdevicevariableresponse?$slot0DeviceVariableClass){
        info_universal_commands_log$read_device_variable_response_slot0_device_variable_class = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdevicevariableresponse$slot0DeviceVariableClass];
    }
    if (readdevicevariableresponse?$slot0UnitsCode){
        info_universal_commands_log$read_device_variable_response_slot0_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariableresponse$slot0UnitsCode];
    }
    if (readdevicevariableresponse?$slot0DeviceVariable){
        info_universal_commands_log$read_device_variable_response_slot0_device_variable = readdevicevariableresponse$slot0DeviceVariable;
    }
    if (readdevicevariableresponse?$slot0DeviceVariableStatus){
        info_universal_commands_log$read_device_variable_response_slot0_device_variable_status_process_data_status = HART_IP_ENUM::PROCESS_DATA_STATUS[readdevicevariableresponse$slot0DeviceVariableStatus$PROCESS_DATA_STATUS];
        info_universal_commands_log$read_device_variable_response_slot0_device_variable_status_limit_status = HART_IP_ENUM::LIMIT_STATUS[readdevicevariableresponse$slot0DeviceVariableStatus$LIMIT_STATUS];
        info_universal_commands_log$read_device_variable_response_slot0_device_variable_status_more_device_variable_status_available = readdevicevariableresponse$slot0DeviceVariableStatus$MORE_DEVICE_VARIABLE_STATUS_AVAILABLE;
        info_universal_commands_log$read_device_variable_response_slot0_device_variable_status_device_family_specific_status = readdevicevariableresponse$slot0DeviceVariableStatus$DEVICE_FAMILY_SPECIFIC_STATUS;
    }
    if (readdevicevariableresponse?$slot1DeviceVariableCode){
        info_universal_commands_log$read_device_variable_response_slot1_device_variable_code = readdevicevariableresponse$slot1DeviceVariableCode;
    }
    if (readdevicevariableresponse?$slot1DeviceVariableClass){
        info_universal_commands_log$read_device_variable_response_slot1_device_variable_class = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdevicevariableresponse$slot1DeviceVariableClass];
    }
    if (readdevicevariableresponse?$slot1UnitsCode){
        info_universal_commands_log$read_device_variable_response_slot1_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariableresponse$slot1UnitsCode];
    }
    if (readdevicevariableresponse?$slot1DeviceVariable){
        info_universal_commands_log$read_device_variable_response_slot1_device_variable = readdevicevariableresponse$slot1DeviceVariable;
    }
    if (readdevicevariableresponse?$slot1DeviceVariableStatus){
        info_universal_commands_log$read_device_variable_response_slot1_device_variable_status_process_data_status = HART_IP_ENUM::PROCESS_DATA_STATUS[readdevicevariableresponse$slot1DeviceVariableStatus$PROCESS_DATA_STATUS];
        info_universal_commands_log$read_device_variable_response_slot1_device_variable_status_limit_status = HART_IP_ENUM::LIMIT_STATUS[readdevicevariableresponse$slot1DeviceVariableStatus$LIMIT_STATUS];
        info_universal_commands_log$read_device_variable_response_slot1_device_variable_status_more_device_variable_status_available = readdevicevariableresponse$slot1DeviceVariableStatus$MORE_DEVICE_VARIABLE_STATUS_AVAILABLE;
        info_universal_commands_log$read_device_variable_response_slot1_device_variable_status_device_family_specific_status = readdevicevariableresponse$slot1DeviceVariableStatus$DEVICE_FAMILY_SPECIFIC_STATUS;
    }
    if (readdevicevariableresponse?$slot2DeviceVariableCode){
        info_universal_commands_log$read_device_variable_response_slot2_device_variable_code = readdevicevariableresponse$slot2DeviceVariableCode;
    }
    if (readdevicevariableresponse?$slot2DeviceVariableClass){
        info_universal_commands_log$read_device_variable_response_slot2_device_variable_class = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdevicevariableresponse$slot2DeviceVariableClass];
    }
    if (readdevicevariableresponse?$slot2UnitsCode){
        info_universal_commands_log$read_device_variable_response_slot2_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariableresponse$slot2UnitsCode];
    }
    if (readdevicevariableresponse?$slot2DeviceVariable){
        info_universal_commands_log$read_device_variable_response_slot2_device_variable = readdevicevariableresponse$slot2DeviceVariable;
    }
    if (readdevicevariableresponse?$slot2DeviceVariableStatus){
        info_universal_commands_log$read_device_variable_response_slot2_device_variable_status_process_data_status = HART_IP_ENUM::PROCESS_DATA_STATUS[readdevicevariableresponse$slot2DeviceVariableStatus$PROCESS_DATA_STATUS];
        info_universal_commands_log$read_device_variable_response_slot2_device_variable_status_limit_status = HART_IP_ENUM::LIMIT_STATUS[readdevicevariableresponse$slot2DeviceVariableStatus$LIMIT_STATUS];
        info_universal_commands_log$read_device_variable_response_slot2_device_variable_status_more_device_variable_status_available = readdevicevariableresponse$slot2DeviceVariableStatus$MORE_DEVICE_VARIABLE_STATUS_AVAILABLE;
        info_universal_commands_log$read_device_variable_response_slot2_device_variable_status_device_family_specific_status = readdevicevariableresponse$slot2DeviceVariableStatus$DEVICE_FAMILY_SPECIFIC_STATUS;
    }
    if (readdevicevariableresponse?$slot3DeviceVariableCode){
        info_universal_commands_log$read_device_variable_response_slot3_device_variable_code = readdevicevariableresponse$slot3DeviceVariableCode;
    }
    if (readdevicevariableresponse?$slot3DeviceVariableClass){
        info_universal_commands_log$read_device_variable_response_slot3_device_variable_class = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdevicevariableresponse$slot3DeviceVariableClass];
    }
    if (readdevicevariableresponse?$slot3UnitsCode){
        info_universal_commands_log$read_device_variable_response_slot3_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariableresponse$slot3UnitsCode];
    }
    if (readdevicevariableresponse?$slot3DeviceVariable){
        info_universal_commands_log$read_device_variable_response_slot3_device_variable = readdevicevariableresponse$slot3DeviceVariable;
    }
    if (readdevicevariableresponse?$slot3DeviceVariableStatus){
        info_universal_commands_log$read_device_variable_response_slot3_device_variable_status_process_data_status = HART_IP_ENUM::PROCESS_DATA_STATUS[readdevicevariableresponse$slot3DeviceVariableStatus$PROCESS_DATA_STATUS];
        info_universal_commands_log$read_device_variable_response_slot3_device_variable_status_limit_status = HART_IP_ENUM::LIMIT_STATUS[readdevicevariableresponse$slot3DeviceVariableStatus$LIMIT_STATUS];
        info_universal_commands_log$read_device_variable_response_slot3_device_variable_status_more_device_variable_status_available = readdevicevariableresponse$slot3DeviceVariableStatus$MORE_DEVICE_VARIABLE_STATUS_AVAILABLE;
        info_universal_commands_log$read_device_variable_response_slot3_device_variable_status_device_family_specific_status = readdevicevariableresponse$slot3DeviceVariableStatus$DEVICE_FAMILY_SPECIFIC_STATUS;
    }
    if (readdevicevariableresponse?$slot4DeviceVariableCode){
        info_universal_commands_log$read_device_variable_response_slot4_device_variable_code = readdevicevariableresponse$slot4DeviceVariableCode;
    }
    if (readdevicevariableresponse?$slot4DeviceVariableClass){
        info_universal_commands_log$read_device_variable_response_slot4_device_variable_class = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdevicevariableresponse$slot4DeviceVariableClass];
    }
    if (readdevicevariableresponse?$slot4UnitsCode){
        info_universal_commands_log$read_device_variable_response_slot4_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariableresponse$slot4UnitsCode];
    }
    if (readdevicevariableresponse?$slot4DeviceVariable){
        info_universal_commands_log$read_device_variable_response_slot4_device_variable = readdevicevariableresponse$slot4DeviceVariable;
    }
    if (readdevicevariableresponse?$slot4DeviceVariableStatus){
        info_universal_commands_log$read_device_variable_response_slot4_device_variable_status_process_data_status = HART_IP_ENUM::PROCESS_DATA_STATUS[readdevicevariableresponse$slot4DeviceVariableStatus$PROCESS_DATA_STATUS];
        info_universal_commands_log$read_device_variable_response_slot4_device_variable_status_limit_status = HART_IP_ENUM::LIMIT_STATUS[readdevicevariableresponse$slot4DeviceVariableStatus$LIMIT_STATUS];
        info_universal_commands_log$read_device_variable_response_slot4_device_variable_status_more_device_variable_status_available = readdevicevariableresponse$slot4DeviceVariableStatus$MORE_DEVICE_VARIABLE_STATUS_AVAILABLE;
        info_universal_commands_log$read_device_variable_response_slot4_device_variable_status_device_family_specific_status = readdevicevariableresponse$slot4DeviceVariableStatus$DEVICE_FAMILY_SPECIFIC_STATUS;
    }
    if (readdevicevariableresponse?$slot5DeviceVariableCode){
        info_universal_commands_log$read_device_variable_response_slot5_device_variable_code = readdevicevariableresponse$slot5DeviceVariableCode;
    }
    if (readdevicevariableresponse?$slot5DeviceVariableClass){
        info_universal_commands_log$read_device_variable_response_slot5_device_variable_class = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdevicevariableresponse$slot5DeviceVariableClass];
    }
    if (readdevicevariableresponse?$slot5UnitsCode){
        info_universal_commands_log$read_device_variable_response_slot5_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariableresponse$slot5UnitsCode];
    }
    if (readdevicevariableresponse?$slot5DeviceVariable){
        info_universal_commands_log$read_device_variable_response_slot5_device_variable = readdevicevariableresponse$slot5DeviceVariable;
    }
    if (readdevicevariableresponse?$slot5DeviceVariableStatus){
        info_universal_commands_log$read_device_variable_response_slot5_device_variable_status_process_data_status = HART_IP_ENUM::PROCESS_DATA_STATUS[readdevicevariableresponse$slot5DeviceVariableStatus$PROCESS_DATA_STATUS];
        info_universal_commands_log$read_device_variable_response_slot5_device_variable_status_limit_status = HART_IP_ENUM::LIMIT_STATUS[readdevicevariableresponse$slot5DeviceVariableStatus$LIMIT_STATUS];
        info_universal_commands_log$read_device_variable_response_slot5_device_variable_status_more_device_variable_status_available = readdevicevariableresponse$slot5DeviceVariableStatus$MORE_DEVICE_VARIABLE_STATUS_AVAILABLE;
        info_universal_commands_log$read_device_variable_response_slot5_device_variable_status_device_family_specific_status = readdevicevariableresponse$slot5DeviceVariableStatus$DEVICE_FAMILY_SPECIFIC_STATUS;
    }
    if (readdevicevariableresponse?$slot6DeviceVariableCode){
        info_universal_commands_log$read_device_variable_response_slot6_device_variable_code = readdevicevariableresponse$slot6DeviceVariableCode;
    }
    if (readdevicevariableresponse?$slot6DeviceVariableClass){
        info_universal_commands_log$read_device_variable_response_slot6_device_variable_class = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdevicevariableresponse$slot6DeviceVariableClass];
    }
    if (readdevicevariableresponse?$slot6UnitsCode){
        info_universal_commands_log$read_device_variable_response_slot6_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariableresponse$slot6UnitsCode];
    }
    if (readdevicevariableresponse?$slot6DeviceVariable){
        info_universal_commands_log$read_device_variable_response_slot6_device_variable = readdevicevariableresponse$slot6DeviceVariable;
    }
    if (readdevicevariableresponse?$slot6DeviceVariableStatus){
        info_universal_commands_log$read_device_variable_response_slot6_device_variable_status_process_data_status = HART_IP_ENUM::PROCESS_DATA_STATUS[readdevicevariableresponse$slot6DeviceVariableStatus$PROCESS_DATA_STATUS];
        info_universal_commands_log$read_device_variable_response_slot6_device_variable_status_limit_status = HART_IP_ENUM::LIMIT_STATUS[readdevicevariableresponse$slot6DeviceVariableStatus$LIMIT_STATUS];
        info_universal_commands_log$read_device_variable_response_slot6_device_variable_status_more_device_variable_status_available = readdevicevariableresponse$slot6DeviceVariableStatus$MORE_DEVICE_VARIABLE_STATUS_AVAILABLE;
        info_universal_commands_log$read_device_variable_response_slot6_device_variable_status_device_family_specific_status = readdevicevariableresponse$slot6DeviceVariableStatus$DEVICE_FAMILY_SPECIFIC_STATUS;
    }
    if (readdevicevariableresponse?$slot7DeviceVariableCode){
        info_universal_commands_log$read_device_variable_response_slot7_device_variable_code = readdevicevariableresponse$slot7DeviceVariableCode;
    }
    if (readdevicevariableresponse?$slot7DeviceVariableClass){
        info_universal_commands_log$read_device_variable_response_slot7_device_variable_class = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdevicevariableresponse$slot7DeviceVariableClass];
    }
    if (readdevicevariableresponse?$slot7UnitsCode){
        info_universal_commands_log$read_device_variable_response_slot7_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariableresponse$slot7UnitsCode];
    }
    if (readdevicevariableresponse?$slot7DeviceVariable){
        info_universal_commands_log$read_device_variable_response_slot7_device_variable = readdevicevariableresponse$slot7DeviceVariable;
    }
    if (readdevicevariableresponse?$slot7DeviceVariableStatus){
        info_universal_commands_log$read_device_variable_response_slot7_device_variable_status_process_data_status = HART_IP_ENUM::PROCESS_DATA_STATUS[readdevicevariableresponse$slot7DeviceVariableStatus$PROCESS_DATA_STATUS];
        info_universal_commands_log$read_device_variable_response_slot7_device_variable_status_limit_status = HART_IP_ENUM::LIMIT_STATUS[readdevicevariableresponse$slot7DeviceVariableStatus$LIMIT_STATUS];
        info_universal_commands_log$read_device_variable_response_slot7_device_variable_status_more_device_variable_status_available = readdevicevariableresponse$slot7DeviceVariableStatus$MORE_DEVICE_VARIABLE_STATUS_AVAILABLE;
        info_universal_commands_log$read_device_variable_response_slot7_device_variable_status_device_family_specific_status = readdevicevariableresponse$slot7DeviceVariableStatus$DEVICE_FAMILY_SPECIFIC_STATUS;
    }
    info_universal_commands_log$read_device_variable_response_slot0_time = readdevicevariableresponse$slot0Time;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadUniqueIdentifierTagRequestEvt (c: connection, is_orig: bool, readuniqueidentifiertagrequest: HART_IP_UNIVERSAL_COMMANDS::ReadUniqueIdentifierTagRequest) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readuniqueidentifiertagrequest$commandNumberLinkID;
    info_universal_commands_log$read_unique_identifier_tag_request_tag = readuniqueidentifiertagrequest$tag;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadUniqueIdentifierTagResponseEvt (c: connection, is_orig: bool, readuniqueidentifiertagresponse: HART_IP_UNIVERSAL_COMMANDS::ReadUniqueIdentifierTagResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readuniqueidentifiertagresponse$commandNumberLinkID;
    info_universal_commands_log$read_unique_identifier_tag_response__254 = readuniqueidentifiertagresponse$_254;
    info_universal_commands_log$read_unique_identifier_tag_response_expanded_device_type = HART_IP_ENUM::EXPANDED_DEVICE_TYPE_CODES[readuniqueidentifiertagresponse$expandedDeviceType];
    info_universal_commands_log$read_unique_identifier_tag_response_minimum_preambles_master_slave = readuniqueidentifiertagresponse$minimumPreamblesMasterSlave;
    info_universal_commands_log$read_unique_identifier_tag_response_hart_protocol_major_revision = readuniqueidentifiertagresponse$hartProtocolMajorRevision;
    info_universal_commands_log$read_unique_identifier_tag_response_device_revision_level = readuniqueidentifiertagresponse$deviceRevisionLevel;
    info_universal_commands_log$read_unique_identifier_tag_response_software_revision_level = readuniqueidentifiertagresponse$softwareRevisionLevel;
    info_universal_commands_log$read_unique_identifier_tag_response_hardware_revision_level_and_physical_signaling_codes_hardware_revision_level = readuniqueidentifiertagresponse$hardwareRevisionLevelAndPhysicalSignalingCodes$hardwareRevisionLevel;
    info_universal_commands_log$read_unique_identifier_tag_response_hardware_revision_level_and_physical_signaling_codes_physical_signaling_code = HART_IP_ENUM::PHYSICAL_SIGNALING_CODES[readuniqueidentifiertagresponse$hardwareRevisionLevelAndPhysicalSignalingCodes$physicalSignalingCode];
    info_universal_commands_log$read_unique_identifier_tag_response_flags_c8_psk_in_multi_drop_only = readuniqueidentifiertagresponse$flags$C8PSK_IN_MULTI_DROP_ONLY;
    info_universal_commands_log$read_unique_identifier_tag_response_flags_c8_psk_capable_field_device = readuniqueidentifiertagresponse$flags$C8PSK_CAPABLE_FIELD_DEVICE;
    info_universal_commands_log$read_unique_identifier_tag_response_flags_undefined_5 = readuniqueidentifiertagresponse$flags$UNDEFINED_5;
    info_universal_commands_log$read_unique_identifier_tag_response_flags_safehart_capable_field_device = readuniqueidentifiertagresponse$flags$SAFEHART_CAPABLE_FIELD_DEVICE;
    info_universal_commands_log$read_unique_identifier_tag_response_flags_ieee_802_15_4_dsss_o_qpsk_modulation = readuniqueidentifiertagresponse$flags$IEEE_802_15_4_DSSS_O_QPSK_MODULATION;
    info_universal_commands_log$read_unique_identifier_tag_response_flags_protocol_bridge_device = readuniqueidentifiertagresponse$flags$PROTOCOL_BRIDGE_DEVICE;
    info_universal_commands_log$read_unique_identifier_tag_response_flags_eeprom_control = readuniqueidentifiertagresponse$flags$EEPROM_CONTROL;
    info_universal_commands_log$read_unique_identifier_tag_response_flags_mutli_sensor_field_device = readuniqueidentifiertagresponse$flags$MUTLI_SENSOR_FIELD_DEVICE;
    info_universal_commands_log$read_unique_identifier_tag_response_device_id = readuniqueidentifiertagresponse$deviceID;
    info_universal_commands_log$read_unique_identifier_tag_response_number_preambles_slave_master = readuniqueidentifiertagresponse$numberPreamblesSlaveMaster;
    info_universal_commands_log$read_unique_identifier_tag_response_last_device_variable_this = readuniqueidentifiertagresponse$lastDeviceVariableThis;
    info_universal_commands_log$read_unique_identifier_tag_response_configuration_change_counter = readuniqueidentifiertagresponse$configurationChangeCounter;
    info_universal_commands_log$read_unique_identifier_tag_response_extended_field_device_status_undefined_bit_7 = readuniqueidentifiertagresponse$extendedFieldDeviceStatus$UNDEFINED_BIT_7;
    info_universal_commands_log$read_unique_identifier_tag_response_extended_field_device_status_undefined_bit_6 = readuniqueidentifiertagresponse$extendedFieldDeviceStatus$UNDEFINED_BIT_6;
    info_universal_commands_log$read_unique_identifier_tag_response_extended_field_device_status_function_check = readuniqueidentifiertagresponse$extendedFieldDeviceStatus$FUNCTION_CHECK;
    info_universal_commands_log$read_unique_identifier_tag_response_extended_field_device_status_out_of_specification = readuniqueidentifiertagresponse$extendedFieldDeviceStatus$OUT_OF_SPECIFICATION;
    info_universal_commands_log$read_unique_identifier_tag_response_extended_field_device_status_failure = readuniqueidentifiertagresponse$extendedFieldDeviceStatus$FAILURE;
    info_universal_commands_log$read_unique_identifier_tag_response_extended_field_device_status_critical_power_failure = readuniqueidentifiertagresponse$extendedFieldDeviceStatus$CRITICAL_POWER_FAILURE;
    info_universal_commands_log$read_unique_identifier_tag_response_extended_field_device_status_device_variable_alert = readuniqueidentifiertagresponse$extendedFieldDeviceStatus$DEVICE_VARIABLE_ALERT;
    info_universal_commands_log$read_unique_identifier_tag_response_extended_field_device_status_maintenance_required = readuniqueidentifiertagresponse$extendedFieldDeviceStatus$MAINTENANCE_REQUIRED;
    info_universal_commands_log$read_unique_identifier_tag_response_manufacturer_identification_code = HART_IP_ENUM::MANUFACTURER_IDENTIFICATION_CODES[readuniqueidentifiertagresponse$manufacturerIdentificationCode];
    info_universal_commands_log$read_unique_identifier_tag_response_private_label_distributor_code = HART_IP_ENUM::MANUFACTURER_IDENTIFICATION_CODES[readuniqueidentifiertagresponse$privateLabelDistributorCode];
    info_universal_commands_log$read_unique_identifier_tag_response_device_profile = HART_IP_ENUM::DEVICE_PROFILE_CODES[readuniqueidentifiertagresponse$deviceProfile];
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadMessageResponseEvt (c: connection, is_orig: bool, readmessageresponse: HART_IP_UNIVERSAL_COMMANDS::ReadMessageResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readmessageresponse$commandNumberLinkID;
    info_universal_commands_log$read_message_response_message = readmessageresponse$message;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadTagResponseEvt (c: connection, is_orig: bool, readtagresponse: HART_IP_UNIVERSAL_COMMANDS::ReadTagResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readtagresponse$commandNumberLinkID;
    info_universal_commands_log$read_tag_response_tag = readtagresponse$tag;
    info_universal_commands_log$read_tag_response_descriptor = readtagresponse$descriptor;
    info_universal_commands_log$read_tag_response_date_code = readtagresponse$dateCode;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadPrimaryVariableTransducerInformationResponseEvt (c: connection, is_orig: bool, readprimaryvariabletransducerinformationresponse: HART_IP_UNIVERSAL_COMMANDS::ReadPrimaryVariableTransducerInformationResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readprimaryvariabletransducerinformationresponse$commandNumberLinkID;
    info_universal_commands_log$read_primary_variable_transducer_information_response_p_v_transducer_serial_number = readprimaryvariabletransducerinformationresponse$pVTransducerSerialNumber;
    info_universal_commands_log$read_primary_variable_transducer_information_response_p_v_transducer_limits_units = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readprimaryvariabletransducerinformationresponse$pVTransducerLimitsUnits];
    info_universal_commands_log$read_primary_variable_transducer_information_response_p_v_upper_transducer_limit = readprimaryvariabletransducerinformationresponse$pVUpperTransducerLimit;
    info_universal_commands_log$read_primary_variable_transducer_information_response_p_v_lower_transducer_limit = readprimaryvariabletransducerinformationresponse$pVLowerTransducerLimit;
    info_universal_commands_log$read_primary_variable_transducer_information_response_p_v_minimum_span = readprimaryvariabletransducerinformationresponse$pVMinimumSpan;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadDeviceInformationResponseEvt (c: connection, is_orig: bool, readdeviceinformationresponse: HART_IP_UNIVERSAL_COMMANDS::ReadDeviceInformationResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readdeviceinformationresponse$commandNumberLinkID;
    info_universal_commands_log$read_device_information_response_p_v_alarm_selection_code = HART_IP_ENUM::ALARM_SELECTION_CODES[readdeviceinformationresponse$pVAlarmSelectionCode];
    info_universal_commands_log$read_device_information_response_p_v_transfer_function_code = HART_IP_ENUM::TRANSFER_FUNCTION_CODES[readdeviceinformationresponse$pVTransferFunctionCode];
    info_universal_commands_log$read_device_information_response_p_v_upper_lower_range = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdeviceinformationresponse$pVUpperLowerRange];
    info_universal_commands_log$read_device_information_response_p_v_upper_range_value = readdeviceinformationresponse$pVUpperRangeValue;
    info_universal_commands_log$read_device_information_response_p_v_lower_range_value = readdeviceinformationresponse$pVLowerRangeValue;
    info_universal_commands_log$read_device_information_response_p_v_damping_value = readdeviceinformationresponse$pVDampingValue;
    info_universal_commands_log$read_device_information_response_write_protect_code = HART_IP_ENUM::WRITE_PROTECT_CODES[readdeviceinformationresponse$writeProtectCode];
    info_universal_commands_log$read_device_information_response__250 = readdeviceinformationresponse$_250;
    info_universal_commands_log$read_device_information_response_p_v_analog_channel_flags_undefined_7 = readdeviceinformationresponse$pVAnalogChannelFlags$UNDEFINED_7;
    info_universal_commands_log$read_device_information_response_p_v_analog_channel_flags_undefined_6 = readdeviceinformationresponse$pVAnalogChannelFlags$UNDEFINED_6;
    info_universal_commands_log$read_device_information_response_p_v_analog_channel_flags_undefined_5 = readdeviceinformationresponse$pVAnalogChannelFlags$UNDEFINED_5;
    info_universal_commands_log$read_device_information_response_p_v_analog_channel_flags_undefined_4 = readdeviceinformationresponse$pVAnalogChannelFlags$UNDEFINED_4;
    info_universal_commands_log$read_device_information_response_p_v_analog_channel_flags_undefined_3 = readdeviceinformationresponse$pVAnalogChannelFlags$UNDEFINED_3;
    info_universal_commands_log$read_device_information_response_p_v_analog_channel_flags_undefined_2 = readdeviceinformationresponse$pVAnalogChannelFlags$UNDEFINED_2;
    info_universal_commands_log$read_device_information_response_p_v_analog_channel_flags_undefined_1 = readdeviceinformationresponse$pVAnalogChannelFlags$UNDEFINED_1;
    info_universal_commands_log$read_device_information_response_p_v_analog_channel_flags_analog_channel = readdeviceinformationresponse$pVAnalogChannelFlags$ANALOG_CHANNEL;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadFinalAssemblyNumberResponseEvt (c: connection, is_orig: bool, readfinalassemblynumberresponse: HART_IP_UNIVERSAL_COMMANDS::ReadFinalAssemblyNumberResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readfinalassemblynumberresponse$commandNumberLinkID;
    info_universal_commands_log$read_final_assembly_number_response_final_assembly_number = readfinalassemblynumberresponse$finalAssemblyNumber;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::WriteMessageEvt (c: connection, is_orig: bool, writemessage: HART_IP_UNIVERSAL_COMMANDS::WriteMessage) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = writemessage$commandNumberLinkID;
    info_universal_commands_log$write_message_message_string = writemessage$messageString;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::WriteTagDescriptorDateEvt (c: connection, is_orig: bool, writetagdescriptordate: HART_IP_UNIVERSAL_COMMANDS::WriteTagDescriptorDate) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = writetagdescriptordate$commandNumberLinkID;
    info_universal_commands_log$write_tag_descriptor_date_tag = writetagdescriptordate$tag;
    info_universal_commands_log$write_tag_descriptor_date_record_keeping_descriptor = writetagdescriptordate$recordKeepingDescriptor;
    info_universal_commands_log$write_tag_descriptor_date_date_code = writetagdescriptordate$dateCode;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::WriteFinalAssemblyNumberEvt (c: connection, is_orig: bool, writefinalassemblynumber: HART_IP_UNIVERSAL_COMMANDS::WriteFinalAssemblyNumber) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = writefinalassemblynumber$commandNumberLinkID;
    info_universal_commands_log$write_final_assembly_number_final_assembly_number = writefinalassemblynumber$finalAssemblyNumber;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadLongTagResponseEvt (c: connection, is_orig: bool, readlongtagresponse: HART_IP_UNIVERSAL_COMMANDS::ReadLongTagResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readlongtagresponse$commandNumberLinkID;
    info_universal_commands_log$read_long_tag_response_long_tag = readlongtagresponse$longTag;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadUniqueIdentifierLongTagRequestEvt (c: connection, is_orig: bool, readuniqueidentifierlongtagrequest: HART_IP_UNIVERSAL_COMMANDS::ReadUniqueIdentifierLongTagRequest) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readuniqueidentifierlongtagrequest$commandNumberLinkID;
    info_universal_commands_log$read_unique_identifier_long_tag_request_long_tag = readuniqueidentifierlongtagrequest$longTag;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadUniqueIdentifierLongTagResponseEvt (c: connection, is_orig: bool, readuniqueidentifierlongtagresponse: HART_IP_UNIVERSAL_COMMANDS::ReadUniqueIdentifierLongTagResponse) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readuniqueidentifierlongtagresponse$commandNumberLinkID;
    info_universal_commands_log$read_unique_identifier_long_tag_response__254 = readuniqueidentifierlongtagresponse$_254;
    info_universal_commands_log$read_unique_identifier_long_tag_response_expanded_device_type = HART_IP_ENUM::EXPANDED_DEVICE_TYPE_CODES[readuniqueidentifierlongtagresponse$expandedDeviceType];
    info_universal_commands_log$read_unique_identifier_long_tag_response_minimum_preambles_master_slave = readuniqueidentifierlongtagresponse$minimumPreamblesMasterSlave;
    info_universal_commands_log$read_unique_identifier_long_tag_response_hart_protocol_major_revision = readuniqueidentifierlongtagresponse$hartProtocolMajorRevision;
    info_universal_commands_log$read_unique_identifier_long_tag_response_device_revision_level = readuniqueidentifierlongtagresponse$deviceRevisionLevel;
    info_universal_commands_log$read_unique_identifier_long_tag_response_software_revision_level = readuniqueidentifierlongtagresponse$softwareRevisionLevel;
    info_universal_commands_log$read_unique_identifier_long_tag_response_hardware_revision_level_and_physical_signaling_codes_hardware_revision_level = readuniqueidentifierlongtagresponse$hardwareRevisionLevelAndPhysicalSignalingCodes$hardwareRevisionLevel;
    info_universal_commands_log$read_unique_identifier_long_tag_response_hardware_revision_level_and_physical_signaling_codes_physical_signaling_code = HART_IP_ENUM::PHYSICAL_SIGNALING_CODES[readuniqueidentifierlongtagresponse$hardwareRevisionLevelAndPhysicalSignalingCodes$physicalSignalingCode];
    info_universal_commands_log$read_unique_identifier_long_tag_response_flags_c8_psk_in_multi_drop_only = readuniqueidentifierlongtagresponse$flags$C8PSK_IN_MULTI_DROP_ONLY;
    info_universal_commands_log$read_unique_identifier_long_tag_response_flags_c8_psk_capable_field_device = readuniqueidentifierlongtagresponse$flags$C8PSK_CAPABLE_FIELD_DEVICE;
    info_universal_commands_log$read_unique_identifier_long_tag_response_flags_undefined_5 = readuniqueidentifierlongtagresponse$flags$UNDEFINED_5;
    info_universal_commands_log$read_unique_identifier_long_tag_response_flags_safehart_capable_field_device = readuniqueidentifierlongtagresponse$flags$SAFEHART_CAPABLE_FIELD_DEVICE;
    info_universal_commands_log$read_unique_identifier_long_tag_response_flags_ieee_802_15_4_dsss_o_qpsk_modulation = readuniqueidentifierlongtagresponse$flags$IEEE_802_15_4_DSSS_O_QPSK_MODULATION;
    info_universal_commands_log$read_unique_identifier_long_tag_response_flags_protocol_bridge_device = readuniqueidentifierlongtagresponse$flags$PROTOCOL_BRIDGE_DEVICE;
    info_universal_commands_log$read_unique_identifier_long_tag_response_flags_eeprom_control = readuniqueidentifierlongtagresponse$flags$EEPROM_CONTROL;
    info_universal_commands_log$read_unique_identifier_long_tag_response_flags_mutli_sensor_field_device = readuniqueidentifierlongtagresponse$flags$MUTLI_SENSOR_FIELD_DEVICE;
    info_universal_commands_log$read_unique_identifier_long_tag_response_device_id = readuniqueidentifierlongtagresponse$deviceID;
    info_universal_commands_log$read_unique_identifier_long_tag_response_number_preambles_slave_master = readuniqueidentifierlongtagresponse$numberPreamblesSlaveMaster;
    info_universal_commands_log$read_unique_identifier_long_tag_response_last_device_variable_this = readuniqueidentifierlongtagresponse$lastDeviceVariableThis;
    info_universal_commands_log$read_unique_identifier_long_tag_response_configuration_change_counter = readuniqueidentifierlongtagresponse$configurationChangeCounter;
    info_universal_commands_log$read_unique_identifier_long_tag_response_extended_field_device_status_undefined_bit_7 = readuniqueidentifierlongtagresponse$extendedFieldDeviceStatus$UNDEFINED_BIT_7;
    info_universal_commands_log$read_unique_identifier_long_tag_response_extended_field_device_status_undefined_bit_6 = readuniqueidentifierlongtagresponse$extendedFieldDeviceStatus$UNDEFINED_BIT_6;
    info_universal_commands_log$read_unique_identifier_long_tag_response_extended_field_device_status_function_check = readuniqueidentifierlongtagresponse$extendedFieldDeviceStatus$FUNCTION_CHECK;
    info_universal_commands_log$read_unique_identifier_long_tag_response_extended_field_device_status_out_of_specification = readuniqueidentifierlongtagresponse$extendedFieldDeviceStatus$OUT_OF_SPECIFICATION;
    info_universal_commands_log$read_unique_identifier_long_tag_response_extended_field_device_status_failure = readuniqueidentifierlongtagresponse$extendedFieldDeviceStatus$FAILURE;
    info_universal_commands_log$read_unique_identifier_long_tag_response_extended_field_device_status_critical_power_failure = readuniqueidentifierlongtagresponse$extendedFieldDeviceStatus$CRITICAL_POWER_FAILURE;
    info_universal_commands_log$read_unique_identifier_long_tag_response_extended_field_device_status_device_variable_alert = readuniqueidentifierlongtagresponse$extendedFieldDeviceStatus$DEVICE_VARIABLE_ALERT;
    info_universal_commands_log$read_unique_identifier_long_tag_response_extended_field_device_status_maintenance_required = readuniqueidentifierlongtagresponse$extendedFieldDeviceStatus$MAINTENANCE_REQUIRED;
    info_universal_commands_log$read_unique_identifier_long_tag_response_manufacturer_identification_code = HART_IP_ENUM::MANUFACTURER_IDENTIFICATION_CODES[readuniqueidentifierlongtagresponse$manufacturerIdentificationCode];
    info_universal_commands_log$read_unique_identifier_long_tag_response_private_label_distributor_code = HART_IP_ENUM::MANUFACTURER_IDENTIFICATION_CODES[readuniqueidentifierlongtagresponse$privateLabelDistributorCode];
    info_universal_commands_log$read_unique_identifier_long_tag_response_device_profile = HART_IP_ENUM::DEVICE_PROFILE_CODES[readuniqueidentifierlongtagresponse$deviceProfile];
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::WriteLongTagEvt (c: connection, is_orig: bool, writelongtag: HART_IP_UNIVERSAL_COMMANDS::WriteLongTag) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = writelongtag$commandNumberLinkID;
    info_universal_commands_log$write_long_tag_long_tag = writelongtag$longTag;
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ResetConfigurationChangedFlagEvt (c: connection, is_orig: bool, resetconfigurationchangedflag: HART_IP_UNIVERSAL_COMMANDS::ResetConfigurationChangedFlag) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = resetconfigurationchangedflag$commandNumberLinkID;
    if (resetconfigurationchangedflag?$configurationChangeCounter){
        info_universal_commands_log$reset_configuration_changed_flag_configuration_change_counter = resetconfigurationchangedflag$configurationChangeCounter;
    }
    HART_IP::emit_hart_ip_universal_commands_log(c);
}
event HART_IP_UNIVERSAL_COMMANDS::ReadAdditionalDeviceStatusEvt (c: connection, is_orig: bool, readadditionaldevicestatus: HART_IP_UNIVERSAL_COMMANDS::ReadAdditionalDeviceStatus) {
    hook set_session_universal_commands_log(c);

    local info_universal_commands_log = c$hart_ip_universal_commands_log;

    info_universal_commands_log$command_number_link_id = readadditionaldevicestatus$commandNumberLinkID;
    if (readadditionaldevicestatus?$packetContents){
        info_universal_commands_log$read_additional_device_status_contents_device_specific_status_0 = readadditionaldevicestatus$packetContents$deviceSpecificStatus_0;
        info_universal_commands_log$read_additional_device_status_contents_extended_field_device_status_undefined_bit_7 = readadditionaldevicestatus$packetContents$extendedFieldDeviceStatus$UNDEFINED_BIT_7;
        info_universal_commands_log$read_additional_device_status_contents_extended_field_device_status_undefined_bit_6 = readadditionaldevicestatus$packetContents$extendedFieldDeviceStatus$UNDEFINED_BIT_6;
        info_universal_commands_log$read_additional_device_status_contents_extended_field_device_status_function_check = readadditionaldevicestatus$packetContents$extendedFieldDeviceStatus$FUNCTION_CHECK;
        info_universal_commands_log$read_additional_device_status_contents_extended_field_device_status_out_of_specification = readadditionaldevicestatus$packetContents$extendedFieldDeviceStatus$OUT_OF_SPECIFICATION;
        info_universal_commands_log$read_additional_device_status_contents_extended_field_device_status_failure = readadditionaldevicestatus$packetContents$extendedFieldDeviceStatus$FAILURE;
        info_universal_commands_log$read_additional_device_status_contents_extended_field_device_status_critical_power_failure = readadditionaldevicestatus$packetContents$extendedFieldDeviceStatus$CRITICAL_POWER_FAILURE;
        info_universal_commands_log$read_additional_device_status_contents_extended_field_device_status_device_variable_alert = readadditionaldevicestatus$packetContents$extendedFieldDeviceStatus$DEVICE_VARIABLE_ALERT;
        info_universal_commands_log$read_additional_device_status_contents_extended_field_device_status_maintenance_required = readadditionaldevicestatus$packetContents$extendedFieldDeviceStatus$MAINTENANCE_REQUIRED;
        info_universal_commands_log$read_additional_device_status_contents_device_operating_mode = HART_IP_ENUM::OPERATING_MODE_CODES[readadditionaldevicestatus$packetContents$deviceOperatingMode];
        info_universal_commands_log$read_additional_device_status_contents_standardized_status0_device_configuration_lock = readadditionaldevicestatus$packetContents$standardizedStatus0$DEVICE_CONFIGURATION_LOCK;
        info_universal_commands_log$read_additional_device_status_contents_standardized_status0_electronic_defect = readadditionaldevicestatus$packetContents$standardizedStatus0$ELECTRONIC_DEFECT;
        info_universal_commands_log$read_additional_device_status_contents_standardized_status0_environmental_conditions_out_of_range = readadditionaldevicestatus$packetContents$standardizedStatus0$ENVIRONMENTAL_CONDITIONS_OUT_OF_RANGE;
        info_universal_commands_log$read_additional_device_status_contents_standardized_status0_power_supply_conditions_out_of_range = readadditionaldevicestatus$packetContents$standardizedStatus0$POWER_SUPPLY_CONDITIONS_OUT_OF_RANGE;
        info_universal_commands_log$read_additional_device_status_contents_standardized_status0_watchdog_reset_executed = readadditionaldevicestatus$packetContents$standardizedStatus0$WATCHDOG_RESET_EXECUTED;
        info_universal_commands_log$read_additional_device_status_contents_standardized_status0_volatile_memory_defect = readadditionaldevicestatus$packetContents$standardizedStatus0$VOLATILE_MEMORY_DEFECT;
        info_universal_commands_log$read_additional_device_status_contents_standardized_status0_non_volatile_memory_defect = readadditionaldevicestatus$packetContents$standardizedStatus0$NON_VOLATILE_MEMORY_DEFECT;
        info_universal_commands_log$read_additional_device_status_contents_standardized_status0_device_variable_simulation_active = readadditionaldevicestatus$packetContents$standardizedStatus0$DEVICE_VARIABLE_SIMULATION_ACTIVE;
        if (readadditionaldevicestatus$packetContents?$standardizedStatus1){
            info_universal_commands_log$read_additional_device_status_contents_standardized_status1_undefined_7 = readadditionaldevicestatus$packetContents$standardizedStatus1$UNDEFINED_7;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status1_undefined_6 = readadditionaldevicestatus$packetContents$standardizedStatus1$UNDEFINED_6;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status1_undefined_5 = readadditionaldevicestatus$packetContents$standardizedStatus1$UNDEFINED_5;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status1_reserved = readadditionaldevicestatus$packetContents$standardizedStatus1$RESERVED;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status1_battery_or_power_supply_needs_maintenance = readadditionaldevicestatus$packetContents$standardizedStatus1$BATTERY_OR_POWER_SUPPLY_NEEDS_MAINTENANCE;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status1_event_notification_overflow = readadditionaldevicestatus$packetContents$standardizedStatus1$EVENT_NOTIFICATION_OVERFLOW;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status1_discrete_variable_simulation_active = readadditionaldevicestatus$packetContents$standardizedStatus1$DISCRETE_VARIABLE_SIMULATION_ACTIVE;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status1_status_simulation_active = readadditionaldevicestatus$packetContents$standardizedStatus1$STATUS_SIMULATION_ACTIVE;
        }
        if (readadditionaldevicestatus$packetContents?$analogChannelSaturated){
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_saturated_undefined_7 = readadditionaldevicestatus$packetContents$analogChannelSaturated$UNDEFINED_7;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_saturated_undefined_6 = readadditionaldevicestatus$packetContents$analogChannelSaturated$UNDEFINED_6;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_saturated_undefined_5 = readadditionaldevicestatus$packetContents$analogChannelSaturated$UNDEFINED_5;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_saturated_undefined_4 = readadditionaldevicestatus$packetContents$analogChannelSaturated$UNDEFINED_4;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_saturated_quinary_analog = readadditionaldevicestatus$packetContents$analogChannelSaturated$QUINARY_ANALOG;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_saturated_quaternary_analog = readadditionaldevicestatus$packetContents$analogChannelSaturated$QUATERNARY_ANALOG;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_saturated_tertiary_analog = readadditionaldevicestatus$packetContents$analogChannelSaturated$TERTIARY_ANALOG;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_saturated_secondary_analog = readadditionaldevicestatus$packetContents$analogChannelSaturated$SECONDARY_ANALOG;
        }
        if (readadditionaldevicestatus$packetContents?$standardizedStatus2){
            info_universal_commands_log$read_additional_device_status_contents_standardized_status2_undefined_7 = readadditionaldevicestatus$packetContents$standardizedStatus2$UNDEFINED_7;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status2_undefined_6 = readadditionaldevicestatus$packetContents$standardizedStatus2$UNDEFINED_6;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status2_undefined_5 = readadditionaldevicestatus$packetContents$standardizedStatus2$UNDEFINED_5;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status2_stale_data_notice = readadditionaldevicestatus$packetContents$standardizedStatus2$STALE_DATA_NOTICE;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status2_sub_device_with_duplicate_id = readadditionaldevicestatus$packetContents$standardizedStatus2$SUB_DEVICE_WITH_DUPLICATE_ID;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status2_sub_device_mismatch = readadditionaldevicestatus$packetContents$standardizedStatus2$SUB_DEVICE_MISMATCH;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status2_duplicate_master_detected = readadditionaldevicestatus$packetContents$standardizedStatus2$DUPLICATE_MASTER_DETECTED;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status2_sub_device_list_changed = readadditionaldevicestatus$packetContents$standardizedStatus2$SUB_DEVICE_LIST_CHANGED;
        }
        if (readadditionaldevicestatus$packetContents?$standardizedStatus3){
            info_universal_commands_log$read_additional_device_status_contents_standardized_status3_undefined_7 = readadditionaldevicestatus$packetContents$standardizedStatus3$UNDEFINED_7;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status3_undefined_6 = readadditionaldevicestatus$packetContents$standardizedStatus3$UNDEFINED_6;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status3_undefined_5 = readadditionaldevicestatus$packetContents$standardizedStatus3$UNDEFINED_5;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status3_radio_failure = readadditionaldevicestatus$packetContents$standardizedStatus3$RADIO_FAILURE;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status3_block_transfer_pending = readadditionaldevicestatus$packetContents$standardizedStatus3$BLOCK_TRANSFER_PENDING;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status3_bandwith_allocation_pending = readadditionaldevicestatus$packetContents$standardizedStatus3$BANDWITH_ALLOCATION_PENDING;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status3_resereved = readadditionaldevicestatus$packetContents$standardizedStatus3$RESEREVED;
            info_universal_commands_log$read_additional_device_status_contents_standardized_status3_capacity_denied = readadditionaldevicestatus$packetContents$standardizedStatus3$CAPACITY_DENIED;
        }
        if (readadditionaldevicestatus$packetContents?$analogChannel){
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_undefined_7 = readadditionaldevicestatus$packetContents$analogChannel$UNDEFINED_7;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_undefined_6 = readadditionaldevicestatus$packetContents$analogChannel$UNDEFINED_6;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_undefined_5 = readadditionaldevicestatus$packetContents$analogChannel$UNDEFINED_5;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_undefined_4 = readadditionaldevicestatus$packetContents$analogChannel$UNDEFINED_4;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_undefined_3 = readadditionaldevicestatus$packetContents$analogChannel$UNDEFINED_3;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_undefined_2 = readadditionaldevicestatus$packetContents$analogChannel$UNDEFINED_2;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_undefined_1 = readadditionaldevicestatus$packetContents$analogChannel$UNDEFINED_1;
            info_universal_commands_log$read_additional_device_status_contents_analog_channel_analog_channel = readadditionaldevicestatus$packetContents$analogChannel$ANALOG_CHANNEL;
        }
        if (readadditionaldevicestatus$packetContents?$deviceSpecificStatus_1){
            info_universal_commands_log$read_additional_device_status_contents_device_specific_status_1 = readadditionaldevicestatus$packetContents$deviceSpecificStatus_1;
        }
    }
    HART_IP::emit_hart_ip_universal_commands_log(c);
}


