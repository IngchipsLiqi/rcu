att_dispatch_client_can_send_now = 0x0000565d;
att_dispatch_client_request_can_send_now_event = 0x00005663;
att_dispatch_register_client = 0x00005669;
att_dispatch_register_server = 0x0000567d;
att_dispatch_server_can_send_now = 0x00005691;
att_dispatch_server_request_can_send_now_event = 0x00005697;
att_emit_general_event = 0x00005749;
att_server_can_send_packet_now = 0x00005e79;
att_server_deferred_read_response = 0x00005e7d;
att_server_get_mtu = 0x00005e95;
att_server_indicate = 0x00005f0d;
att_server_init = 0x00005f91;
att_server_notify = 0x00005fcd;
att_server_register_packet_handler = 0x000060e5;
att_server_request_can_send_now_event = 0x000060f1;
att_set_db = 0x0000610d;
att_set_read_callback = 0x00006121;
att_set_write_callback = 0x0000612d;
bd_addr_cmp = 0x0000629d;
bd_addr_copy = 0x000062a3;
bd_addr_to_str = 0x000062ad;
big_endian_read_16 = 0x000062e5;
big_endian_read_32 = 0x000062ed;
big_endian_store_16 = 0x00006301;
big_endian_store_32 = 0x0000630d;
btstack_config = 0x00006445;
btstack_memory_pool_create = 0x00006593;
btstack_memory_pool_free = 0x000065bd;
btstack_memory_pool_get = 0x0000661d;
btstack_push_user_msg = 0x00006665;
btstack_push_user_runnable = 0x00006671;
char_for_nibble = 0x000068e1;
gap_add_dev_to_periodic_list = 0x0000715d;
gap_add_whitelist = 0x0000716d;
gap_aes_encrypt = 0x00007179;
gap_clear_white_lists = 0x000071b1;
gap_clr_adv_set = 0x000071bd;
gap_clr_periodic_adv_list = 0x000071c9;
gap_create_connection_cancel = 0x000071d5;
gap_disconnect = 0x000071e1;
gap_disconnect_all = 0x0000720d;
gap_ext_create_connection = 0x0000724d;
gap_get_connection_parameter_range = 0x0000732d;
gap_le_read_channel_map = 0x00007369;
gap_periodic_adv_create_sync = 0x000073d5;
gap_periodic_adv_create_sync_cancel = 0x000073f9;
gap_periodic_adv_term_sync = 0x00007405;
gap_read_periodic_adv_list_size = 0x0000748d;
gap_read_phy = 0x00007499;
gap_read_remote_used_features = 0x000074a5;
gap_read_remote_version = 0x000074b1;
gap_read_rssi = 0x000074bd;
gap_remove_whitelist = 0x000074c9;
gap_rmv_adv_set = 0x00007545;
gap_rmv_dev_from_periodic_list = 0x00007551;
gap_rx_test_v2 = 0x00007561;
gap_set_adv_set_random_addr = 0x00007599;
gap_set_callback_for_next_hci = 0x000075d5;
gap_set_connection_parameter_range = 0x000075f5;
gap_set_data_length = 0x0000760d;
gap_set_def_phy = 0x00007625;
gap_set_ext_adv_data = 0x00007635;
gap_set_ext_adv_enable = 0x0000764d;
gap_set_ext_adv_para = 0x000076c9;
gap_set_ext_scan_enable = 0x000077a1;
gap_set_ext_scan_para = 0x000077b9;
gap_set_ext_scan_response_data = 0x00007861;
gap_set_host_channel_classification = 0x00007879;
gap_set_periodic_adv_data = 0x00007889;
gap_set_periodic_adv_enable = 0x000078f9;
gap_set_periodic_adv_para = 0x00007909;
gap_set_phy = 0x00007921;
gap_set_random_device_address = 0x0000793d;
gap_start_ccm = 0x0000796d;
gap_test_end = 0x000079b5;
gap_tx_test_v2 = 0x000079c1;
gap_tx_test_v4 = 0x000079d9;
gap_update_connection_parameters = 0x000079fd;
gap_vendor_tx_continuous_wave = 0x00007a41;
gatt_client_cancel_write = 0x00007f69;
gatt_client_discover_characteristic_descriptors = 0x00007f8f;
gatt_client_discover_characteristics_for_handle_range_by_uuid128 = 0x00007fcf;
gatt_client_discover_characteristics_for_handle_range_by_uuid16 = 0x0000801f;
gatt_client_discover_characteristics_for_service = 0x0000806f;
gatt_client_discover_primary_services = 0x000080a5;
gatt_client_discover_primary_services_by_uuid128 = 0x000080d7;
gatt_client_discover_primary_services_by_uuid16 = 0x0000811b;
gatt_client_execute_write = 0x00008157;
gatt_client_find_included_services_for_service = 0x0000817d;
gatt_client_get_mtu = 0x000081ab;
gatt_client_is_ready = 0x0000824d;
gatt_client_listen_for_characteristic_value_updates = 0x00008263;
gatt_client_prepare_write = 0x00008285;
gatt_client_read_characteristic_descriptor_using_descriptor_handle = 0x000082c1;
gatt_client_read_long_characteristic_descriptor_using_descriptor_handle = 0x000082eb;
gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset = 0x000082f1;
gatt_client_read_long_value_of_characteristic_using_value_handle = 0x0000831f;
gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset = 0x00008325;
gatt_client_read_multiple_characteristic_values = 0x00008353;
gatt_client_read_value_of_characteristic_using_value_handle = 0x00008383;
gatt_client_read_value_of_characteristics_by_uuid128 = 0x000083b1;
gatt_client_read_value_of_characteristics_by_uuid16 = 0x000083fd;
gatt_client_register_handler = 0x00008449;
gatt_client_reliable_write_long_value_of_characteristic = 0x00008455;
gatt_client_signed_write_without_response = 0x00008885;
gatt_client_write_characteristic_descriptor_using_descriptor_handle = 0x00008949;
gatt_client_write_client_characteristic_configuration = 0x00008983;
gatt_client_write_long_characteristic_descriptor_using_descriptor_handle = 0x000089d5;
gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset = 0x000089e5;
gatt_client_write_long_value_of_characteristic = 0x00008a21;
gatt_client_write_long_value_of_characteristic_with_offset = 0x00008a31;
gatt_client_write_value_of_characteristic = 0x00008a6d;
gatt_client_write_value_of_characteristic_without_response = 0x00008aa3;
hci_add_event_handler = 0x00009fc9;
hci_power_control = 0x0000a749;
hci_register_acl_packet_handler = 0x0000a8fd;
kv_commit = 0x0000b079;
kv_get = 0x0000b0d5;
kv_init = 0x0000b0e1;
kv_init_backend = 0x0000b161;
kv_put = 0x0000b175;
kv_remove = 0x0000b181;
kv_remove_all = 0x0000b1b5;
kv_value_modified = 0x0000b1e5;
kv_value_modified_of_key = 0x0000b201;
kv_visit = 0x0000b20d;
l2cap_add_event_handler = 0x0000b29d;
l2cap_can_send_packet_now = 0x0000b2ad;
l2cap_create_le_credit_based_connection_request = 0x0000b469;
l2cap_credit_based_send = 0x0000b5ad;
l2cap_credit_based_send_continue = 0x0000b5d9;
l2cap_disconnect = 0x0000b655;
l2cap_get_le_credit_based_connection_credits = 0x0000b8a5;
l2cap_get_peer_mtu_for_local_cid = 0x0000b8c1;
l2cap_init = 0x0000bc95;
l2cap_le_send_flow_control_credit = 0x0000bd8b;
l2cap_max_le_mtu = 0x0000c095;
l2cap_register_packet_handler = 0x0000c1bd;
l2cap_register_service = 0x0000c1c9;
l2cap_request_can_send_now_event = 0x0000c2d9;
l2cap_request_connection_parameter_update = 0x0000c2f3;
l2cap_send_echo_request = 0x0000c7cd;
l2cap_unregister_service = 0x0000c88d;
le_device_db_add = 0x0000c8e5;
le_device_db_find = 0x0000c9bd;
le_device_db_from_key = 0x0000c9e9;
le_device_db_iter_cur = 0x0000c9f1;
le_device_db_iter_cur_key = 0x0000c9f5;
le_device_db_iter_init = 0x0000c9f9;
le_device_db_iter_next = 0x0000ca01;
le_device_db_remove_key = 0x0000ca27;
ll_aes_encrypt = 0x0000ca55;
ll_config = 0x0000cad1;
ll_free = 0x0000cb07;
ll_get_heap_free_size = 0x0000cb11;
ll_hint_on_ce_len = 0x0000cb25;
ll_legacy_adv_set_interval = 0x0000cb5d;
ll_malloc = 0x0000cb6d;
ll_query_timing_info = 0x0000cca5;
ll_register_hci_acl_previewer = 0x0000ccf1;
ll_scan_set_fixed_channel = 0x0000cd55;
ll_set_adv_access_address = 0x0000cf6d;
ll_set_adv_coded_scheme = 0x0000cf79;
ll_set_conn_acl_report_latency = 0x0000cfa9;
ll_set_conn_coded_scheme = 0x0000cfd9;
ll_set_conn_latency = 0x0000d005;
ll_set_conn_tx_power = 0x0000d035;
ll_set_def_antenna = 0x0000d07d;
ll_set_initiating_coded_scheme = 0x0000d099;
ll_set_max_conn_number = 0x0000d0a5;
nibble_for_char = 0x0001d221;
platform_32k_rc_auto_tune = 0x0001d2bd;
platform_32k_rc_tune = 0x0001d339;
platform_calibrate_32k = 0x0001d34d;
platform_config = 0x0001d351;
platform_controller_run = 0x0001d475;
platform_delete_timer = 0x0001d4a9;
platform_enable_irq = 0x0001d4b1;
platform_get_gen_os_driver = 0x0001d4e9;
platform_get_task_handle = 0x0001d4f5;
platform_get_timer_counter = 0x0001d50d;
platform_get_us_time = 0x0001d511;
platform_get_version = 0x0001d515;
platform_hrng = 0x0001d51d;
platform_init_controller = 0x0001d525;
platform_os_idle_resumed_hook = 0x0001d541;
platform_patch_rf_init_data = 0x0001d545;
platform_post_sleep_processing = 0x0001d551;
platform_pre_sleep_processing = 0x0001d557;
platform_pre_suppress_ticks_and_sleep_processing = 0x0001d55d;
platform_printf = 0x0001d561;
platform_raise_assertion = 0x0001d575;
platform_rand = 0x0001d589;
platform_read_info = 0x0001d58d;
platform_read_persistent_reg = 0x0001d5bd;
platform_reset = 0x0001d5cd;
platform_set_abs_timer = 0x0001d5f1;
platform_set_evt_callback = 0x0001d5f5;
platform_set_evt_callback_table = 0x0001d609;
platform_set_irq_callback = 0x0001d615;
platform_set_irq_callback_table = 0x0001d631;
platform_set_rf_clk_source = 0x0001d63d;
platform_set_rf_init_data = 0x0001d649;
platform_set_rf_power_mapping = 0x0001d655;
platform_set_timer = 0x0001d661;
platform_shutdown = 0x0001d665;
platform_switch_app = 0x0001d669;
platform_trace_raw = 0x0001d695;
platform_write_persistent_reg = 0x0001d6ad;
printf_hexdump = 0x0001d6bd;
reverse_128 = 0x0001d9fd;
reverse_24 = 0x0001da03;
reverse_256 = 0x0001da09;
reverse_48 = 0x0001da0f;
reverse_56 = 0x0001da15;
reverse_64 = 0x0001da1b;
reverse_bd_addr = 0x0001da21;
reverse_bytes = 0x0001da27;
sm_add_event_handler = 0x0001db95;
sm_address_resolution_lookup = 0x0001dced;
sm_authenticated = 0x0001e069;
sm_authorization_decline = 0x0001e077;
sm_authorization_grant = 0x0001e097;
sm_authorization_state = 0x0001e0b7;
sm_bonding_decline = 0x0001e0d1;
sm_config = 0x0001e52d;
sm_config_conn = 0x0001e545;
sm_encryption_key_size = 0x0001e6fb;
sm_just_works_confirm = 0x0001ec81;
sm_le_device_key = 0x0001efcd;
sm_passkey_input = 0x0001f063;
sm_private_random_address_generation_get = 0x0001f41d;
sm_private_random_address_generation_get_mode = 0x0001f425;
sm_private_random_address_generation_set_mode = 0x0001f431;
sm_private_random_address_generation_set_update_period = 0x0001f459;
sm_register_external_ltk_callback = 0x0001f595;
sm_register_oob_data_callback = 0x0001f5a1;
sm_request_pairing = 0x0001f5ad;
sm_send_security_request = 0x00020083;
sm_set_accepted_stk_generation_methods = 0x000200a9;
sm_set_authentication_requirements = 0x000200b5;
sm_set_encryption_key_size_range = 0x000200c1;
sscanf_bd_addr = 0x0002041d;
sysSetPublicDeviceAddr = 0x000207d1;
uuid128_to_str = 0x00020db5;
uuid_add_bluetooth_prefix = 0x00020e0d;
uuid_has_bluetooth_prefix = 0x00020e2d;
