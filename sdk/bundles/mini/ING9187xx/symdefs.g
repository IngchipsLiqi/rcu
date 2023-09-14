att_dispatch_client_can_send_now = 0x00005749;
att_dispatch_client_request_can_send_now_event = 0x0000574f;
att_dispatch_register_client = 0x00005755;
att_dispatch_register_server = 0x00005769;
att_dispatch_server_can_send_now = 0x0000577d;
att_dispatch_server_request_can_send_now_event = 0x00005783;
att_emit_general_event = 0x00005835;
att_server_can_send_packet_now = 0x00005f61;
att_server_deferred_read_response = 0x00005f65;
att_server_get_mtu = 0x00005f7d;
att_server_indicate = 0x00005fe9;
att_server_init = 0x0000606d;
att_server_notify = 0x000060a9;
att_server_register_packet_handler = 0x000061c1;
att_server_request_can_send_now_event = 0x000061cd;
att_set_db = 0x000061e9;
att_set_read_callback = 0x000061fd;
att_set_write_callback = 0x00006209;
bd_addr_cmp = 0x00006379;
bd_addr_copy = 0x0000637f;
bd_addr_to_str = 0x00006389;
big_endian_read_16 = 0x000063c1;
big_endian_read_32 = 0x000063c9;
big_endian_store_16 = 0x000063dd;
big_endian_store_32 = 0x000063e9;
btstack_config = 0x0000653d;
btstack_memory_pool_create = 0x0000667b;
btstack_memory_pool_free = 0x000066a5;
btstack_memory_pool_get = 0x00006705;
btstack_push_user_msg = 0x0000676d;
btstack_push_user_runnable = 0x00006779;
char_for_nibble = 0x00006a01;
eTaskConfirmSleepModeStatus = 0x00006cd1;
gap_add_dev_to_periodic_list = 0x000072ad;
gap_add_whitelist = 0x000072bd;
gap_aes_encrypt = 0x000072c9;
gap_clear_white_lists = 0x00007301;
gap_clr_adv_set = 0x0000730d;
gap_clr_periodic_adv_list = 0x00007319;
gap_create_connection_cancel = 0x00007325;
gap_disconnect = 0x00007331;
gap_disconnect_all = 0x0000735d;
gap_ext_create_connection = 0x0000739d;
gap_get_connection_parameter_range = 0x0000747d;
gap_le_read_channel_map = 0x000074b5;
gap_periodic_adv_create_sync = 0x00007521;
gap_periodic_adv_create_sync_cancel = 0x00007545;
gap_periodic_adv_term_sync = 0x00007551;
gap_read_periodic_adv_list_size = 0x000075d9;
gap_read_phy = 0x000075e5;
gap_read_remote_used_features = 0x000075f1;
gap_read_remote_version = 0x000075fd;
gap_read_rssi = 0x00007609;
gap_remove_whitelist = 0x00007615;
gap_rmv_adv_set = 0x00007691;
gap_rmv_dev_from_periodic_list = 0x0000769d;
gap_rx_test_v2 = 0x000076ad;
gap_set_adv_set_random_addr = 0x000076e5;
gap_set_callback_for_next_hci = 0x00007721;
gap_set_connection_parameter_range = 0x00007741;
gap_set_data_length = 0x00007759;
gap_set_def_phy = 0x00007771;
gap_set_ext_adv_data = 0x00007781;
gap_set_ext_adv_enable = 0x00007799;
gap_set_ext_adv_para = 0x00007815;
gap_set_ext_scan_enable = 0x000078ed;
gap_set_ext_scan_para = 0x00007905;
gap_set_ext_scan_response_data = 0x000079ad;
gap_set_host_channel_classification = 0x000079c5;
gap_set_periodic_adv_data = 0x000079d5;
gap_set_periodic_adv_enable = 0x00007a45;
gap_set_periodic_adv_para = 0x00007a55;
gap_set_phy = 0x00007a6d;
gap_set_random_device_address = 0x00007a89;
gap_start_ccm = 0x00007ab9;
gap_test_end = 0x00007b01;
gap_tx_test_v2 = 0x00007b0d;
gap_tx_test_v4 = 0x00007b25;
gap_update_connection_parameters = 0x00007b49;
gap_vendor_tx_continuous_wave = 0x00007b89;
gatt_client_cancel_write = 0x000080b1;
gatt_client_discover_characteristic_descriptors = 0x000080d7;
gatt_client_discover_characteristics_for_handle_range_by_uuid128 = 0x00008117;
gatt_client_discover_characteristics_for_handle_range_by_uuid16 = 0x00008167;
gatt_client_discover_characteristics_for_service = 0x000081b7;
gatt_client_discover_primary_services = 0x000081ed;
gatt_client_discover_primary_services_by_uuid128 = 0x0000821f;
gatt_client_discover_primary_services_by_uuid16 = 0x00008263;
gatt_client_execute_write = 0x0000829f;
gatt_client_find_included_services_for_service = 0x000082c5;
gatt_client_get_mtu = 0x000082f3;
gatt_client_is_ready = 0x00008391;
gatt_client_listen_for_characteristic_value_updates = 0x000083a7;
gatt_client_prepare_write = 0x000083c7;
gatt_client_read_characteristic_descriptor_using_descriptor_handle = 0x00008403;
gatt_client_read_long_characteristic_descriptor_using_descriptor_handle = 0x0000842d;
gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset = 0x00008433;
gatt_client_read_long_value_of_characteristic_using_value_handle = 0x00008461;
gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset = 0x00008467;
gatt_client_read_multiple_characteristic_values = 0x00008495;
gatt_client_read_value_of_characteristic_using_value_handle = 0x000084c5;
gatt_client_read_value_of_characteristics_by_uuid128 = 0x000084f3;
gatt_client_read_value_of_characteristics_by_uuid16 = 0x0000853f;
gatt_client_register_handler = 0x00008589;
gatt_client_reliable_write_long_value_of_characteristic = 0x00008595;
gatt_client_signed_write_without_response = 0x00008999;
gatt_client_write_characteristic_descriptor_using_descriptor_handle = 0x00008a5d;
gatt_client_write_client_characteristic_configuration = 0x00008a97;
gatt_client_write_long_characteristic_descriptor_using_descriptor_handle = 0x00008ae9;
gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset = 0x00008af9;
gatt_client_write_long_value_of_characteristic = 0x00008b35;
gatt_client_write_long_value_of_characteristic_with_offset = 0x00008b45;
gatt_client_write_value_of_characteristic = 0x00008b81;
gatt_client_write_value_of_characteristic_without_response = 0x00008bb7;
hci_add_event_handler = 0x0000a0d1;
hci_power_control = 0x0000a83d;
hci_register_acl_packet_handler = 0x0000a9f1;
kv_commit = 0x0000b13d;
kv_get = 0x0000b199;
kv_init = 0x0000b1a5;
kv_init_backend = 0x0000b221;
kv_put = 0x0000b235;
kv_remove = 0x0000b241;
kv_remove_all = 0x0000b275;
kv_value_modified = 0x0000b2a5;
kv_value_modified_of_key = 0x0000b2c1;
kv_visit = 0x0000b2cd;
l2cap_add_event_handler = 0x0000b35d;
l2cap_can_send_packet_now = 0x0000b36d;
l2cap_create_le_credit_based_connection_request = 0x0000b529;
l2cap_credit_based_send = 0x0000b66d;
l2cap_credit_based_send_continue = 0x0000b699;
l2cap_disconnect = 0x0000b715;
l2cap_get_le_credit_based_connection_credits = 0x0000b965;
l2cap_get_peer_mtu_for_local_cid = 0x0000b981;
l2cap_init = 0x0000bd55;
l2cap_le_send_flow_control_credit = 0x0000be4b;
l2cap_max_le_mtu = 0x0000c155;
l2cap_register_packet_handler = 0x0000c27d;
l2cap_register_service = 0x0000c289;
l2cap_request_can_send_now_event = 0x0000c399;
l2cap_request_connection_parameter_update = 0x0000c3b3;
l2cap_send_echo_request = 0x0000c88d;
l2cap_unregister_service = 0x0000c94d;
le_device_db_add = 0x0000c9a5;
le_device_db_find = 0x0000ca6d;
le_device_db_from_key = 0x0000ca99;
le_device_db_iter_cur = 0x0000caa1;
le_device_db_iter_cur_key = 0x0000caa5;
le_device_db_iter_init = 0x0000caa9;
le_device_db_iter_next = 0x0000cab1;
le_device_db_remove_key = 0x0000cad7;
ll_aes_encrypt = 0x0000cb05;
ll_config = 0x0000cb81;
ll_free = 0x0000cbb7;
ll_get_heap_free_size = 0x0000cbc1;
ll_hint_on_ce_len = 0x0000cbd5;
ll_legacy_adv_set_interval = 0x0000cc0d;
ll_malloc = 0x0000cc1d;
ll_query_timing_info = 0x0000cd55;
ll_register_hci_acl_previewer = 0x0000cda1;
ll_scan_set_fixed_channel = 0x0000ce05;
ll_set_adv_access_address = 0x0000d01d;
ll_set_adv_coded_scheme = 0x0000d029;
ll_set_conn_acl_report_latency = 0x0000d051;
ll_set_conn_coded_scheme = 0x0000d07d;
ll_set_conn_latency = 0x0000d0a5;
ll_set_conn_tx_power = 0x0000d0d1;
ll_set_def_antenna = 0x0000d115;
ll_set_initiating_coded_scheme = 0x0000d131;
ll_set_max_conn_number = 0x0000d13d;
nibble_for_char = 0x0001d1d1;
platform_32k_rc_auto_tune = 0x0001d271;
platform_32k_rc_tune = 0x0001d2ed;
platform_calibrate_32k = 0x0001d301;
platform_config = 0x0001d305;
platform_delete_timer = 0x0001d429;
platform_enable_irq = 0x0001d431;
platform_get_current_task = 0x0001d469;
platform_get_gen_os_driver = 0x0001d48d;
platform_get_heap_status = 0x0001d495;
platform_get_task_handle = 0x0001d4ad;
platform_get_timer_counter = 0x0001d4cd;
platform_get_us_time = 0x0001d4d1;
platform_get_version = 0x0001d4d5;
platform_hrng = 0x0001d4dd;
platform_install_isr_stack = 0x0001d4e5;
platform_install_task_stack = 0x0001d4f1;
platform_patch_rf_init_data = 0x0001d529;
platform_printf = 0x0001d535;
platform_raise_assertion = 0x0001d549;
platform_rand = 0x0001d55d;
platform_read_info = 0x0001d561;
platform_read_persistent_reg = 0x0001d591;
platform_reset = 0x0001d5a1;
platform_set_abs_timer = 0x0001d5c5;
platform_set_evt_callback = 0x0001d5c9;
platform_set_evt_callback_table = 0x0001d5dd;
platform_set_irq_callback = 0x0001d5e9;
platform_set_irq_callback_table = 0x0001d605;
platform_set_rf_clk_source = 0x0001d611;
platform_set_rf_init_data = 0x0001d61d;
platform_set_rf_power_mapping = 0x0001d629;
platform_set_timer = 0x0001d635;
platform_shutdown = 0x0001d639;
platform_switch_app = 0x0001d63d;
platform_trace_raw = 0x0001d669;
platform_write_persistent_reg = 0x0001d681;
printf_hexdump = 0x0001d835;
pvPortMalloc = 0x0001e321;
pvTaskIncrementMutexHeldCount = 0x0001e409;
pvTimerGetTimerID = 0x0001e421;
pxPortInitialiseStack = 0x0001e44d;
reverse_128 = 0x0001e5f5;
reverse_24 = 0x0001e5fb;
reverse_256 = 0x0001e601;
reverse_48 = 0x0001e607;
reverse_56 = 0x0001e60d;
reverse_64 = 0x0001e613;
reverse_bd_addr = 0x0001e619;
reverse_bytes = 0x0001e61f;
sm_add_event_handler = 0x0001e78d;
sm_address_resolution_lookup = 0x0001e8e5;
sm_authenticated = 0x0001ec61;
sm_authorization_decline = 0x0001ec6f;
sm_authorization_grant = 0x0001ec8f;
sm_authorization_state = 0x0001ecaf;
sm_bonding_decline = 0x0001ecc9;
sm_config = 0x0001f125;
sm_config_conn = 0x0001f13d;
sm_encryption_key_size = 0x0001f2f3;
sm_just_works_confirm = 0x0001f879;
sm_le_device_key = 0x0001fbc5;
sm_passkey_input = 0x0001fc5b;
sm_private_random_address_generation_get = 0x00020015;
sm_private_random_address_generation_get_mode = 0x0002001d;
sm_private_random_address_generation_set_mode = 0x00020029;
sm_private_random_address_generation_set_update_period = 0x00020051;
sm_register_external_ltk_callback = 0x0002018d;
sm_register_oob_data_callback = 0x00020199;
sm_request_pairing = 0x000201a5;
sm_send_security_request = 0x00020c7b;
sm_set_accepted_stk_generation_methods = 0x00020ca1;
sm_set_authentication_requirements = 0x00020cad;
sm_set_encryption_key_size_range = 0x00020cb9;
sscanf_bd_addr = 0x00021015;
sysSetPublicDeviceAddr = 0x000213c9;
uuid128_to_str = 0x000219a9;
uuid_add_bluetooth_prefix = 0x00021a01;
uuid_has_bluetooth_prefix = 0x00021a21;
uxListRemove = 0x00021a3d;
uxQueueMessagesWaiting = 0x00021a65;
uxQueueMessagesWaitingFromISR = 0x00021a8d;
uxQueueSpacesAvailable = 0x00021aa9;
uxTaskGetStackHighWaterMark = 0x00021ad5;
uxTaskPriorityGet = 0x00021af5;
uxTaskPriorityGetFromISR = 0x00021b11;
vListInitialise = 0x00021bcb;
vListInitialiseItem = 0x00021be1;
vListInsert = 0x00021be7;
vListInsertEnd = 0x00021c17;
vPortEndScheduler = 0x00021c31;
vPortEnterCritical = 0x00021c5d;
vPortExitCritical = 0x00021ca1;
vPortFree = 0x00021cd5;
vPortSuppressTicksAndSleep = 0x00021d69;
vPortValidateInterruptPriority = 0x00021e91;
vQueueDelete = 0x00021eed;
vQueueWaitForMessageRestricted = 0x00021f19;
vTaskDelay = 0x00021f61;
vTaskInternalSetTimeOutState = 0x00021fad;
vTaskMissedYield = 0x00021fbd;
vTaskPlaceOnEventList = 0x00021fc9;
vTaskPlaceOnEventListRestricted = 0x00022001;
vTaskPriorityDisinheritAfterTimeout = 0x00022041;
vTaskPrioritySet = 0x000220ed;
vTaskResume = 0x000221b5;
vTaskStartScheduler = 0x00022239;
vTaskStepTick = 0x000222c9;
vTaskSuspend = 0x000222f9;
vTaskSuspendAll = 0x000223b5;
vTaskSwitchContext = 0x000223c5;
xPortStartScheduler = 0x00022469;
xQueueAddToSet = 0x00022531;
xQueueCreateCountingSemaphore = 0x00022555;
xQueueCreateCountingSemaphoreStatic = 0x00022591;
xQueueCreateMutex = 0x000225d5;
xQueueCreateMutexStatic = 0x000225eb;
xQueueCreateSet = 0x00022605;
xQueueGenericCreate = 0x0002260d;
xQueueGenericCreateStatic = 0x00022659;
xQueueGenericReset = 0x000226c1;
xQueueGenericSend = 0x0002274d;
xQueueGenericSendFromISR = 0x000228b9;
xQueueGiveFromISR = 0x00022979;
xQueueGiveMutexRecursive = 0x00022a1d;
xQueueIsQueueEmptyFromISR = 0x00022a5d;
xQueueIsQueueFullFromISR = 0x00022a81;
xQueuePeek = 0x00022aa9;
xQueuePeekFromISR = 0x00022bd1;
xQueueReceive = 0x00022c3d;
xQueueReceiveFromISR = 0x00022d69;
xQueueRemoveFromSet = 0x00022dfd;
xQueueSelectFromSet = 0x00022e1f;
xQueueSelectFromSetFromISR = 0x00022e31;
xQueueSemaphoreTake = 0x00022e45;
xQueueTakeMutexRecursive = 0x00022fb1;
xTaskCheckForTimeOut = 0x00022ff5;
xTaskCreate = 0x00023065;
xTaskCreateStatic = 0x000230c1;
xTaskGetCurrentTaskHandle = 0x00023131;
xTaskGetSchedulerState = 0x0002313d;
xTaskGetTickCount = 0x00023159;
xTaskGetTickCountFromISR = 0x00023165;
xTaskIncrementTick = 0x00023175;
xTaskPriorityDisinherit = 0x00023241;
xTaskPriorityInherit = 0x000232d5;
xTaskRemoveFromEventList = 0x00023369;
xTaskResumeAll = 0x000233e9;
xTaskResumeFromISR = 0x000234b1;
xTimerCreate = 0x0002353d;
xTimerCreateStatic = 0x00023571;
xTimerCreateTimerTask = 0x000235a9;
xTimerGenericCommand = 0x00023615;
xTimerGetExpiryTime = 0x00023685;
xTimerGetTimerDaemonTaskHandle = 0x000236a5;
