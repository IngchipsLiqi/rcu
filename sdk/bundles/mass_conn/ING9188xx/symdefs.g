att_dispatch_client_can_send_now = 0x00005875;
att_dispatch_client_request_can_send_now_event = 0x0000587b;
att_dispatch_register_client = 0x00005881;
att_dispatch_register_server = 0x00005895;
att_dispatch_server_can_send_now = 0x000058a9;
att_dispatch_server_request_can_send_now_event = 0x000058af;
att_emit_general_event = 0x00005961;
att_server_can_send_packet_now = 0x00006091;
att_server_deferred_read_response = 0x00006095;
att_server_get_mtu = 0x000060ad;
att_server_indicate = 0x00006125;
att_server_init = 0x000061a9;
att_server_notify = 0x000061e5;
att_server_register_packet_handler = 0x000062fd;
att_server_request_can_send_now_event = 0x00006309;
att_set_db = 0x00006325;
att_set_read_callback = 0x00006339;
att_set_write_callback = 0x00006345;
bd_addr_cmp = 0x000064b5;
bd_addr_copy = 0x000064bb;
bd_addr_to_str = 0x000064c5;
big_endian_read_16 = 0x000064fd;
big_endian_read_32 = 0x00006505;
big_endian_store_16 = 0x00006519;
big_endian_store_32 = 0x00006525;
btstack_config = 0x00006679;
btstack_memory_pool_create = 0x000067b7;
btstack_memory_pool_free = 0x000067e1;
btstack_memory_pool_get = 0x00006841;
btstack_push_user_msg = 0x000068a9;
btstack_push_user_runnable = 0x000068b5;
char_for_nibble = 0x00006b3d;
eTaskConfirmSleepModeStatus = 0x00006e11;
gap_add_dev_to_periodic_list = 0x00007469;
gap_add_whitelist = 0x00007479;
gap_aes_encrypt = 0x00007485;
gap_clear_white_lists = 0x000074bd;
gap_clr_adv_set = 0x000074c9;
gap_clr_periodic_adv_list = 0x000074d5;
gap_create_connection_cancel = 0x000074e1;
gap_default_periodic_adv_sync_transfer_param = 0x000074ed;
gap_disconnect = 0x00007505;
gap_disconnect_all = 0x00007531;
gap_ext_create_connection = 0x00007571;
gap_get_connection_parameter_range = 0x00007651;
gap_le_read_channel_map = 0x00007689;
gap_periodic_adv_create_sync = 0x000076f5;
gap_periodic_adv_create_sync_cancel = 0x00007719;
gap_periodic_adv_set_info_transfer = 0x00007725;
gap_periodic_adv_sync_transfer = 0x00007735;
gap_periodic_adv_sync_transfer_param = 0x00007745;
gap_periodic_adv_term_sync = 0x00007761;
gap_read_antenna_info = 0x000077e9;
gap_read_periodic_adv_list_size = 0x000077f5;
gap_read_phy = 0x00007801;
gap_read_remote_used_features = 0x0000780d;
gap_read_remote_version = 0x00007819;
gap_read_rssi = 0x00007825;
gap_remove_whitelist = 0x00007831;
gap_rmv_adv_set = 0x000078ad;
gap_rmv_dev_from_periodic_list = 0x000078b9;
gap_rx_test_v2 = 0x000078c9;
gap_rx_test_v3 = 0x000078d9;
gap_set_adv_set_random_addr = 0x00007925;
gap_set_callback_for_next_hci = 0x00007961;
gap_set_connection_cte_request_enable = 0x00007989;
gap_set_connection_cte_response_enable = 0x000079a5;
gap_set_connection_cte_rx_param = 0x000079b5;
gap_set_connection_cte_tx_param = 0x00007a11;
gap_set_connection_parameter_range = 0x00007a65;
gap_set_connectionless_cte_tx_enable = 0x00007a81;
gap_set_connectionless_cte_tx_param = 0x00007a91;
gap_set_connectionless_iq_sampling_enable = 0x00007af1;
gap_set_data_length = 0x00007b55;
gap_set_def_phy = 0x00007b6d;
gap_set_ext_adv_data = 0x00007b7d;
gap_set_ext_adv_enable = 0x00007b95;
gap_set_ext_adv_para = 0x00007c11;
gap_set_ext_scan_enable = 0x00007ce9;
gap_set_ext_scan_para = 0x00007d01;
gap_set_ext_scan_response_data = 0x00007da9;
gap_set_host_channel_classification = 0x00007dc1;
gap_set_periodic_adv_data = 0x00007dd1;
gap_set_periodic_adv_enable = 0x00007e41;
gap_set_periodic_adv_para = 0x00007e51;
gap_set_periodic_adv_rx_enable = 0x00007e69;
gap_set_phy = 0x00007e79;
gap_set_random_device_address = 0x00007e95;
gap_start_ccm = 0x00007ec5;
gap_test_end = 0x00007f0d;
gap_tx_test_v2 = 0x00007f19;
gap_tx_test_v4 = 0x00007f31;
gap_update_connection_parameters = 0x00007f55;
gap_vendor_tx_continuous_wave = 0x00007f99;
gatt_client_cancel_write = 0x000084c1;
gatt_client_discover_characteristic_descriptors = 0x000084e7;
gatt_client_discover_characteristics_for_handle_range_by_uuid128 = 0x00008527;
gatt_client_discover_characteristics_for_handle_range_by_uuid16 = 0x00008577;
gatt_client_discover_characteristics_for_service = 0x000085c7;
gatt_client_discover_primary_services = 0x000085fd;
gatt_client_discover_primary_services_by_uuid128 = 0x0000862f;
gatt_client_discover_primary_services_by_uuid16 = 0x00008673;
gatt_client_execute_write = 0x000086af;
gatt_client_find_included_services_for_service = 0x000086d5;
gatt_client_get_mtu = 0x00008703;
gatt_client_is_ready = 0x000087a5;
gatt_client_listen_for_characteristic_value_updates = 0x000087bb;
gatt_client_prepare_write = 0x000087dd;
gatt_client_read_characteristic_descriptor_using_descriptor_handle = 0x00008819;
gatt_client_read_long_characteristic_descriptor_using_descriptor_handle = 0x00008843;
gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset = 0x00008849;
gatt_client_read_long_value_of_characteristic_using_value_handle = 0x00008877;
gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset = 0x0000887d;
gatt_client_read_multiple_characteristic_values = 0x000088ab;
gatt_client_read_value_of_characteristic_using_value_handle = 0x000088db;
gatt_client_read_value_of_characteristics_by_uuid128 = 0x00008909;
gatt_client_read_value_of_characteristics_by_uuid16 = 0x00008955;
gatt_client_register_handler = 0x000089a1;
gatt_client_reliable_write_long_value_of_characteristic = 0x000089ad;
gatt_client_signed_write_without_response = 0x00008ddd;
gatt_client_write_characteristic_descriptor_using_descriptor_handle = 0x00008ea1;
gatt_client_write_client_characteristic_configuration = 0x00008edb;
gatt_client_write_long_characteristic_descriptor_using_descriptor_handle = 0x00008f2d;
gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset = 0x00008f3d;
gatt_client_write_long_value_of_characteristic = 0x00008f79;
gatt_client_write_long_value_of_characteristic_with_offset = 0x00008f89;
gatt_client_write_value_of_characteristic = 0x00008fc5;
gatt_client_write_value_of_characteristic_without_response = 0x00008ffb;
hci_add_event_handler = 0x0000a53d;
hci_power_control = 0x0000acc5;
hci_register_acl_packet_handler = 0x0000ae79;
kv_commit = 0x0000b5e5;
kv_get = 0x0000b641;
kv_init = 0x0000b64d;
kv_init_backend = 0x0000b6cd;
kv_put = 0x0000b6e1;
kv_remove = 0x0000b6ed;
kv_remove_all = 0x0000b721;
kv_value_modified = 0x0000b751;
kv_value_modified_of_key = 0x0000b76d;
kv_visit = 0x0000b779;
l2cap_add_event_handler = 0x0000b809;
l2cap_can_send_packet_now = 0x0000b819;
l2cap_create_le_credit_based_connection_request = 0x0000b9d5;
l2cap_credit_based_send = 0x0000bb19;
l2cap_credit_based_send_continue = 0x0000bb45;
l2cap_disconnect = 0x0000bbc1;
l2cap_get_le_credit_based_connection_credits = 0x0000be11;
l2cap_get_peer_mtu_for_local_cid = 0x0000be2d;
l2cap_init = 0x0000c201;
l2cap_le_send_flow_control_credit = 0x0000c2f7;
l2cap_max_le_mtu = 0x0000c601;
l2cap_register_packet_handler = 0x0000c729;
l2cap_register_service = 0x0000c735;
l2cap_request_can_send_now_event = 0x0000c845;
l2cap_request_connection_parameter_update = 0x0000c85f;
l2cap_send_echo_request = 0x0000cd39;
l2cap_unregister_service = 0x0000cdf9;
le_device_db_add = 0x0000ce51;
le_device_db_find = 0x0000cf29;
le_device_db_from_key = 0x0000cf55;
le_device_db_iter_cur = 0x0000cf5d;
le_device_db_iter_cur_key = 0x0000cf61;
le_device_db_iter_init = 0x0000cf65;
le_device_db_iter_next = 0x0000cf6d;
le_device_db_remove_key = 0x0000cf93;
ll_aes_encrypt = 0x0000cfc1;
ll_config = 0x0000d03d;
ll_free = 0x0000d073;
ll_get_heap_free_size = 0x0000d07d;
ll_hint_on_ce_len = 0x0000d091;
ll_legacy_adv_set_interval = 0x0000d0c9;
ll_malloc = 0x0000d0d9;
ll_query_timing_info = 0x0000d211;
ll_register_hci_acl_previewer = 0x0000d25d;
ll_scan_set_fixed_channel = 0x0000d2c1;
ll_set_adv_access_address = 0x0000d4d9;
ll_set_adv_coded_scheme = 0x0000d4e5;
ll_set_conn_acl_report_latency = 0x0000d515;
ll_set_conn_coded_scheme = 0x0000d545;
ll_set_conn_latency = 0x0000d571;
ll_set_conn_tx_power = 0x0000d5a1;
ll_set_def_antenna = 0x0000d5e9;
ll_set_initiating_coded_scheme = 0x0000d605;
ll_set_max_conn_number = 0x0000d611;
nibble_for_char = 0x0001e6b1;
platform_32k_rc_auto_tune = 0x0001e75d;
platform_32k_rc_tune = 0x0001e7d9;
platform_calibrate_32k = 0x0001e7ed;
platform_config = 0x0001e7f1;
platform_delete_timer = 0x0001e915;
platform_enable_irq = 0x0001e91d;
platform_get_current_task = 0x0001e955;
platform_get_gen_os_driver = 0x0001e979;
platform_get_heap_status = 0x0001e981;
platform_get_task_handle = 0x0001e999;
platform_get_timer_counter = 0x0001e9b9;
platform_get_us_time = 0x0001e9bd;
platform_get_version = 0x0001e9c1;
platform_hrng = 0x0001e9c9;
platform_install_isr_stack = 0x0001e9d1;
platform_install_task_stack = 0x0001e9dd;
platform_patch_rf_init_data = 0x0001ea15;
platform_printf = 0x0001ea21;
platform_raise_assertion = 0x0001ea35;
platform_rand = 0x0001ea49;
platform_read_info = 0x0001ea4d;
platform_read_persistent_reg = 0x0001ea7d;
platform_reset = 0x0001ea8d;
platform_set_abs_timer = 0x0001eab1;
platform_set_evt_callback = 0x0001eab5;
platform_set_evt_callback_table = 0x0001eac9;
platform_set_irq_callback = 0x0001ead5;
platform_set_irq_callback_table = 0x0001eaf1;
platform_set_rf_clk_source = 0x0001eafd;
platform_set_rf_init_data = 0x0001eb09;
platform_set_rf_power_mapping = 0x0001eb15;
platform_set_timer = 0x0001eb21;
platform_shutdown = 0x0001eb25;
platform_switch_app = 0x0001eb29;
platform_trace_raw = 0x0001eb55;
platform_write_persistent_reg = 0x0001eb6d;
printf_hexdump = 0x0001ed21;
pvPortMalloc = 0x0001f815;
pvTaskIncrementMutexHeldCount = 0x0001f8fd;
pvTimerGetTimerID = 0x0001f915;
pxPortInitialiseStack = 0x0001f941;
reverse_128 = 0x0001fb21;
reverse_24 = 0x0001fb27;
reverse_256 = 0x0001fb2d;
reverse_48 = 0x0001fb33;
reverse_56 = 0x0001fb39;
reverse_64 = 0x0001fb3f;
reverse_bd_addr = 0x0001fb45;
reverse_bytes = 0x0001fb4b;
sm_add_event_handler = 0x0001fe09;
sm_address_resolution_lookup = 0x0001ff61;
sm_authenticated = 0x000202dd;
sm_authorization_decline = 0x000202eb;
sm_authorization_grant = 0x0002030b;
sm_authorization_state = 0x0002032b;
sm_bonding_decline = 0x00020345;
sm_config = 0x000207a1;
sm_config_conn = 0x000207b9;
sm_encryption_key_size = 0x0002096f;
sm_just_works_confirm = 0x00020ef5;
sm_le_device_key = 0x00021241;
sm_passkey_input = 0x000212d7;
sm_private_random_address_generation_get = 0x00021691;
sm_private_random_address_generation_get_mode = 0x00021699;
sm_private_random_address_generation_set_mode = 0x000216a5;
sm_private_random_address_generation_set_update_period = 0x000216cd;
sm_register_external_ltk_callback = 0x00021809;
sm_register_oob_data_callback = 0x00021815;
sm_request_pairing = 0x00021821;
sm_send_security_request = 0x000222f7;
sm_set_accepted_stk_generation_methods = 0x0002231d;
sm_set_authentication_requirements = 0x00022329;
sm_set_encryption_key_size_range = 0x00022335;
sscanf_bd_addr = 0x00022691;
sysSetPublicDeviceAddr = 0x00022a45;
uuid128_to_str = 0x000231b9;
uuid_add_bluetooth_prefix = 0x00023211;
uuid_has_bluetooth_prefix = 0x00023231;
uxListRemove = 0x0002324d;
uxQueueMessagesWaiting = 0x00023275;
uxQueueMessagesWaitingFromISR = 0x0002329d;
uxQueueSpacesAvailable = 0x000232b9;
uxTaskGetStackHighWaterMark = 0x000232e5;
uxTaskPriorityGet = 0x00023305;
uxTaskPriorityGetFromISR = 0x00023321;
vListInitialise = 0x000233db;
vListInitialiseItem = 0x000233f1;
vListInsert = 0x000233f7;
vListInsertEnd = 0x00023427;
vPortEndScheduler = 0x00023441;
vPortEnterCritical = 0x0002346d;
vPortExitCritical = 0x000234b1;
vPortFree = 0x000234e5;
vPortSuppressTicksAndSleep = 0x00023579;
vPortValidateInterruptPriority = 0x000236a1;
vQueueDelete = 0x000236fd;
vQueueWaitForMessageRestricted = 0x00023729;
vTaskDelay = 0x00023771;
vTaskInternalSetTimeOutState = 0x000237bd;
vTaskMissedYield = 0x000237cd;
vTaskPlaceOnEventList = 0x000237d9;
vTaskPlaceOnEventListRestricted = 0x00023811;
vTaskPriorityDisinheritAfterTimeout = 0x00023851;
vTaskPrioritySet = 0x000238fd;
vTaskResume = 0x000239c5;
vTaskStartScheduler = 0x00023a49;
vTaskStepTick = 0x00023ad9;
vTaskSuspend = 0x00023b09;
vTaskSuspendAll = 0x00023bc5;
vTaskSwitchContext = 0x00023bd5;
xPortStartScheduler = 0x00023c7d;
xQueueAddToSet = 0x00023d45;
xQueueCreateCountingSemaphore = 0x00023d69;
xQueueCreateCountingSemaphoreStatic = 0x00023da5;
xQueueCreateMutex = 0x00023de9;
xQueueCreateMutexStatic = 0x00023dff;
xQueueCreateSet = 0x00023e19;
xQueueGenericCreate = 0x00023e21;
xQueueGenericCreateStatic = 0x00023e6d;
xQueueGenericReset = 0x00023ed5;
xQueueGenericSend = 0x00023f61;
xQueueGenericSendFromISR = 0x000240cd;
xQueueGiveFromISR = 0x0002418d;
xQueueGiveMutexRecursive = 0x00024231;
xQueueIsQueueEmptyFromISR = 0x00024271;
xQueueIsQueueFullFromISR = 0x00024295;
xQueuePeek = 0x000242bd;
xQueuePeekFromISR = 0x000243e5;
xQueueReceive = 0x00024451;
xQueueReceiveFromISR = 0x0002457d;
xQueueRemoveFromSet = 0x00024611;
xQueueSelectFromSet = 0x00024633;
xQueueSelectFromSetFromISR = 0x00024645;
xQueueSemaphoreTake = 0x00024659;
xQueueTakeMutexRecursive = 0x000247c5;
xTaskCheckForTimeOut = 0x00024809;
xTaskCreate = 0x00024879;
xTaskCreateStatic = 0x000248d5;
xTaskGetCurrentTaskHandle = 0x00024945;
xTaskGetSchedulerState = 0x00024951;
xTaskGetTickCount = 0x0002496d;
xTaskGetTickCountFromISR = 0x00024979;
xTaskIncrementTick = 0x00024989;
xTaskPriorityDisinherit = 0x00024a55;
xTaskPriorityInherit = 0x00024ae9;
xTaskRemoveFromEventList = 0x00024b7d;
xTaskResumeAll = 0x00024bfd;
xTaskResumeFromISR = 0x00024cc5;
xTimerCreate = 0x00024d51;
xTimerCreateStatic = 0x00024d85;
xTimerCreateTimerTask = 0x00024dbd;
xTimerGenericCommand = 0x00024e29;
xTimerGetExpiryTime = 0x00024e99;
xTimerGetTimerDaemonTaskHandle = 0x00024eb9;
