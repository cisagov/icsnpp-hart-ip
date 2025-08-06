# Copyright 2024, Battelle Energy Alliance, LLC, ALL RIGHTS RESERVED
module HART_IP_COMMON_COMMANDS;

hook set_session_common_commands_log(c: connection) {
    if ( ! c?$hart_ip_common_commands_log )
        c$hart_ip_common_commands_log = common_commands_log(
            $ts=network_time(),
            $uid=c$uid,
            $id=c$id,
            $proto=get_conn_transport_proto(c$id));
}

event HART_IP_COMMON_COMMANDS::ReadDeviceVariablesRequestEvt (c: connection, is_orig: bool, readdevicevariablesrequest: HART_IP_COMMON_COMMANDS::ReadDeviceVariablesRequest) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readdevicevariablesrequest$commandNumberLinkID;
    if (readdevicevariablesrequest?$slot0DeviceVariableCode){
        info_common_commands_log$read_device_variables_request_slot0_device_variable_code = readdevicevariablesrequest$slot0DeviceVariableCode;
    }
    if (readdevicevariablesrequest?$slot1DeviceVariableCode){
        info_common_commands_log$read_device_variables_request_slot1_device_variable_code = readdevicevariablesrequest$slot1DeviceVariableCode;
    }
    if (readdevicevariablesrequest?$slot2DeviceVariableCode){
        info_common_commands_log$read_device_variables_request_slot2_device_variable_code = readdevicevariablesrequest$slot2DeviceVariableCode;
    }
    if (readdevicevariablesrequest?$slot3DeviceVariableCode){
        info_common_commands_log$read_device_variables_request_slot3_device_variable_code = readdevicevariablesrequest$slot3DeviceVariableCode;
    }
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadDeviceVariablesResponseEvt (c: connection, is_orig: bool, readdevicevariablesresponse: HART_IP_COMMON_COMMANDS::ReadDeviceVariablesResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readdevicevariablesresponse$commandNumberLinkID;
    if (readdevicevariablesresponse?$slot0DeviceVariableCode){
        info_common_commands_log$read_device_variables_response_slot0_device_variable_code = readdevicevariablesresponse$slot0DeviceVariableCode;
    }
    if (readdevicevariablesresponse?$slot0UnitsCode){
        info_common_commands_log$read_device_variables_response_slot0_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariablesresponse$slot0UnitsCode];
    }
    if (readdevicevariablesresponse?$slot0DeviceVariable){
        info_common_commands_log$read_device_variables_response_slot0_device_variable = readdevicevariablesresponse$slot0DeviceVariable;
    }
    if (readdevicevariablesresponse?$slot1DeviceVariableCode){
        info_common_commands_log$read_device_variables_response_slot1_device_variable_code = readdevicevariablesresponse$slot1DeviceVariableCode;
    }
    if (readdevicevariablesresponse?$slot1UnitsCode){
        info_common_commands_log$read_device_variables_response_slot1_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariablesresponse$slot1UnitsCode];
    }
    if (readdevicevariablesresponse?$slot1DeviceVariable){
        info_common_commands_log$read_device_variables_response_slot1_device_variable = readdevicevariablesresponse$slot1DeviceVariable;
    }
    if (readdevicevariablesresponse?$slot2DeviceVariableCode){
        info_common_commands_log$read_device_variables_response_slot2_device_variable_code = readdevicevariablesresponse$slot2DeviceVariableCode;
    }
    if (readdevicevariablesresponse?$slot2UnitsCode){
        info_common_commands_log$read_device_variables_response_slot2_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariablesresponse$slot2UnitsCode];
    }
    if (readdevicevariablesresponse?$slot2DeviceVariable){
        info_common_commands_log$read_device_variables_response_slot2_device_variable = readdevicevariablesresponse$slot2DeviceVariable;
    }
    if (readdevicevariablesresponse?$slot3DeviceVariableCode){
        info_common_commands_log$read_device_variables_response_slot3_device_variable_code = readdevicevariablesresponse$slot3DeviceVariableCode;
    }
    if (readdevicevariablesresponse?$slot3UnitsCode){
        info_common_commands_log$read_device_variables_response_slot3_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariablesresponse$slot3UnitsCode];
    }
    if (readdevicevariablesresponse?$slot3DeviceVariable){
        info_common_commands_log$read_device_variables_response_slot3_device_variable = readdevicevariablesresponse$slot3DeviceVariable;
    }
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WritePrimaryVariableDampingValueEvt (c: connection, is_orig: bool, writeprimaryvariabledampingvalue: HART_IP_COMMON_COMMANDS::WritePrimaryVariableDampingValue) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writeprimaryvariabledampingvalue$commandNumberLinkID;
    info_common_commands_log$write_primary_variable_damping_value_pv_damping_value = writeprimaryvariabledampingvalue$pvDampingValue;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WritePrimaryVariableRangeValuesEvt (c: connection, is_orig: bool, writeprimaryvariablerangevalues: HART_IP_COMMON_COMMANDS::WritePrimaryVariableRangeValues) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writeprimaryvariablerangevalues$commandNumberLinkID;
    info_common_commands_log$write_primary_variable_range_values_pv_upper_and_lower_range_values_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[writeprimaryvariablerangevalues$pvUpperAndLowerRangeValuesUnitsCode];
    info_common_commands_log$write_primary_variable_range_values_pv_upper_range_value = writeprimaryvariablerangevalues$pvUpperRangeValue;
    info_common_commands_log$write_primary_variable_range_values_p_v_lower_range_value = writeprimaryvariablerangevalues$pVLowerRangeValue;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::EEPROMControlEvt (c: connection, is_orig: bool, eepromcontrol: HART_IP_COMMON_COMMANDS::EEPROMControl) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = eepromcontrol$commandNumberLinkID;
    info_common_commands_log$eeprom_control_eeprom_control_code = HART_IP_ENUM::EEPROM_CONTROL_CODE[eepromcontrol$eepromControlCode];
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::EnterExitFixedCurrentModeEvt (c: connection, is_orig: bool, enterexitfixedcurrentmode: HART_IP_COMMON_COMMANDS::EnterExitFixedCurrentMode) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = enterexitfixedcurrentmode$commandNumberLinkID;
    info_common_commands_log$enter_exit_fixed_current_mode_pv_fixed_current_level = enterexitfixedcurrentmode$pvFixedCurrentLevel;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WritePrimaryVariableUnitsEvt (c: connection, is_orig: bool, writeprimaryvariableunits: HART_IP_COMMON_COMMANDS::WritePrimaryVariableUnits) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writeprimaryvariableunits$commandNumberLinkID;
    info_common_commands_log$write_primary_variable_units_pv_unit_codes = HART_IP_ENUM::ENGINEERING_UNIT_CODES[writeprimaryvariableunits$pvUnitCodes];
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::TrimLoopCurrentZeroEvt (c: connection, is_orig: bool, trimloopcurrentzero: HART_IP_COMMON_COMMANDS::TrimLoopCurrentZero) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = trimloopcurrentzero$commandNumberLinkID;
    info_common_commands_log$trim_loop_current_zero_measured_pv_loop_current_level = trimloopcurrentzero$measuredPVLoopCurrentLevel;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::TrimLoopCurrentGainEvt (c: connection, is_orig: bool, trimloopcurrentgain: HART_IP_COMMON_COMMANDS::TrimLoopCurrentGain) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = trimloopcurrentgain$commandNumberLinkID;
    info_common_commands_log$trim_loop_current_gain_measured_pv_loop_current_level = trimloopcurrentgain$measuredPVLoopCurrentLevel;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WritePrimaryVariableTransferFunctionEvt (c: connection, is_orig: bool, writeprimaryvariabletransferfunction: HART_IP_COMMON_COMMANDS::WritePrimaryVariableTransferFunction) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writeprimaryvariabletransferfunction$commandNumberLinkID;
    info_common_commands_log$write_primary_variable_transfer_function_p_v_transfer_function_code = HART_IP_ENUM::TRANSFER_FUNCTION_CODES[writeprimaryvariabletransferfunction$pVTransferFunctionCode];
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WritePrimaryVariableTransducerSerialNumberEvt (c: connection, is_orig: bool, writeprimaryvariabletransducerserialnumber: HART_IP_COMMON_COMMANDS::WritePrimaryVariableTransducerSerialNumber) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writeprimaryvariabletransducerserialnumber$commandNumberLinkID;
    info_common_commands_log$write_primary_variable_transducer_serial_number_pv_transducer_serial_number = writeprimaryvariabletransducerserialnumber$pvTransducerSerialNumber;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadDynamicVariableAssignmentsResponseEvt (c: connection, is_orig: bool, readdynamicvariableassignmentsresponse: HART_IP_COMMON_COMMANDS::ReadDynamicVariableAssignmentsResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readdynamicvariableassignmentsresponse$commandNumberLinkID;
    info_common_commands_log$read_dynamic_variable_assignments_response_device_variable_assigned_to_primary_variable = readdynamicvariableassignmentsresponse$deviceVariableAssignedToPrimaryVariable;
    info_common_commands_log$read_dynamic_variable_assignments_response_device_variable_assigned_to_secondary_variable = readdynamicvariableassignmentsresponse$deviceVariableAssignedToSecondaryVariable;
    info_common_commands_log$read_dynamic_variable_assignments_response_device_variable_assigned_to_tertiary_variable = readdynamicvariableassignmentsresponse$deviceVariableAssignedToTertiaryVariable;
    info_common_commands_log$read_dynamic_variable_assignments_response_device_variable_assigned_to_quaternary_variable = readdynamicvariableassignmentsresponse$deviceVariableAssignedToQuaternaryVariable;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteDynamicVariableAssignmentsEvt (c: connection, is_orig: bool, writedynamicvariableassignments: HART_IP_COMMON_COMMANDS::WriteDynamicVariableAssignments) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writedynamicvariableassignments$commandNumberLinkID;
    info_common_commands_log$write_dynamic_variable_assignments_device_variable_assigned_to_primary_variable = writedynamicvariableassignments$deviceVariableAssignedToPrimaryVariable;
    if (writedynamicvariableassignments?$deviceVariableAssignedToSecondaryVariable){
        info_common_commands_log$write_dynamic_variable_assignments_device_variable_assigned_to_secondary_variable = writedynamicvariableassignments$deviceVariableAssignedToSecondaryVariable;
    }
    if (writedynamicvariableassignments?$deviceVariableAssignedToTertiaryVariable){
        info_common_commands_log$write_dynamic_variable_assignments_device_variable_assigned_to_tertiary_variable = writedynamicvariableassignments$deviceVariableAssignedToTertiaryVariable;
    }
    if (writedynamicvariableassignments?$deviceVariableAssignedToQuaternaryVariable){
        info_common_commands_log$write_dynamic_variable_assignments_device_variable_assigned_to_quaternary_variable = writedynamicvariableassignments$deviceVariableAssignedToQuaternaryVariable;
    }
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::SetDeviceVariableZeroEvt (c: connection, is_orig: bool, setdevicevariablezero: HART_IP_COMMON_COMMANDS::SetDeviceVariableZero) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = setdevicevariablezero$commandNumberLinkID;
    info_common_commands_log$set_device_variable_zero_device_variable_zeroed = setdevicevariablezero$deviceVariableZeroed;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteDeviceVariableUnitsEvt (c: connection, is_orig: bool, writedevicevariableunits: HART_IP_COMMON_COMMANDS::WriteDeviceVariableUnits) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writedevicevariableunits$commandNumberLinkID;
    info_common_commands_log$write_device_variable_units_device_variable_code = writedevicevariableunits$deviceVariableCode;
    info_common_commands_log$write_device_variable_units_device_variable_units_code = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[writedevicevariableunits$deviceVariableUnitsCode];
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadDeviceVariableInformationRequestEvt (c: connection, is_orig: bool, readdevicevariableinformationrequest: HART_IP_COMMON_COMMANDS::ReadDeviceVariableInformationRequest) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readdevicevariableinformationrequest$commandNumberLinkID;
    info_common_commands_log$read_device_variable_information_request_device_variable_code = readdevicevariableinformationrequest$deviceVariableCode;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadDeviceVariableInformationResponseEvt (c: connection, is_orig: bool, readdevicevariableinformationresponse: HART_IP_COMMON_COMMANDS::ReadDeviceVariableInformationResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readdevicevariableinformationresponse$commandNumberLinkID;
    info_common_commands_log$read_device_variable_information_response_device_variable_code = readdevicevariableinformationresponse$deviceVariableCode;
    info_common_commands_log$read_device_variable_information_response_device_variable_transducer_serial_number = readdevicevariableinformationresponse$deviceVariableTransducerSerialNumber;
    info_common_commands_log$read_device_variable_information_response_device_variable_limits_minimum_span_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariableinformationresponse$deviceVariableLimitsMinimumSpanUnitsCode];
    info_common_commands_log$read_device_variable_information_response_device_variable_upper_transducer_limit = readdevicevariableinformationresponse$deviceVariableUpperTransducerLimit;
    info_common_commands_log$read_device_variable_information_response_device_variable_lower_transducer_limit = readdevicevariableinformationresponse$deviceVariableLowerTransducerLimit;
    info_common_commands_log$read_device_variable_information_response_device_variable_damping_value = readdevicevariableinformationresponse$deviceVariableDampingValue;
    info_common_commands_log$read_device_variable_information_response_device_variable_minimum_span = readdevicevariableinformationresponse$deviceVariableMinimumSpan;
    info_common_commands_log$read_device_variable_information_response_device_variable_classification = HART_IP_ENUM::DEVICE_VARIABLE_CLASSIFICATION_CODES[readdevicevariableinformationresponse$deviceVariableClassification];
    info_common_commands_log$read_device_variable_information_response_device_variable_family = HART_IP_ENUM::DEVICE_VARIABLE_FAMILY_CODE[readdevicevariableinformationresponse$deviceVariableFamily];
    info_common_commands_log$read_device_variable_information_response_acquisition_period = readdevicevariableinformationresponse$acquisitionPeriod;
    info_common_commands_log$read_device_variable_information_response_device_variable_properties_is_simulated = readdevicevariableinformationresponse$deviceVariableProperties$IS_SIMULATED;
    info_common_commands_log$read_device_variable_information_response_device_variable_properties_undefined_bits_1_6 = readdevicevariableinformationresponse$deviceVariableProperties$UNDEFINED_BITS_1_6;
    info_common_commands_log$read_device_variable_information_response_device_variable_properties_is_input = readdevicevariableinformationresponse$deviceVariableProperties$IS_INPUT;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteDeviceVariableDampingValueEvt (c: connection, is_orig: bool, writedevicevariabledampingvalue: HART_IP_COMMON_COMMANDS::WriteDeviceVariableDampingValue) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writedevicevariabledampingvalue$commandNumberLinkID;
    info_common_commands_log$write_device_variable_damping_value_device_variable_code = writedevicevariabledampingvalue$deviceVariableCode;
    info_common_commands_log$write_device_variable_damping_value_device_variable_damping_value = writedevicevariabledampingvalue$deviceVariableDampingValue;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteDeviceVariableTransducerSerialNoEvt (c: connection, is_orig: bool, writedevicevariabletransducerserialno: HART_IP_COMMON_COMMANDS::WriteDeviceVariableTransducerSerialNo) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writedevicevariabletransducerserialno$commandNumberLinkID;
    info_common_commands_log$write_device_variable_transducer_serial_no_device_variable_code = writedevicevariabletransducerserialno$deviceVariableCode;
    info_common_commands_log$write_device_variable_transducer_serial_no_device_variable_transducer_serial_number = writedevicevariabletransducerserialno$deviceVariableTransducerSerialNumber;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadUnitTagDescriptorDateResponseEvt (c: connection, is_orig: bool, readunittagdescriptordateresponse: HART_IP_COMMON_COMMANDS::ReadUnitTagDescriptorDateResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readunittagdescriptordateresponse$commandNumberLinkID;
    info_common_commands_log$read_unit_tag_descriptor_date_response_unit_tag = readunittagdescriptordateresponse$unitTag;
    info_common_commands_log$read_unit_tag_descriptor_date_response_unit_descriptor = readunittagdescriptordateresponse$unitDescriptor;
    info_common_commands_log$read_unit_tag_descriptor_date_response_unit_date = readunittagdescriptordateresponse$unitDate;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteUnitTagDescriptorDateEvt (c: connection, is_orig: bool, writeunittagdescriptordate: HART_IP_COMMON_COMMANDS::WriteUnitTagDescriptorDate) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writeunittagdescriptordate$commandNumberLinkID;
    info_common_commands_log$write_unit_tag_descriptor_date_unit_tag = writeunittagdescriptordate$unitTag;
    info_common_commands_log$write_unit_tag_descriptor_date_unit_descriptor = writeunittagdescriptordate$unitDescriptor;
    info_common_commands_log$write_unit_tag_descriptor_date_unit_date = writeunittagdescriptordate$unitDate;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteNumberOfResponsePreamblesEvt (c: connection, is_orig: bool, writenumberofresponsepreambles: HART_IP_COMMON_COMMANDS::WriteNumberOfResponsePreambles) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writenumberofresponsepreambles$commandNumberLinkID;
    info_common_commands_log$write_number_of_response_preambles_number_of_preambles = writenumberofresponsepreambles$numberOfPreambles;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadAnalogChannelAndPercentOfRangeRequestEvt (c: connection, is_orig: bool, readanalogchannelandpercentofrangerequest: HART_IP_COMMON_COMMANDS::ReadAnalogChannelAndPercentOfRangeRequest) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readanalogchannelandpercentofrangerequest$commandNumberLinkID;
    info_common_commands_log$read_analog_channel_and_percent_of_range_request_analog_channel_number_code = readanalogchannelandpercentofrangerequest$analogChannelNumberCode;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadAnalogChannelAndPercentOfRangeResponseEvt (c: connection, is_orig: bool, readanalogchannelandpercentofrangeresponse: HART_IP_COMMON_COMMANDS::ReadAnalogChannelAndPercentOfRangeResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readanalogchannelandpercentofrangeresponse$commandNumberLinkID;
    info_common_commands_log$read_analog_channel_and_percent_of_range_response_analog_channel_number_code = readanalogchannelandpercentofrangeresponse$analogChannelNumberCode;
    info_common_commands_log$read_analog_channel_and_percent_of_range_response_analog_channel_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readanalogchannelandpercentofrangeresponse$analogChannelUnitsCode];
    info_common_commands_log$read_analog_channel_and_percent_of_range_response_analog_channel_level = readanalogchannelandpercentofrangeresponse$analogChannelLevel;
    info_common_commands_log$read_analog_channel_and_percent_of_range_response_analog_channel_percent_of_range = readanalogchannelandpercentofrangeresponse$analogChannelPercentOfRange;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadDynamicVariablesAndPrimaryVariableAnalogChannelResponseEvt (c: connection, is_orig: bool, readdynamicvariablesandprimaryvariableanalogchannelresponse: HART_IP_COMMON_COMMANDS::ReadDynamicVariablesAndPrimaryVariableAnalogChannelResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readdynamicvariablesandprimaryvariableanalogchannelresponse$commandNumberLinkID;
    info_common_commands_log$read_dynamic_variables_and_primary_variable_analog_channel_response_primary_variable_analog_channel_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdynamicvariablesandprimaryvariableanalogchannelresponse$primaryVariableAnalogChannelUnitsCode];
    info_common_commands_log$read_dynamic_variables_and_primary_variable_analog_channel_response_primary_variable_analog_level = readdynamicvariablesandprimaryvariableanalogchannelresponse$primaryVariableAnalogLevel;
    info_common_commands_log$read_dynamic_variables_and_primary_variable_analog_channel_response_primary_variable_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdynamicvariablesandprimaryvariableanalogchannelresponse$primaryVariableUnitsCode];
    info_common_commands_log$read_dynamic_variables_and_primary_variable_analog_channel_response_primary_variable = readdynamicvariablesandprimaryvariableanalogchannelresponse$primaryVariable;
    info_common_commands_log$read_dynamic_variables_and_primary_variable_analog_channel_response_secondary_variable_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdynamicvariablesandprimaryvariableanalogchannelresponse$secondaryVariableUnitsCode];
    info_common_commands_log$read_dynamic_variables_and_primary_variable_analog_channel_response_secondary_variable = readdynamicvariablesandprimaryvariableanalogchannelresponse$secondaryVariable;
    info_common_commands_log$read_dynamic_variables_and_primary_variable_analog_channel_response_tertiary_variable_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdynamicvariablesandprimaryvariableanalogchannelresponse$tertiaryVariableUnitsCode];
    info_common_commands_log$read_dynamic_variables_and_primary_variable_analog_channel_response_tertiary_variable = readdynamicvariablesandprimaryvariableanalogchannelresponse$tertiaryVariable;
    info_common_commands_log$read_dynamic_variables_and_primary_variable_analog_channel_response_quaternary_variable_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdynamicvariablesandprimaryvariableanalogchannelresponse$quaternaryVariableUnitsCode];
    info_common_commands_log$read_dynamic_variables_and_primary_variable_analog_channel_response_quaternary_variable = readdynamicvariablesandprimaryvariableanalogchannelresponse$quaternaryVariable;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadAnalogChannelsRequestEvt (c: connection, is_orig: bool, readanalogchannelsrequest: HART_IP_COMMON_COMMANDS::ReadAnalogChannelsRequest) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readanalogchannelsrequest$commandNumberLinkID;
    info_common_commands_log$read_analog_channels_request_analog_channel_number_code_slot0 = readanalogchannelsrequest$analogChannelNumberCodeSlot0;
    info_common_commands_log$read_analog_channels_request_analog_channel_number_code_slot1 = readanalogchannelsrequest$analogChannelNumberCodeSlot1;
    info_common_commands_log$read_analog_channels_request_analog_channel_number_code_slot2 = readanalogchannelsrequest$analogChannelNumberCodeSlot2;
    info_common_commands_log$read_analog_channels_request_analog_channel_number_code_slot3 = readanalogchannelsrequest$analogChannelNumberCodeSlot3;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadAnalogChannelsResponseEvt (c: connection, is_orig: bool, readanalogchannelsresponse: HART_IP_COMMON_COMMANDS::ReadAnalogChannelsResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readanalogchannelsresponse$commandNumberLinkID;
    info_common_commands_log$read_analog_channels_response_analog_channel_number_code_slot0 = readanalogchannelsresponse$analogChannelNumberCodeSlot0;
    info_common_commands_log$read_analog_channels_response_analog_channel_units_code_slot0 = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readanalogchannelsresponse$analogChannelUnitsCodeSlot0];
    info_common_commands_log$read_analog_channels_response_analog_channel_level_slot0 = readanalogchannelsresponse$analogChannelLevelSlot0;
    info_common_commands_log$read_analog_channels_response_analog_channel_number_code_slot1 = readanalogchannelsresponse$analogChannelNumberCodeSlot1;
    info_common_commands_log$read_analog_channels_response_analog_channel_units_code_slot1 = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readanalogchannelsresponse$analogChannelUnitsCodeSlot1];
    info_common_commands_log$read_analog_channels_response_analog_channel_level_slot1 = readanalogchannelsresponse$analogChannelLevelSlot1;
    info_common_commands_log$read_analog_channels_response_analog_channel_number_code_slot2 = readanalogchannelsresponse$analogChannelNumberCodeSlot2;
    info_common_commands_log$read_analog_channels_response_analog_channel_units_code_slot2 = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readanalogchannelsresponse$analogChannelUnitsCodeSlot2];
    info_common_commands_log$read_analog_channels_response_analog_channel_level_slot2 = readanalogchannelsresponse$analogChannelLevelSlot2;
    info_common_commands_log$read_analog_channels_response_analog_channel_number_code_slot3 = readanalogchannelsresponse$analogChannelNumberCodeSlot3;
    info_common_commands_log$read_analog_channels_response_analog_channel_units_code_slot3 = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readanalogchannelsresponse$analogChannelUnitsCodeSlot3];
    info_common_commands_log$read_analog_channels_response_analog_channel_level_slot3 = readanalogchannelsresponse$analogChannelLevelSlot3;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadAnalogChannelInformationRequestEvt (c: connection, is_orig: bool, readanalogchannelinformationrequest: HART_IP_COMMON_COMMANDS::ReadAnalogChannelInformationRequest) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readanalogchannelinformationrequest$commandNumberLinkID;
    info_common_commands_log$read_analog_channel_information_request_analog_channel_number_code = readanalogchannelinformationrequest$analogChannelNumberCode;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadAnalogChannelInformationResponseEvt (c: connection, is_orig: bool, readanalogchannelinformationresponse: HART_IP_COMMON_COMMANDS::ReadAnalogChannelInformationResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readanalogchannelinformationresponse$commandNumberLinkID;
    info_common_commands_log$read_analog_channel_information_response_analog_channel_number_code = readanalogchannelinformationresponse$analogChannelNumberCode;
    info_common_commands_log$read_analog_channel_information_response_analog_channel_alarm_selection_code = HART_IP_ENUM::ALARM_SELECTION_CODES[readanalogchannelinformationresponse$analogChannelAlarmSelectionCode];
    info_common_commands_log$read_analog_channel_information_response_analog_channel_transfer_function_code = HART_IP_ENUM::TRANSFER_FUNCTION_CODES[readanalogchannelinformationresponse$analogChannelTransferFunctionCode];
    info_common_commands_log$read_analog_channel_information_response_analog_channel_upper_and_lower_range_values_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readanalogchannelinformationresponse$analogChannelUpperAndLowerRangeValuesUnitsCode];
    info_common_commands_log$read_analog_channel_information_response_analog_channel_upper_range_value = readanalogchannelinformationresponse$analogChannelUpperRangeValue;
    info_common_commands_log$read_analog_channel_information_response_analog_channel_lower_range_value = readanalogchannelinformationresponse$analogChannelLowerRangeValue;
    info_common_commands_log$read_analog_channel_information_response_analog_channel_damping_value = readanalogchannelinformationresponse$analogChannelDampingValue;
    info_common_commands_log$read_analog_channel_information_response_analog_channel_flags_is_simulated = readanalogchannelinformationresponse$analogChannelFlags$IS_SIMULATED;
    info_common_commands_log$read_analog_channel_information_response_analog_channel_flags_undefined_bits_1_6 = readanalogchannelinformationresponse$analogChannelFlags$UNDEFINED_BITS_1_6;
    info_common_commands_log$read_analog_channel_information_response_analog_channel_flags_is_input = readanalogchannelinformationresponse$analogChannelFlags$IS_INPUT;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteAnalogChannelAdditionalDampingValueEvt (c: connection, is_orig: bool, writeanalogchanneladditionaldampingvalue: HART_IP_COMMON_COMMANDS::WriteAnalogChannelAdditionalDampingValue) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writeanalogchanneladditionaldampingvalue$commandNumberLinkID;
    info_common_commands_log$write_analog_channel_additional_damping_value_analog_channel_number_code = writeanalogchanneladditionaldampingvalue$analogChannelNumberCode;
    info_common_commands_log$write_analog_channel_additional_damping_value_analog_channel_damping_value = writeanalogchanneladditionaldampingvalue$analogChannelDampingValue;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteAnalogChannelRangeValuesEvt (c: connection, is_orig: bool, writeanalogchannelrangevalues: HART_IP_COMMON_COMMANDS::WriteAnalogChannelRangeValues) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writeanalogchannelrangevalues$commandNumberLinkID;
    info_common_commands_log$write_analog_channel_range_values_analog_channel_number_code = writeanalogchannelrangevalues$analogChannelNumberCode;
    info_common_commands_log$write_analog_channel_range_values_analog_channel_upper_and_lower_range_values_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[writeanalogchannelrangevalues$analogChannelUpperAndLowerRangeValuesUnitsCode];
    info_common_commands_log$write_analog_channel_range_values_analog_channel_upper_range_value = writeanalogchannelrangevalues$analogChannelUpperRangeValue;
    info_common_commands_log$write_analog_channel_range_values_analog_channel_lower_range_value = writeanalogchannelrangevalues$analogChannelLowerRangeValue;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::EnterExitFixedAnalogChannelModeEvt (c: connection, is_orig: bool, enterexitfixedanalogchannelmode: HART_IP_COMMON_COMMANDS::EnterExitFixedAnalogChannelMode) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = enterexitfixedanalogchannelmode$commandNumberLinkID;
    info_common_commands_log$enter_exit_fixed_analog_channel_mode_analog_channel_number_code = enterexitfixedanalogchannelmode$analogChannelNumberCode;
    info_common_commands_log$enter_exit_fixed_analog_channel_mode_analog_channel_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[enterexitfixedanalogchannelmode$analogChannelUnitsCode];
    info_common_commands_log$enter_exit_fixed_analog_channel_mode_fixed_analog_channel_level = enterexitfixedanalogchannelmode$fixedAnalogChannelLevel;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::TrimAnalogChannelZeroEvt (c: connection, is_orig: bool, trimanalogchannelzero: HART_IP_COMMON_COMMANDS::TrimAnalogChannelZero) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = trimanalogchannelzero$commandNumberLinkID;
    info_common_commands_log$trim_analog_channel_zero_analog_channel_number_code = trimanalogchannelzero$analogChannelNumberCode;
    info_common_commands_log$trim_analog_channel_zero_analog_channel_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[trimanalogchannelzero$analogChannelUnitsCode];
    info_common_commands_log$trim_analog_channel_zero_analog_channel_level = trimanalogchannelzero$analogChannelLevel;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::TrimAnalogChannelGainEvt (c: connection, is_orig: bool, trimanalogchannelgain: HART_IP_COMMON_COMMANDS::TrimAnalogChannelGain) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = trimanalogchannelgain$commandNumberLinkID;
    info_common_commands_log$trim_analog_channel_gain_analog_channel_number_code = trimanalogchannelgain$analogChannelNumberCode;
    info_common_commands_log$trim_analog_channel_gain_analog_channel_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[trimanalogchannelgain$analogChannelUnitsCode];
    info_common_commands_log$trim_analog_channel_gain_analog_channel_level = trimanalogchannelgain$analogChannelLevel;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteAnalogChannelTransferFunctionEvt (c: connection, is_orig: bool, writeanalogchanneltransferfunction: HART_IP_COMMON_COMMANDS::WriteAnalogChannelTransferFunction) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writeanalogchanneltransferfunction$commandNumberLinkID;
    info_common_commands_log$write_analog_channel_transfer_function_analog_channel_number_code = writeanalogchanneltransferfunction$analogChannelNumberCode;
    info_common_commands_log$write_analog_channel_transfer_function_analog_channel_units_code = HART_IP_ENUM::TRANSFER_FUNCTION_CODES[writeanalogchanneltransferfunction$analogChannelUnitsCode];
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadAnalogChannelEndpointValuesRequestEvt (c: connection, is_orig: bool, readanalogchannelendpointvaluesrequest: HART_IP_COMMON_COMMANDS::ReadAnalogChannelEndpointValuesRequest) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readanalogchannelendpointvaluesrequest$commandNumberLinkID;
    info_common_commands_log$read_analog_channel_endpoint_values_request_analog_channel_number_code = readanalogchannelendpointvaluesrequest$analogChannelNumberCode;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadAnalogChannelEndpointValuesResponseEvt (c: connection, is_orig: bool, readanalogchannelendpointvaluesresponse: HART_IP_COMMON_COMMANDS::ReadAnalogChannelEndpointValuesResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readanalogchannelendpointvaluesresponse$commandNumberLinkID;
    info_common_commands_log$read_analog_channel_endpoint_values_response_analog_channel_number_code = readanalogchannelendpointvaluesresponse$analogChannelNumberCode;
    info_common_commands_log$read_analog_channel_endpoint_values_response_analog_channel_upper_and_lower_endpoint_values_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readanalogchannelendpointvaluesresponse$analogChannelUpperAndLowerEndpointValuesUnitsCode];
    info_common_commands_log$read_analog_channel_endpoint_values_response_analog_channel_upper_endpoint_value = readanalogchannelendpointvaluesresponse$analogChannelUpperEndpointValue;
    info_common_commands_log$read_analog_channel_endpoint_values_response_analog_channel_lower_endpoint_value = readanalogchannelendpointvaluesresponse$analogChannelLowerEndpointValue;
    info_common_commands_log$read_analog_channel_endpoint_values_response_analog_channel_upper_limit_value = readanalogchannelendpointvaluesresponse$analogChannelUpperLimitValue;
    info_common_commands_log$read_analog_channel_endpoint_values_response_analog_channel_lower_limit_value = readanalogchannelendpointvaluesresponse$analogChannelLowerLimitValue;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::LockDeviceEvt (c: connection, is_orig: bool, lockdevice: HART_IP_COMMON_COMMANDS::LockDevice) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = lockdevice$commandNumberLinkID;
    info_common_commands_log$lock_device_lock_code = HART_IP_ENUM::LOCK_DEVICE_CODES[lockdevice$lockCode];
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::SquawkEvt (c: connection, is_orig: bool, squawk: HART_IP_COMMON_COMMANDS::Squawk) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = squawk$commandNumberLinkID;
    if (squawk?$squawkControl){
        info_common_commands_log$squawk_squawk_control = HART_IP_ENUM::SQUAWK_CONTROL_CODES[squawk$squawkControl];
    }
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::FindDeviceResponseEvt (c: connection, is_orig: bool, finddeviceresponse: HART_IP_COMMON_COMMANDS::FindDeviceResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = finddeviceresponse$commandNumberLinkID;
    info_common_commands_log$find_device_response__254 = finddeviceresponse$_254;
    info_common_commands_log$find_device_response_expanded_device_type = HART_IP_ENUM::EXPANDED_DEVICE_TYPE_CODES[finddeviceresponse$expandedDeviceType];
    info_common_commands_log$find_device_response_minimum_preambles_master_slave = finddeviceresponse$minimumPreamblesMasterSlave;
    info_common_commands_log$find_device_response_hart_protocol_major_revision = finddeviceresponse$hartProtocolMajorRevision;
    info_common_commands_log$find_device_response_device_revision_level = finddeviceresponse$deviceRevisionLevel;
    info_common_commands_log$find_device_response_software_revision_level = finddeviceresponse$softwareRevisionLevel;
    info_common_commands_log$find_device_response_hardware_revision_level_and_physical_signaling_codes_hardware_revision_level = finddeviceresponse$hardwareRevisionLevelAndPhysicalSignalingCodes$hardwareRevisionLevel;
    info_common_commands_log$find_device_response_hardware_revision_level_and_physical_signaling_codes_physical_signaling_code = HART_IP_ENUM::PHYSICAL_SIGNALING_CODES[finddeviceresponse$hardwareRevisionLevelAndPhysicalSignalingCodes$physicalSignalingCode];
    info_common_commands_log$find_device_response_flags_c8_psk_in_multi_drop_only = finddeviceresponse$flags$C8PSK_IN_MULTI_DROP_ONLY;
    info_common_commands_log$find_device_response_flags_c8_psk_capable_field_device = finddeviceresponse$flags$C8PSK_CAPABLE_FIELD_DEVICE;
    info_common_commands_log$find_device_response_flags_undefined_5 = finddeviceresponse$flags$UNDEFINED_5;
    info_common_commands_log$find_device_response_flags_safehart_capable_field_device = finddeviceresponse$flags$SAFEHART_CAPABLE_FIELD_DEVICE;
    info_common_commands_log$find_device_response_flags_ieee_802_15_4_dsss_o_qpsk_modulation = finddeviceresponse$flags$IEEE_802_15_4_DSSS_O_QPSK_MODULATION;
    info_common_commands_log$find_device_response_flags_protocol_bridge_device = finddeviceresponse$flags$PROTOCOL_BRIDGE_DEVICE;
    info_common_commands_log$find_device_response_flags_eeprom_control = finddeviceresponse$flags$EEPROM_CONTROL;
    info_common_commands_log$find_device_response_flags_mutli_sensor_field_device = finddeviceresponse$flags$MUTLI_SENSOR_FIELD_DEVICE;
    info_common_commands_log$find_device_response_device_id = finddeviceresponse$deviceID;
    info_common_commands_log$find_device_response_number_preambles_slave_master = finddeviceresponse$numberPreamblesSlaveMaster;
    info_common_commands_log$find_device_response_last_device_variable_this = finddeviceresponse$lastDeviceVariableThis;
    info_common_commands_log$find_device_response_configuration_change_counter = finddeviceresponse$configurationChangeCounter;
    info_common_commands_log$find_device_response_extended_field_device_status_undefined_bits = finddeviceresponse$extendedFieldDeviceStatus$UNDEFINED_BITS;
    info_common_commands_log$find_device_response_extended_field_device_status_function_check = finddeviceresponse$extendedFieldDeviceStatus$FUNCTION_CHECK;
    info_common_commands_log$find_device_response_extended_field_device_status_out_of_specification = finddeviceresponse$extendedFieldDeviceStatus$OUT_OF_SPECIFICATION;
    info_common_commands_log$find_device_response_extended_field_device_status_failure = finddeviceresponse$extendedFieldDeviceStatus$FAILURE;
    info_common_commands_log$find_device_response_extended_field_device_status_critical_power_failure = finddeviceresponse$extendedFieldDeviceStatus$CRITICAL_POWER_FAILURE;
    info_common_commands_log$find_device_response_extended_field_device_status_device_variable_alert = finddeviceresponse$extendedFieldDeviceStatus$DEVICE_VARIABLE_ALERT;
    info_common_commands_log$find_device_response_extended_field_device_status_maintenance_required = finddeviceresponse$extendedFieldDeviceStatus$MAINTENANCE_REQUIRED;
    info_common_commands_log$find_device_response_manufacturer_identification_code = HART_IP_ENUM::MANUFACTURER_IDENTIFICATION_CODES[finddeviceresponse$manufacturerIdentificationCode];
    info_common_commands_log$find_device_response_private_label_distributor_code = HART_IP_ENUM::MANUFACTURER_IDENTIFICATION_CODES[finddeviceresponse$privateLabelDistributorCode];
    info_common_commands_log$find_device_response_device_profile = HART_IP_ENUM::DEVICE_PROFILE_CODES[finddeviceresponse$deviceProfile];
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadIOSystemCapabilitiesResponseEvt (c: connection, is_orig: bool, readiosystemcapabilitiesresponse: HART_IP_COMMON_COMMANDS::ReadIOSystemCapabilitiesResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readiosystemcapabilitiesresponse$commandNumberLinkID;
    info_common_commands_log$read_io_system_capabilities_response_max_io_cards = readiosystemcapabilitiesresponse$maxIOCards;
    info_common_commands_log$read_io_system_capabilities_response_max_channels_per_io_card = readiosystemcapabilitiesresponse$maxChannelsPerIOCard;
    info_common_commands_log$read_io_system_capabilities_response_max_sub_devices_per_channel = readiosystemcapabilitiesresponse$maxSubDevicesPerChannel;
    info_common_commands_log$read_io_system_capabilities_response_number_of_devices_detected = readiosystemcapabilitiesresponse$numberOfDevicesDetected;
    info_common_commands_log$read_io_system_capabilities_response_max_delayed_responses_supported = readiosystemcapabilitiesresponse$maxDelayedResponsesSupported;
    info_common_commands_log$read_io_system_capabilities_response_master_mode = HART_IP_ENUM::MASTER_MODE[readiosystemcapabilitiesresponse$masterMode];
    info_common_commands_log$read_io_system_capabilities_response_retry_count = readiosystemcapabilitiesresponse$retryCount;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::PollSubDeviceRequestEvt (c: connection, is_orig: bool, pollsubdevicerequest: HART_IP_COMMON_COMMANDS::PollSubDeviceRequest) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = pollsubdevicerequest$commandNumberLinkID;
    info_common_commands_log$poll_sub_device_request_io_card = pollsubdevicerequest$ioCard;
    info_common_commands_log$poll_sub_device_request_channel = pollsubdevicerequest$channel;
    info_common_commands_log$poll_sub_device_request_sub_device_polling_address = pollsubdevicerequest$subDevicePollingAddress;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::PollSubDeviceResponseEvt (c: connection, is_orig: bool, pollsubdeviceresponse: HART_IP_COMMON_COMMANDS::PollSubDeviceResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = pollsubdeviceresponse$commandNumberLinkID;
    info_common_commands_log$poll_sub_device_response__254 = pollsubdeviceresponse$_254;
    info_common_commands_log$poll_sub_device_response_expanded_device_type = HART_IP_ENUM::EXPANDED_DEVICE_TYPE_CODES[pollsubdeviceresponse$expandedDeviceType];
    info_common_commands_log$poll_sub_device_response_minimum_preambles_master_slave = pollsubdeviceresponse$minimumPreamblesMasterSlave;
    info_common_commands_log$poll_sub_device_response_hart_protocol_major_revision = pollsubdeviceresponse$hartProtocolMajorRevision;
    info_common_commands_log$poll_sub_device_response_device_revision_level = pollsubdeviceresponse$deviceRevisionLevel;
    info_common_commands_log$poll_sub_device_response_software_revision_level = pollsubdeviceresponse$softwareRevisionLevel;
    info_common_commands_log$poll_sub_device_response_hardware_revision_level_and_physical_signaling_codes_hardware_revision_level = pollsubdeviceresponse$hardwareRevisionLevelAndPhysicalSignalingCodes$hardwareRevisionLevel;
    info_common_commands_log$poll_sub_device_response_hardware_revision_level_and_physical_signaling_codes_physical_signaling_code = HART_IP_ENUM::PHYSICAL_SIGNALING_CODES[pollsubdeviceresponse$hardwareRevisionLevelAndPhysicalSignalingCodes$physicalSignalingCode];
    info_common_commands_log$poll_sub_device_response_flags_c8_psk_in_multi_drop_only = pollsubdeviceresponse$flags$C8PSK_IN_MULTI_DROP_ONLY;
    info_common_commands_log$poll_sub_device_response_flags_c8_psk_capable_field_device = pollsubdeviceresponse$flags$C8PSK_CAPABLE_FIELD_DEVICE;
    info_common_commands_log$poll_sub_device_response_flags_undefined_5 = pollsubdeviceresponse$flags$UNDEFINED_5;
    info_common_commands_log$poll_sub_device_response_flags_safehart_capable_field_device = pollsubdeviceresponse$flags$SAFEHART_CAPABLE_FIELD_DEVICE;
    info_common_commands_log$poll_sub_device_response_flags_ieee_802_15_4_dsss_o_qpsk_modulation = pollsubdeviceresponse$flags$IEEE_802_15_4_DSSS_O_QPSK_MODULATION;
    info_common_commands_log$poll_sub_device_response_flags_protocol_bridge_device = pollsubdeviceresponse$flags$PROTOCOL_BRIDGE_DEVICE;
    info_common_commands_log$poll_sub_device_response_flags_eeprom_control = pollsubdeviceresponse$flags$EEPROM_CONTROL;
    info_common_commands_log$poll_sub_device_response_flags_mutli_sensor_field_device = pollsubdeviceresponse$flags$MUTLI_SENSOR_FIELD_DEVICE;
    info_common_commands_log$poll_sub_device_response_device_id = pollsubdeviceresponse$deviceID;
    info_common_commands_log$poll_sub_device_response_number_preambles_slave_master = pollsubdeviceresponse$numberPreamblesSlaveMaster;
    info_common_commands_log$poll_sub_device_response_last_device_variable_this = pollsubdeviceresponse$lastDeviceVariableThis;
    info_common_commands_log$poll_sub_device_response_configuration_change_counter = pollsubdeviceresponse$configurationChangeCounter;
    info_common_commands_log$poll_sub_device_response_extended_field_device_status_undefined_bits = pollsubdeviceresponse$extendedFieldDeviceStatus$UNDEFINED_BITS;
    info_common_commands_log$poll_sub_device_response_extended_field_device_status_function_check = pollsubdeviceresponse$extendedFieldDeviceStatus$FUNCTION_CHECK;
    info_common_commands_log$poll_sub_device_response_extended_field_device_status_out_of_specification = pollsubdeviceresponse$extendedFieldDeviceStatus$OUT_OF_SPECIFICATION;
    info_common_commands_log$poll_sub_device_response_extended_field_device_status_failure = pollsubdeviceresponse$extendedFieldDeviceStatus$FAILURE;
    info_common_commands_log$poll_sub_device_response_extended_field_device_status_critical_power_failure = pollsubdeviceresponse$extendedFieldDeviceStatus$CRITICAL_POWER_FAILURE;
    info_common_commands_log$poll_sub_device_response_extended_field_device_status_device_variable_alert = pollsubdeviceresponse$extendedFieldDeviceStatus$DEVICE_VARIABLE_ALERT;
    info_common_commands_log$poll_sub_device_response_extended_field_device_status_maintenance_required = pollsubdeviceresponse$extendedFieldDeviceStatus$MAINTENANCE_REQUIRED;
    info_common_commands_log$poll_sub_device_response_manufacturer_identification_code = HART_IP_ENUM::MANUFACTURER_IDENTIFICATION_CODES[pollsubdeviceresponse$manufacturerIdentificationCode];
    info_common_commands_log$poll_sub_device_response_private_label_distributor_code = HART_IP_ENUM::MANUFACTURER_IDENTIFICATION_CODES[pollsubdeviceresponse$privateLabelDistributorCode];
    info_common_commands_log$poll_sub_device_response_device_profile = HART_IP_ENUM::DEVICE_PROFILE_CODES[pollsubdeviceresponse$deviceProfile];
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadLockDeviceStateResponseEvt (c: connection, is_orig: bool, readlockdevicestateresponse: HART_IP_COMMON_COMMANDS::ReadLockDeviceStateResponse) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readlockdevicestateresponse$commandNumberLinkID;
    info_common_commands_log$read_lock_device_state_response_lock_status_undefined_bits = readlockdevicestateresponse$lockStatus$UNDEFINED_BITS;
    info_common_commands_log$read_lock_device_state_response_lock_status_lock_gateway = readlockdevicestateresponse$lockStatus$LOCK_GATEWAY;
    info_common_commands_log$read_lock_device_state_response_lock_status_configuration_locked = readlockdevicestateresponse$lockStatus$CONFIGURATION_LOCKED;
    info_common_commands_log$read_lock_device_state_response_lock_status_lock_primary = readlockdevicestateresponse$lockStatus$LOCK_PRIMARY;
    info_common_commands_log$read_lock_device_state_response_lock_status_lock_permanent = readlockdevicestateresponse$lockStatus$LOCK_PERMANENT;
    info_common_commands_log$read_lock_device_state_response_lock_status_device_locked = readlockdevicestateresponse$lockStatus$DEVICE_LOCKED;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteDeviceVariableEvt (c: connection, is_orig: bool, writedevicevariable: HART_IP_COMMON_COMMANDS::WriteDeviceVariable) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writedevicevariable$commandNumberLinkID;
    info_common_commands_log$write_device_variable_device_variable_code = writedevicevariable$deviceVariableCode;
    info_common_commands_log$write_device_variable_write_device_variable_command_code = HART_IP_ENUM::WRITE_DEVICE_VARIABLE_CODES[writedevicevariable$writeDeviceVariableCommandCode];
    info_common_commands_log$write_device_variable_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[writedevicevariable$unitsCode];
    info_common_commands_log$write_device_variable_device_variable_value = writedevicevariable$deviceVariableValue;
    info_common_commands_log$write_device_variable_device_variable_status_process_data_status = HART_IP_ENUM::PROCESS_DATA_STATUS[writedevicevariable$deviceVariableStatus$PROCESS_DATA_STATUS];
    info_common_commands_log$write_device_variable_device_variable_status_limit_status = HART_IP_ENUM::LIMIT_STATUS[writedevicevariable$deviceVariableStatus$LIMIT_STATUS];
    info_common_commands_log$write_device_variable_device_variable_status_more_device_variable_status_available = writedevicevariable$deviceVariableStatus$MORE_DEVICE_VARIABLE_STATUS_AVAILABLE;
    info_common_commands_log$write_device_variable_device_variable_status_device_family_specific_status = writedevicevariable$deviceVariableStatus$DEVICE_FAMILY_SPECIFIC_STATUS;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadDeviceVariableTrimPointsEvt (c: connection, is_orig: bool, readdevicevariabletrimpoints: HART_IP_COMMON_COMMANDS::ReadDeviceVariableTrimPoints) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readdevicevariabletrimpoints$commandNumberLinkID;
    info_common_commands_log$read_device_variable_trim_points_device_variable_code = readdevicevariabletrimpoints$deviceVariableCode;
    if (readdevicevariabletrimpoints?$readDeviceVariableTrimPointsResponse){
        info_common_commands_log$read_device_variable_trim_points_response_trim_points_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariabletrimpoints$readDeviceVariableTrimPointsResponse$trimPointsUnitsCode];
        info_common_commands_log$read_device_variable_trim_points_response_lower_or_single_trim_point = readdevicevariabletrimpoints$readDeviceVariableTrimPointsResponse$lowerOrSingleTrimPoint;
        info_common_commands_log$read_device_variable_trim_points_response_upper_trim_point = readdevicevariabletrimpoints$readDeviceVariableTrimPointsResponse$upperTrimPoint;
    }
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadDeviceVariableTrimGuidelinesEvt (c: connection, is_orig: bool, readdevicevariabletrimguidelines: HART_IP_COMMON_COMMANDS::ReadDeviceVariableTrimGuidelines) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readdevicevariabletrimguidelines$commandNumberLinkID;
    info_common_commands_log$read_device_variable_trim_guidelines_device_variable_guidelines = readdevicevariabletrimguidelines$deviceVariableGuidelines;
    if (readdevicevariabletrimguidelines?$readDeviceVariableTrimGuidelinesResponse){
        info_common_commands_log$read_device_variable_trim_points_response_trim_points_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[readdevicevariabletrimguidelines$readDeviceVariableTrimGuidelinesResponse$trimPointsUnitsCode];
        info_common_commands_log$read_device_variable_trim_points_response_lower_or_single_trim_point = readdevicevariabletrimguidelines$readDeviceVariableTrimGuidelinesResponse$lowerOrSingleTrimPoint;
        info_common_commands_log$read_device_variable_trim_points_response_upper_trim_point = readdevicevariabletrimguidelines$readDeviceVariableTrimGuidelinesResponse$upperTrimPoint;
    }
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteDeviceVariableTrimPointEvt (c: connection, is_orig: bool, writedevicevariabletrimpoint: HART_IP_COMMON_COMMANDS::WriteDeviceVariableTrimPoint) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writedevicevariabletrimpoint$commandNumberLinkID;
    info_common_commands_log$write_device_variable_trim_point_device_variable_to_trim = writedevicevariabletrimpoint$deviceVariableToTrim;
    info_common_commands_log$write_device_variable_trim_point_trim_point = HART_IP_ENUM::TRIM_POINT_CODES[writedevicevariabletrimpoint$trimPoint];
    info_common_commands_log$write_device_variable_trim_point_trim_points_units_code = HART_IP_ENUM::ENGINEERING_UNIT_CODES[writedevicevariabletrimpoint$trimPointsUnitsCode];
    info_common_commands_log$write_device_variable_trim_point_trim_point_value = writedevicevariabletrimpoint$trimPointValue;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ResetDeviceVariableTrimEvt (c: connection, is_orig: bool, resetdevicevariabletrim: HART_IP_COMMON_COMMANDS::ResetDeviceVariableTrim) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = resetdevicevariabletrim$commandNumberLinkID;
    info_common_commands_log$reset_device_variable_trim_device_variable_trim_to_reset = resetdevicevariabletrim$deviceVariableTrimToReset;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadSubDeviceIdentitySummaryEvt (c: connection, is_orig: bool, readsubdeviceidentitysummary: HART_IP_COMMON_COMMANDS::ReadSubDeviceIdentitySummary) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readsubdeviceidentitysummary$commandNumberLinkID;
    info_common_commands_log$read_sub_device_identity_summary_sub_device_index = readsubdeviceidentitysummary$subDeviceIndex;
    if (readsubdeviceidentitysummary?$readSubDeviceIdentitySummaryResponse){
        info_common_commands_log$read_sub_device_identity_summary_response_io_card = readsubdeviceidentitysummary$readSubDeviceIdentitySummaryResponse$ioCard;
        info_common_commands_log$read_sub_device_identity_summary_response_channel = readsubdeviceidentitysummary$readSubDeviceIdentitySummaryResponse$channel;
        info_common_commands_log$read_sub_device_identity_summary_response_manufacturer_identification_code = HART_IP_ENUM::MANUFACTURER_IDENTIFICATION_CODES[readsubdeviceidentitysummary$readSubDeviceIdentitySummaryResponse$manufacturerIdentificationCode];
        info_common_commands_log$read_sub_device_identity_summary_response_expanded_device_type = HART_IP_ENUM::EXPANDED_DEVICE_TYPE_CODES[readsubdeviceidentitysummary$readSubDeviceIdentitySummaryResponse$expandedDeviceType];
        info_common_commands_log$read_sub_device_identity_summary_response_device_id = readsubdeviceidentitysummary$readSubDeviceIdentitySummaryResponse$deviceID;
        info_common_commands_log$read_sub_device_identity_summary_response_universal_command_revision_level = readsubdeviceidentitysummary$readSubDeviceIdentitySummaryResponse$universalCommandRevisionLevel;
        info_common_commands_log$read_sub_device_identity_summary_response_long_tag = readsubdeviceidentitysummary$readSubDeviceIdentitySummaryResponse$longTag;
        info_common_commands_log$read_sub_device_identity_summary_response_device_revision = readsubdeviceidentitysummary$readSubDeviceIdentitySummaryResponse$deviceRevision;
        info_common_commands_log$read_sub_device_identity_summary_response_device_profile = HART_IP_ENUM::DEVICE_PROFILE_CODES[readsubdeviceidentitysummary$readSubDeviceIdentitySummaryResponse$deviceProfile];
        info_common_commands_log$read_sub_device_identity_summary_response_private_label_distributor_code = HART_IP_ENUM::MANUFACTURER_IDENTIFICATION_CODES[readsubdeviceidentitysummary$readSubDeviceIdentitySummaryResponse$privateLabelDistributorCode];
    }
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadIOChannelStatisticsEvt (c: connection, is_orig: bool, readiochannelstatistics: HART_IP_COMMON_COMMANDS::ReadIOChannelStatistics) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readiochannelstatistics$commandNumberLinkID;
    info_common_commands_log$read_io_channel_statistics_io_card = readiochannelstatistics$ioCard;
    info_common_commands_log$read_io_channel_statistics_channel = readiochannelstatistics$channel;
    if (readiochannelstatistics?$readIOChannelStatisticsResponse){
        info_common_commands_log$read_io_channel_statistics_response_stx_count = readiochannelstatistics$readIOChannelStatisticsResponse$stxCount;
        info_common_commands_log$read_io_channel_statistics_response_ack_count = readiochannelstatistics$readIOChannelStatisticsResponse$ackCount;
        info_common_commands_log$read_io_channel_statistics_response_ostx_count = readiochannelstatistics$readIOChannelStatisticsResponse$ostxCount;
        info_common_commands_log$read_io_channel_statistics_response_oack_count = readiochannelstatistics$readIOChannelStatisticsResponse$oackCount;
        info_common_commands_log$read_io_channel_statistics_response_back_count = readiochannelstatistics$readIOChannelStatisticsResponse$backCount;
    }
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::ReadSubDeviceStatisticsEvt (c: connection, is_orig: bool, readsubdevicestatistics: HART_IP_COMMON_COMMANDS::ReadSubDeviceStatistics) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = readsubdevicestatistics$commandNumberLinkID;
    info_common_commands_log$read_sub_device_statistics_sub_device_index = readsubdevicestatistics$subDeviceIndex;
    if (readsubdevicestatistics?$readSubDeviceStatisticsResponse){
        info_common_commands_log$read_sub_device_statistics_response_stx_count = readsubdevicestatistics$readSubDeviceStatisticsResponse$stxCount;
        info_common_commands_log$read_sub_device_statistics_response_ack_count = readsubdevicestatistics$readSubDeviceStatisticsResponse$ackCount;
        info_common_commands_log$read_sub_device_statistics_response_back_count = readsubdevicestatistics$readSubDeviceStatisticsResponse$backCount;
    }
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteIOSystemMasterModeEvt (c: connection, is_orig: bool, writeiosystemmastermode: HART_IP_COMMON_COMMANDS::WriteIOSystemMasterMode) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writeiosystemmastermode$commandNumberLinkID;
    info_common_commands_log$write_io_system_master_mode_master_mode = HART_IP_ENUM::MASTER_MODE[writeiosystemmastermode$masterMode];
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::WriteIOSystemRetryCountEvt (c: connection, is_orig: bool, writeiosystemretrycount: HART_IP_COMMON_COMMANDS::WriteIOSystemRetryCount) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = writeiosystemretrycount$commandNumberLinkID;
    info_common_commands_log$write_io_system_retry_count_retry_count = writeiosystemretrycount$retryCount;
    HART_IP::emit_hart_ip_common_commands_log(c);
}
event HART_IP_COMMON_COMMANDS::SetRealTimeClockEvt (c: connection, is_orig: bool, setrealtimeclock: HART_IP_COMMON_COMMANDS::SetRealTimeClock) {
    hook set_session_common_commands_log(c);

    local info_common_commands_log = c$hart_ip_common_commands_log;

    info_common_commands_log$command_number_link_id = setrealtimeclock$commandNumberLinkID;
    info_common_commands_log$set_real_time_clock_time_set_code = HART_IP_ENUM::TIME_SET_CODES[setrealtimeclock$timeSetCode];
    info_common_commands_log$set_real_time_clock_date = setrealtimeclock$date;
    info_common_commands_log$set_real_time_clock_time_of_day = setrealtimeclock$timeOfDay;
    # Concatenate the date and time
    local datetime_str = fmt("%s %s", setrealtimeclock$date, setrealtimeclock$timeOfDay);

    # Parse the combined string to a Zeek time value (UNIX epoch)
    # Format string must match input format exactly
    local parsed_time: time = strptime("%B %d, %Y %H:%M:%S", datetime_str);

    #info_common_commands_log$set_real_time_clock_timestamp = parsed_time;
    if (setrealtimeclock?$nullBytes){
        info_common_commands_log$set_real_time_clock_null_bytes = setrealtimeclock$nullBytes;
    }
    HART_IP::emit_hart_ip_common_commands_log(c);
}


