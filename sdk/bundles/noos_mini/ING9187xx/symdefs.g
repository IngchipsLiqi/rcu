att_dispatch_client_can_send_now = 0x00005655;
att_dispatch_client_request_can_send_now_event = 0x0000565b;
att_dispatch_register_client = 0x00005661;
att_dispatch_register_server = 0x00005675;
att_dispatch_server_can_send_now = 0x00005689;
att_dispatch_server_request_can_send_now_event = 0x0000568f;
att_emit_general_event = 0x00005741;
att_server_can_send_packet_now = 0x00005e6d;
att_server_deferred_read_response = 0x00005e71;
att_server_get_mtu = 0x00005e89;
att_server_indicate = 0x00005ef5;
att_server_init = 0x00005f79;
att_server_notify = 0x00005fb5;
att_server_register_packet_handler = 0x000060cd;
att_server_request_can_send_now_event = 0x000060d9;
att_set_db = 0x000060f5;
att_set_read_callback = 0x00006109;
att_set_write_callback = 0x00006115;
bd_addr_cmp = 0x00006285;
bd_addr_copy = 0x0000628b;
bd_addr_to_str = 0x00006295;
big_endian_read_16 = 0x000062cd;
big_endian_read_32 = 0x000062d5;
big_endian_store_16 = 0x000062e9;
big_endian_store_32 = 0x000062f5;
btstack_config = 0x0000642d;
btstack_memory_pool_create = 0x0000657b;
btstack_memory_pool_free = 0x000065a5;
btstack_memory_pool_get = 0x00006605;
btstack_push_user_msg = 0x0000664d;
btstack_push_user_runnable = 0x00006659;
char_for_nibble = 0x000068c9;
gap_add_dev_to_periodic_list = 0x0000713d;
gap_add_whitelist = 0x0000714d;
gap_aes_encrypt = 0x00007159;
gap_clear_white_lists = 0x00007191;
gap_clr_adv_set = 0x0000719d;
gap_clr_periodic_adv_list = 0x000071a9;
gap_create_connection_cancel = 0x000071b5;
gap_disconnect = 0x000071c1;
gap_disconnect_all = 0x000071ed;
gap_ext_create_connection = 0x0000722d;
gap_get_connection_parameter_range = 0x0000730d;
gap_le_read_channel_map = 0x00007345;
gap_periodic_adv_create_sync = 0x000073b1;
gap_periodic_adv_create_sync_cancel = 0x000073d5;
gap_periodic_adv_term_sync = 0x000073e1;
gap_read_periodic_adv_list_size = 0x00007469;
gap_read_phy = 0x00007475;
gap_read_remote_used_features = 0x00007481;
gap_read_remote_version = 0x0000748d;
gap_read_rssi = 0x00007499;
gap_remove_whitelist = 0x000074a5;
gap_rmv_adv_set = 0x00007521;
gap_rmv_dev_from_periodic_list = 0x0000752d;
gap_rx_test_v2 = 0x0000753d;
gap_set_adv_set_random_addr = 0x00007575;
gap_set_callback_for_next_hci = 0x000075b1;
gap_set_connection_parameter_range = 0x000075d1;
gap_set_data_length = 0x000075e9;
gap_set_def_phy = 0x00007601;
gap_set_ext_adv_data = 0x00007611;
gap_set_ext_adv_enable = 0x00007629;
gap_set_ext_adv_para = 0x000076a5;
gap_set_ext_scan_enable = 0x0000777d;
gap_set_ext_scan_para = 0x00007795;
gap_set_ext_scan_response_data = 0x0000783d;
gap_set_host_channel_classification = 0x00007855;
gap_set_periodic_adv_data = 0x00007865;
gap_set_periodic_adv_enable = 0x000078d5;
gap_set_periodic_adv_para = 0x000078e5;
gap_set_phy = 0x000078fd;
gap_set_random_device_address = 0x00007919;
gap_start_ccm = 0x00007949;
gap_test_end = 0x00007991;
gap_tx_test_v2 = 0x0000799d;
gap_tx_test_v4 = 0x000079b5;
gap_update_connection_parameters = 0x000079d9;
gap_vendor_tx_continuous_wave = 0x00007a19;
gatt_client_cancel_write = 0x00007f41;
gatt_client_discover_characteristic_descriptors = 0x00007f67;
gatt_client_discover_characteristics_for_handle_range_by_uuid128 = 0x00007fa7;
gatt_client_discover_characteristics_for_handle_range_by_uuid16 = 0x00007ff7;
gatt_client_discover_characteristics_for_service = 0x00008047;
gatt_client_discover_primary_services = 0x0000807d;
gatt_client_discover_primary_services_by_uuid128 = 0x000080af;
gatt_client_discover_primary_services_by_uuid16 = 0x000080f3;
gatt_client_execute_write = 0x0000812f;
gatt_client_find_included_services_for_service = 0x00008155;
gatt_client_get_mtu = 0x00008183;
gatt_client_is_ready = 0x00008221;
gatt_client_listen_for_characteristic_value_updates = 0x00008237;
gatt_client_prepare_write = 0x00008257;
gatt_client_read_characteristic_descriptor_using_descriptor_handle = 0x00008293;
gatt_client_read_long_characteristic_descriptor_using_descriptor_handle = 0x000082bd;
gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset = 0x000082c3;
gatt_client_read_long_value_of_characteristic_using_value_handle = 0x000082f1;
gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset = 0x000082f7;
gatt_client_read_multiple_characteristic_values = 0x00008325;
gatt_client_read_value_of_characteristic_using_value_handle = 0x00008355;
gatt_client_read_value_of_characteristics_by_uuid128 = 0x00008383;
gatt_client_read_value_of_characteristics_by_uuid16 = 0x000083cf;
gatt_client_register_handler = 0x00008419;
gatt_client_reliable_write_long_value_of_characteristic = 0x00008425;
gatt_client_signed_write_without_response = 0x00008829;
gatt_client_write_characteristic_descriptor_using_descriptor_handle = 0x000088ed;
gatt_client_write_client_characteristic_configuration = 0x00008927;
gatt_client_write_long_characteristic_descriptor_using_descriptor_handle = 0x00008979;
gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset = 0x00008989;
gatt_client_write_long_value_of_characteristic = 0x000089c5;
gatt_client_write_long_value_of_characteristic_with_offset = 0x000089d5;
gatt_client_write_value_of_characteristic = 0x00008a11;
gatt_client_write_value_of_characteristic_without_response = 0x00008a47;
hci_add_event_handler = 0x00009f61;
hci_power_control = 0x0000a6cd;
hci_register_acl_packet_handler = 0x0000a881;
kv_commit = 0x0000aff1;
kv_get = 0x0000b04d;
kv_init = 0x0000b059;
kv_init_backend = 0x0000b0d5;
kv_put = 0x0000b0e9;
kv_remove = 0x0000b0f5;
kv_remove_all = 0x0000b129;
kv_value_modified = 0x0000b159;
kv_value_modified_of_key = 0x0000b175;
kv_visit = 0x0000b181;
l2cap_add_event_handler = 0x0000b211;
l2cap_can_send_packet_now = 0x0000b221;
l2cap_create_le_credit_based_connection_request = 0x0000b3dd;
l2cap_credit_based_send = 0x0000b521;
l2cap_credit_based_send_continue = 0x0000b54d;
l2cap_disconnect = 0x0000b5c9;
l2cap_get_le_credit_based_connection_credits = 0x0000b819;
l2cap_get_peer_mtu_for_local_cid = 0x0000b835;
l2cap_init = 0x0000bc09;
l2cap_le_send_flow_control_credit = 0x0000bcff;
l2cap_max_le_mtu = 0x0000c009;
l2cap_register_packet_handler = 0x0000c131;
l2cap_register_service = 0x0000c13d;
l2cap_request_can_send_now_event = 0x0000c24d;
l2cap_request_connection_parameter_update = 0x0000c267;
l2cap_send_echo_request = 0x0000c741;
l2cap_unregister_service = 0x0000c801;
le_device_db_add = 0x0000c859;
le_device_db_find = 0x0000c921;
le_device_db_from_key = 0x0000c94d;
le_device_db_iter_cur = 0x0000c955;
le_device_db_iter_cur_key = 0x0000c959;
le_device_db_iter_init = 0x0000c95d;
le_device_db_iter_next = 0x0000c965;
le_device_db_remove_key = 0x0000c98b;
ll_aes_encrypt = 0x0000c9b9;
ll_config = 0x0000ca35;
ll_free = 0x0000ca6b;
ll_get_heap_free_size = 0x0000ca75;
ll_hint_on_ce_len = 0x0000ca89;
ll_legacy_adv_set_interval = 0x0000cac1;
ll_malloc = 0x0000cad1;
ll_query_timing_info = 0x0000cc09;
ll_register_hci_acl_previewer = 0x0000cc55;
ll_scan_set_fixed_channel = 0x0000ccb9;
ll_set_adv_access_address = 0x0000ced1;
ll_set_adv_coded_scheme = 0x0000cedd;
ll_set_conn_acl_report_latency = 0x0000cf05;
ll_set_conn_coded_scheme = 0x0000cf31;
ll_set_conn_latency = 0x0000cf59;
ll_set_conn_tx_power = 0x0000cf85;
ll_set_def_antenna = 0x0000cfc9;
ll_set_initiating_coded_scheme = 0x0000cfe5;
ll_set_max_conn_number = 0x0000cff1;
nibble_for_char = 0x0001d059;
platform_32k_rc_auto_tune = 0x0001d0e9;
platform_32k_rc_tune = 0x0001d165;
platform_calibrate_32k = 0x0001d179;
platform_config = 0x0001d17d;
platform_controller_run = 0x0001d2a1;
platform_delete_timer = 0x0001d2d5;
platform_enable_irq = 0x0001d2dd;
platform_get_gen_os_driver = 0x0001d315;
platform_get_task_handle = 0x0001d321;
platform_get_timer_counter = 0x0001d339;
platform_get_us_time = 0x0001d33d;
platform_get_version = 0x0001d341;
platform_hrng = 0x0001d349;
platform_init_controller = 0x0001d351;
platform_os_idle_resumed_hook = 0x0001d36d;
platform_patch_rf_init_data = 0x0001d371;
platform_post_sleep_processing = 0x0001d37d;
platform_pre_sleep_processing = 0x0001d383;
platform_pre_suppress_ticks_and_sleep_processing = 0x0001d389;
platform_printf = 0x0001d38d;
platform_raise_assertion = 0x0001d3a1;
platform_rand = 0x0001d3b5;
platform_read_info = 0x0001d3b9;
platform_read_persistent_reg = 0x0001d3e9;
platform_reset = 0x0001d3f9;
platform_set_abs_timer = 0x0001d41d;
platform_set_evt_callback = 0x0001d421;
platform_set_evt_callback_table = 0x0001d435;
platform_set_irq_callback = 0x0001d441;
platform_set_irq_callback_table = 0x0001d45d;
platform_set_rf_clk_source = 0x0001d469;
platform_set_rf_init_data = 0x0001d475;
platform_set_rf_power_mapping = 0x0001d481;
platform_set_timer = 0x0001d48d;
platform_shutdown = 0x0001d491;
platform_switch_app = 0x0001d495;
platform_trace_raw = 0x0001d4c1;
platform_write_persistent_reg = 0x0001d4d9;
printf_hexdump = 0x0001d4e9;
reverse_128 = 0x0001d821;
reverse_24 = 0x0001d827;
reverse_256 = 0x0001d82d;
reverse_48 = 0x0001d833;
reverse_56 = 0x0001d839;
reverse_64 = 0x0001d83f;
reverse_bd_addr = 0x0001d845;
reverse_bytes = 0x0001d84b;
sm_add_event_handler = 0x0001d9b9;
sm_address_resolution_lookup = 0x0001db11;
sm_authenticated = 0x0001de8d;
sm_authorization_decline = 0x0001de9b;
sm_authorization_grant = 0x0001debb;
sm_authorization_state = 0x0001dedb;
sm_bonding_decline = 0x0001def5;
sm_config = 0x0001e351;
sm_config_conn = 0x0001e369;
sm_encryption_key_size = 0x0001e51f;
sm_just_works_confirm = 0x0001eaa5;
sm_le_device_key = 0x0001edf1;
sm_passkey_input = 0x0001ee87;
sm_private_random_address_generation_get = 0x0001f241;
sm_private_random_address_generation_get_mode = 0x0001f249;
sm_private_random_address_generation_set_mode = 0x0001f255;
sm_private_random_address_generation_set_update_period = 0x0001f27d;
sm_register_external_ltk_callback = 0x0001f3b9;
sm_register_oob_data_callback = 0x0001f3c5;
sm_request_pairing = 0x0001f3d1;
sm_send_security_request = 0x0001fea7;
sm_set_accepted_stk_generation_methods = 0x0001fecd;
sm_set_authentication_requirements = 0x0001fed9;
sm_set_encryption_key_size_range = 0x0001fee5;
sscanf_bd_addr = 0x00020241;
sysSetPublicDeviceAddr = 0x000205f5;
uuid128_to_str = 0x00020bd9;
uuid_add_bluetooth_prefix = 0x00020c31;
uuid_has_bluetooth_prefix = 0x00020c51;
