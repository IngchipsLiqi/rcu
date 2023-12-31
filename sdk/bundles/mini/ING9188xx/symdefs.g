att_dispatch_client_can_send_now = 0x0000586d;
att_dispatch_client_request_can_send_now_event = 0x00005873;
att_dispatch_register_client = 0x00005879;
att_dispatch_register_server = 0x0000588d;
att_dispatch_server_can_send_now = 0x000058a1;
att_dispatch_server_request_can_send_now_event = 0x000058a7;
att_emit_general_event = 0x00005959;
att_server_can_send_packet_now = 0x00006085;
att_server_deferred_read_response = 0x00006089;
att_server_get_mtu = 0x000060a1;
att_server_indicate = 0x0000610d;
att_server_init = 0x00006191;
att_server_notify = 0x000061cd;
att_server_register_packet_handler = 0x000062e5;
att_server_request_can_send_now_event = 0x000062f1;
att_set_db = 0x0000630d;
att_set_read_callback = 0x00006321;
att_set_write_callback = 0x0000632d;
bd_addr_cmp = 0x0000649d;
bd_addr_copy = 0x000064a3;
bd_addr_to_str = 0x000064ad;
big_endian_read_16 = 0x000064e5;
big_endian_read_32 = 0x000064ed;
big_endian_store_16 = 0x00006501;
big_endian_store_32 = 0x0000650d;
btstack_config = 0x00006661;
btstack_memory_pool_create = 0x0000679f;
btstack_memory_pool_free = 0x000067c9;
btstack_memory_pool_get = 0x00006829;
btstack_push_user_msg = 0x00006891;
btstack_push_user_runnable = 0x0000689d;
char_for_nibble = 0x00006b25;
eTaskConfirmSleepModeStatus = 0x00006df5;
gap_add_dev_to_periodic_list = 0x00007441;
gap_add_whitelist = 0x00007451;
gap_aes_encrypt = 0x0000745d;
gap_clear_white_lists = 0x00007495;
gap_clr_adv_set = 0x000074a1;
gap_clr_periodic_adv_list = 0x000074ad;
gap_create_connection_cancel = 0x000074b9;
gap_default_periodic_adv_sync_transfer_param = 0x000074c5;
gap_disconnect = 0x000074dd;
gap_disconnect_all = 0x00007509;
gap_ext_create_connection = 0x00007549;
gap_get_connection_parameter_range = 0x00007629;
gap_le_read_channel_map = 0x00007661;
gap_periodic_adv_create_sync = 0x000076cd;
gap_periodic_adv_create_sync_cancel = 0x000076f1;
gap_periodic_adv_set_info_transfer = 0x000076fd;
gap_periodic_adv_sync_transfer = 0x0000770d;
gap_periodic_adv_sync_transfer_param = 0x0000771d;
gap_periodic_adv_term_sync = 0x00007739;
gap_read_antenna_info = 0x000077c1;
gap_read_periodic_adv_list_size = 0x000077cd;
gap_read_phy = 0x000077d9;
gap_read_remote_used_features = 0x000077e5;
gap_read_remote_version = 0x000077f1;
gap_read_rssi = 0x000077fd;
gap_remove_whitelist = 0x00007809;
gap_rmv_adv_set = 0x00007885;
gap_rmv_dev_from_periodic_list = 0x00007891;
gap_rx_test_v2 = 0x000078a1;
gap_rx_test_v3 = 0x000078b1;
gap_set_adv_set_random_addr = 0x000078fd;
gap_set_callback_for_next_hci = 0x00007939;
gap_set_connection_cte_request_enable = 0x00007959;
gap_set_connection_cte_response_enable = 0x00007975;
gap_set_connection_cte_rx_param = 0x00007985;
gap_set_connection_cte_tx_param = 0x000079e1;
gap_set_connection_parameter_range = 0x00007a35;
gap_set_connectionless_cte_tx_enable = 0x00007a4d;
gap_set_connectionless_cte_tx_param = 0x00007a5d;
gap_set_connectionless_iq_sampling_enable = 0x00007abd;
gap_set_data_length = 0x00007b21;
gap_set_def_phy = 0x00007b39;
gap_set_ext_adv_data = 0x00007b49;
gap_set_ext_adv_enable = 0x00007b61;
gap_set_ext_adv_para = 0x00007bdd;
gap_set_ext_scan_enable = 0x00007cb5;
gap_set_ext_scan_para = 0x00007ccd;
gap_set_ext_scan_response_data = 0x00007d75;
gap_set_host_channel_classification = 0x00007d8d;
gap_set_periodic_adv_data = 0x00007d9d;
gap_set_periodic_adv_enable = 0x00007e0d;
gap_set_periodic_adv_para = 0x00007e1d;
gap_set_periodic_adv_rx_enable = 0x00007e35;
gap_set_phy = 0x00007e45;
gap_set_random_device_address = 0x00007e61;
gap_start_ccm = 0x00007e91;
gap_test_end = 0x00007ed9;
gap_tx_test_v2 = 0x00007ee5;
gap_tx_test_v4 = 0x00007efd;
gap_update_connection_parameters = 0x00007f21;
gap_vendor_tx_continuous_wave = 0x00007f61;
gatt_client_cancel_write = 0x00008489;
gatt_client_discover_characteristic_descriptors = 0x000084af;
gatt_client_discover_characteristics_for_handle_range_by_uuid128 = 0x000084ef;
gatt_client_discover_characteristics_for_handle_range_by_uuid16 = 0x0000853f;
gatt_client_discover_characteristics_for_service = 0x0000858f;
gatt_client_discover_primary_services = 0x000085c5;
gatt_client_discover_primary_services_by_uuid128 = 0x000085f7;
gatt_client_discover_primary_services_by_uuid16 = 0x0000863b;
gatt_client_execute_write = 0x00008677;
gatt_client_find_included_services_for_service = 0x0000869d;
gatt_client_get_mtu = 0x000086cb;
gatt_client_is_ready = 0x00008769;
gatt_client_listen_for_characteristic_value_updates = 0x0000877f;
gatt_client_prepare_write = 0x0000879f;
gatt_client_read_characteristic_descriptor_using_descriptor_handle = 0x000087db;
gatt_client_read_long_characteristic_descriptor_using_descriptor_handle = 0x00008805;
gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset = 0x0000880b;
gatt_client_read_long_value_of_characteristic_using_value_handle = 0x00008839;
gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset = 0x0000883f;
gatt_client_read_multiple_characteristic_values = 0x0000886d;
gatt_client_read_value_of_characteristic_using_value_handle = 0x0000889d;
gatt_client_read_value_of_characteristics_by_uuid128 = 0x000088cb;
gatt_client_read_value_of_characteristics_by_uuid16 = 0x00008917;
gatt_client_register_handler = 0x00008961;
gatt_client_reliable_write_long_value_of_characteristic = 0x0000896d;
gatt_client_signed_write_without_response = 0x00008d71;
gatt_client_write_characteristic_descriptor_using_descriptor_handle = 0x00008e35;
gatt_client_write_client_characteristic_configuration = 0x00008e6f;
gatt_client_write_long_characteristic_descriptor_using_descriptor_handle = 0x00008ec1;
gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset = 0x00008ed1;
gatt_client_write_long_value_of_characteristic = 0x00008f0d;
gatt_client_write_long_value_of_characteristic_with_offset = 0x00008f1d;
gatt_client_write_value_of_characteristic = 0x00008f59;
gatt_client_write_value_of_characteristic_without_response = 0x00008f8f;
hci_add_event_handler = 0x0000a4c5;
hci_power_control = 0x0000ac31;
hci_register_acl_packet_handler = 0x0000ade5;
kv_commit = 0x0000b531;
kv_get = 0x0000b58d;
kv_init = 0x0000b599;
kv_init_backend = 0x0000b615;
kv_put = 0x0000b629;
kv_remove = 0x0000b635;
kv_remove_all = 0x0000b669;
kv_value_modified = 0x0000b699;
kv_value_modified_of_key = 0x0000b6b5;
kv_visit = 0x0000b6c1;
l2cap_add_event_handler = 0x0000b751;
l2cap_can_send_packet_now = 0x0000b761;
l2cap_create_le_credit_based_connection_request = 0x0000b91d;
l2cap_credit_based_send = 0x0000ba61;
l2cap_credit_based_send_continue = 0x0000ba8d;
l2cap_disconnect = 0x0000bb09;
l2cap_get_le_credit_based_connection_credits = 0x0000bd59;
l2cap_get_peer_mtu_for_local_cid = 0x0000bd75;
l2cap_init = 0x0000c149;
l2cap_le_send_flow_control_credit = 0x0000c23f;
l2cap_max_le_mtu = 0x0000c549;
l2cap_register_packet_handler = 0x0000c671;
l2cap_register_service = 0x0000c67d;
l2cap_request_can_send_now_event = 0x0000c78d;
l2cap_request_connection_parameter_update = 0x0000c7a7;
l2cap_send_echo_request = 0x0000cc81;
l2cap_unregister_service = 0x0000cd41;
le_device_db_add = 0x0000cd99;
le_device_db_find = 0x0000ce61;
le_device_db_from_key = 0x0000ce8d;
le_device_db_iter_cur = 0x0000ce95;
le_device_db_iter_cur_key = 0x0000ce99;
le_device_db_iter_init = 0x0000ce9d;
le_device_db_iter_next = 0x0000cea5;
le_device_db_remove_key = 0x0000cecb;
ll_aes_encrypt = 0x0000cef9;
ll_config = 0x0000cf75;
ll_free = 0x0000cfab;
ll_get_heap_free_size = 0x0000cfb5;
ll_hint_on_ce_len = 0x0000cfc9;
ll_legacy_adv_set_interval = 0x0000d001;
ll_malloc = 0x0000d011;
ll_query_timing_info = 0x0000d149;
ll_register_hci_acl_previewer = 0x0000d195;
ll_scan_set_fixed_channel = 0x0000d1f9;
ll_set_adv_access_address = 0x0000d411;
ll_set_adv_coded_scheme = 0x0000d41d;
ll_set_conn_acl_report_latency = 0x0000d445;
ll_set_conn_coded_scheme = 0x0000d471;
ll_set_conn_latency = 0x0000d499;
ll_set_conn_tx_power = 0x0000d4c5;
ll_set_def_antenna = 0x0000d509;
ll_set_initiating_coded_scheme = 0x0000d525;
ll_set_max_conn_number = 0x0000d531;
nibble_for_char = 0x0001e499;
platform_32k_rc_auto_tune = 0x0001e539;
platform_32k_rc_tune = 0x0001e5b5;
platform_calibrate_32k = 0x0001e5c9;
platform_config = 0x0001e5cd;
platform_delete_timer = 0x0001e6f1;
platform_enable_irq = 0x0001e6f9;
platform_get_current_task = 0x0001e731;
platform_get_gen_os_driver = 0x0001e755;
platform_get_heap_status = 0x0001e75d;
platform_get_task_handle = 0x0001e775;
platform_get_timer_counter = 0x0001e795;
platform_get_us_time = 0x0001e799;
platform_get_version = 0x0001e79d;
platform_hrng = 0x0001e7a5;
platform_install_isr_stack = 0x0001e7ad;
platform_install_task_stack = 0x0001e7b9;
platform_patch_rf_init_data = 0x0001e7f1;
platform_printf = 0x0001e7fd;
platform_raise_assertion = 0x0001e811;
platform_rand = 0x0001e825;
platform_read_info = 0x0001e829;
platform_read_persistent_reg = 0x0001e859;
platform_reset = 0x0001e869;
platform_set_abs_timer = 0x0001e88d;
platform_set_evt_callback = 0x0001e891;
platform_set_evt_callback_table = 0x0001e8a5;
platform_set_irq_callback = 0x0001e8b1;
platform_set_irq_callback_table = 0x0001e8cd;
platform_set_rf_clk_source = 0x0001e8d9;
platform_set_rf_init_data = 0x0001e8e5;
platform_set_rf_power_mapping = 0x0001e8f1;
platform_set_timer = 0x0001e8fd;
platform_shutdown = 0x0001e901;
platform_switch_app = 0x0001e905;
platform_trace_raw = 0x0001e931;
platform_write_persistent_reg = 0x0001e949;
printf_hexdump = 0x0001eafd;
pvPortMalloc = 0x0001f5e9;
pvTaskIncrementMutexHeldCount = 0x0001f6d1;
pvTimerGetTimerID = 0x0001f6e9;
pxPortInitialiseStack = 0x0001f715;
reverse_128 = 0x0001f8f5;
reverse_24 = 0x0001f8fb;
reverse_256 = 0x0001f901;
reverse_48 = 0x0001f907;
reverse_56 = 0x0001f90d;
reverse_64 = 0x0001f913;
reverse_bd_addr = 0x0001f919;
reverse_bytes = 0x0001f91f;
sm_add_event_handler = 0x0001fbdd;
sm_address_resolution_lookup = 0x0001fd35;
sm_authenticated = 0x000200b1;
sm_authorization_decline = 0x000200bf;
sm_authorization_grant = 0x000200df;
sm_authorization_state = 0x000200ff;
sm_bonding_decline = 0x00020119;
sm_config = 0x00020575;
sm_config_conn = 0x0002058d;
sm_encryption_key_size = 0x00020743;
sm_just_works_confirm = 0x00020cc9;
sm_le_device_key = 0x00021015;
sm_passkey_input = 0x000210ab;
sm_private_random_address_generation_get = 0x00021465;
sm_private_random_address_generation_get_mode = 0x0002146d;
sm_private_random_address_generation_set_mode = 0x00021479;
sm_private_random_address_generation_set_update_period = 0x000214a1;
sm_register_external_ltk_callback = 0x000215dd;
sm_register_oob_data_callback = 0x000215e9;
sm_request_pairing = 0x000215f5;
sm_send_security_request = 0x000220cb;
sm_set_accepted_stk_generation_methods = 0x000220f1;
sm_set_authentication_requirements = 0x000220fd;
sm_set_encryption_key_size_range = 0x00022109;
sscanf_bd_addr = 0x00022465;
sysSetPublicDeviceAddr = 0x00022819;
uuid128_to_str = 0x00022f8d;
uuid_add_bluetooth_prefix = 0x00022fe5;
uuid_has_bluetooth_prefix = 0x00023005;
uxListRemove = 0x00023021;
uxQueueMessagesWaiting = 0x00023049;
uxQueueMessagesWaitingFromISR = 0x00023071;
uxQueueSpacesAvailable = 0x0002308d;
uxTaskGetStackHighWaterMark = 0x000230b9;
uxTaskPriorityGet = 0x000230d9;
uxTaskPriorityGetFromISR = 0x000230f5;
vListInitialise = 0x000231af;
vListInitialiseItem = 0x000231c5;
vListInsert = 0x000231cb;
vListInsertEnd = 0x000231fb;
vPortEndScheduler = 0x00023215;
vPortEnterCritical = 0x00023241;
vPortExitCritical = 0x00023285;
vPortFree = 0x000232b9;
vPortSuppressTicksAndSleep = 0x0002334d;
vPortValidateInterruptPriority = 0x00023475;
vQueueDelete = 0x000234d1;
vQueueWaitForMessageRestricted = 0x000234fd;
vTaskDelay = 0x00023545;
vTaskInternalSetTimeOutState = 0x00023591;
vTaskMissedYield = 0x000235a1;
vTaskPlaceOnEventList = 0x000235ad;
vTaskPlaceOnEventListRestricted = 0x000235e5;
vTaskPriorityDisinheritAfterTimeout = 0x00023625;
vTaskPrioritySet = 0x000236d1;
vTaskResume = 0x00023799;
vTaskStartScheduler = 0x0002381d;
vTaskStepTick = 0x000238ad;
vTaskSuspend = 0x000238dd;
vTaskSuspendAll = 0x00023999;
vTaskSwitchContext = 0x000239a9;
xPortStartScheduler = 0x00023a4d;
xQueueAddToSet = 0x00023b15;
xQueueCreateCountingSemaphore = 0x00023b39;
xQueueCreateCountingSemaphoreStatic = 0x00023b75;
xQueueCreateMutex = 0x00023bb9;
xQueueCreateMutexStatic = 0x00023bcf;
xQueueCreateSet = 0x00023be9;
xQueueGenericCreate = 0x00023bf1;
xQueueGenericCreateStatic = 0x00023c3d;
xQueueGenericReset = 0x00023ca5;
xQueueGenericSend = 0x00023d31;
xQueueGenericSendFromISR = 0x00023e9d;
xQueueGiveFromISR = 0x00023f5d;
xQueueGiveMutexRecursive = 0x00024001;
xQueueIsQueueEmptyFromISR = 0x00024041;
xQueueIsQueueFullFromISR = 0x00024065;
xQueuePeek = 0x0002408d;
xQueuePeekFromISR = 0x000241b5;
xQueueReceive = 0x00024221;
xQueueReceiveFromISR = 0x0002434d;
xQueueRemoveFromSet = 0x000243e1;
xQueueSelectFromSet = 0x00024403;
xQueueSelectFromSetFromISR = 0x00024415;
xQueueSemaphoreTake = 0x00024429;
xQueueTakeMutexRecursive = 0x00024595;
xTaskCheckForTimeOut = 0x000245d9;
xTaskCreate = 0x00024649;
xTaskCreateStatic = 0x000246a5;
xTaskGetCurrentTaskHandle = 0x00024715;
xTaskGetSchedulerState = 0x00024721;
xTaskGetTickCount = 0x0002473d;
xTaskGetTickCountFromISR = 0x00024749;
xTaskIncrementTick = 0x00024759;
xTaskPriorityDisinherit = 0x00024825;
xTaskPriorityInherit = 0x000248b9;
xTaskRemoveFromEventList = 0x0002494d;
xTaskResumeAll = 0x000249cd;
xTaskResumeFromISR = 0x00024a95;
xTimerCreate = 0x00024b21;
xTimerCreateStatic = 0x00024b55;
xTimerCreateTimerTask = 0x00024b8d;
xTimerGenericCommand = 0x00024bf9;
xTimerGetExpiryTime = 0x00024c69;
xTimerGetTimerDaemonTaskHandle = 0x00024c89;
