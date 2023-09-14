--define_symbol att_dispatch_client_can_send_now=0x00005875
--define_symbol att_dispatch_client_request_can_send_now_event=0x0000587b
--define_symbol att_dispatch_register_client=0x00005881
--define_symbol att_dispatch_register_server=0x00005895
--define_symbol att_dispatch_server_can_send_now=0x000058a9
--define_symbol att_dispatch_server_request_can_send_now_event=0x000058af
--define_symbol att_emit_general_event=0x00005961
--define_symbol att_server_can_send_packet_now=0x00006091
--define_symbol att_server_deferred_read_response=0x00006095
--define_symbol att_server_get_mtu=0x000060ad
--define_symbol att_server_indicate=0x00006125
--define_symbol att_server_init=0x000061a9
--define_symbol att_server_notify=0x000061e5
--define_symbol att_server_register_packet_handler=0x000062fd
--define_symbol att_server_request_can_send_now_event=0x00006309
--define_symbol att_set_db=0x00006325
--define_symbol att_set_read_callback=0x00006339
--define_symbol att_set_write_callback=0x00006345
--define_symbol bd_addr_cmp=0x000064b5
--define_symbol bd_addr_copy=0x000064bb
--define_symbol bd_addr_to_str=0x000064c5
--define_symbol big_endian_read_16=0x000064fd
--define_symbol big_endian_read_32=0x00006505
--define_symbol big_endian_store_16=0x00006519
--define_symbol big_endian_store_32=0x00006525
--define_symbol btstack_config=0x00006679
--define_symbol btstack_memory_pool_create=0x000067b7
--define_symbol btstack_memory_pool_free=0x000067e1
--define_symbol btstack_memory_pool_get=0x00006841
--define_symbol btstack_push_user_msg=0x000068a9
--define_symbol btstack_push_user_runnable=0x000068b5
--define_symbol char_for_nibble=0x00006b3d
--define_symbol eTaskConfirmSleepModeStatus=0x00006e11
--define_symbol gap_add_dev_to_periodic_list=0x00007469
--define_symbol gap_add_whitelist=0x00007479
--define_symbol gap_aes_encrypt=0x00007485
--define_symbol gap_clear_white_lists=0x000074bd
--define_symbol gap_clr_adv_set=0x000074c9
--define_symbol gap_clr_periodic_adv_list=0x000074d5
--define_symbol gap_create_connection_cancel=0x000074e1
--define_symbol gap_default_periodic_adv_sync_transfer_param=0x000074ed
--define_symbol gap_disconnect=0x00007505
--define_symbol gap_disconnect_all=0x00007531
--define_symbol gap_ext_create_connection=0x00007571
--define_symbol gap_get_connection_parameter_range=0x00007651
--define_symbol gap_le_read_channel_map=0x00007689
--define_symbol gap_periodic_adv_create_sync=0x000076f5
--define_symbol gap_periodic_adv_create_sync_cancel=0x00007719
--define_symbol gap_periodic_adv_set_info_transfer=0x00007725
--define_symbol gap_periodic_adv_sync_transfer=0x00007735
--define_symbol gap_periodic_adv_sync_transfer_param=0x00007745
--define_symbol gap_periodic_adv_term_sync=0x00007761
--define_symbol gap_read_antenna_info=0x000077e9
--define_symbol gap_read_periodic_adv_list_size=0x000077f5
--define_symbol gap_read_phy=0x00007801
--define_symbol gap_read_remote_used_features=0x0000780d
--define_symbol gap_read_remote_version=0x00007819
--define_symbol gap_read_rssi=0x00007825
--define_symbol gap_remove_whitelist=0x00007831
--define_symbol gap_rmv_adv_set=0x000078ad
--define_symbol gap_rmv_dev_from_periodic_list=0x000078b9
--define_symbol gap_rx_test_v2=0x000078c9
--define_symbol gap_rx_test_v3=0x000078d9
--define_symbol gap_set_adv_set_random_addr=0x00007925
--define_symbol gap_set_callback_for_next_hci=0x00007961
--define_symbol gap_set_connection_cte_request_enable=0x00007989
--define_symbol gap_set_connection_cte_response_enable=0x000079a5
--define_symbol gap_set_connection_cte_rx_param=0x000079b5
--define_symbol gap_set_connection_cte_tx_param=0x00007a11
--define_symbol gap_set_connection_parameter_range=0x00007a65
--define_symbol gap_set_connectionless_cte_tx_enable=0x00007a81
--define_symbol gap_set_connectionless_cte_tx_param=0x00007a91
--define_symbol gap_set_connectionless_iq_sampling_enable=0x00007af1
--define_symbol gap_set_data_length=0x00007b55
--define_symbol gap_set_def_phy=0x00007b6d
--define_symbol gap_set_ext_adv_data=0x00007b7d
--define_symbol gap_set_ext_adv_enable=0x00007b95
--define_symbol gap_set_ext_adv_para=0x00007c11
--define_symbol gap_set_ext_scan_enable=0x00007ce9
--define_symbol gap_set_ext_scan_para=0x00007d01
--define_symbol gap_set_ext_scan_response_data=0x00007da9
--define_symbol gap_set_host_channel_classification=0x00007dc1
--define_symbol gap_set_periodic_adv_data=0x00007dd1
--define_symbol gap_set_periodic_adv_enable=0x00007e41
--define_symbol gap_set_periodic_adv_para=0x00007e51
--define_symbol gap_set_periodic_adv_rx_enable=0x00007e69
--define_symbol gap_set_phy=0x00007e79
--define_symbol gap_set_random_device_address=0x00007e95
--define_symbol gap_start_ccm=0x00007ec5
--define_symbol gap_test_end=0x00007f0d
--define_symbol gap_tx_test_v2=0x00007f19
--define_symbol gap_tx_test_v4=0x00007f31
--define_symbol gap_update_connection_parameters=0x00007f55
--define_symbol gap_vendor_tx_continuous_wave=0x00007f99
--define_symbol gatt_client_cancel_write=0x000084c1
--define_symbol gatt_client_discover_characteristic_descriptors=0x000084e7
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid128=0x00008527
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid16=0x00008577
--define_symbol gatt_client_discover_characteristics_for_service=0x000085c7
--define_symbol gatt_client_discover_primary_services=0x000085fd
--define_symbol gatt_client_discover_primary_services_by_uuid128=0x0000862f
--define_symbol gatt_client_discover_primary_services_by_uuid16=0x00008673
--define_symbol gatt_client_execute_write=0x000086af
--define_symbol gatt_client_find_included_services_for_service=0x000086d5
--define_symbol gatt_client_get_mtu=0x00008703
--define_symbol gatt_client_is_ready=0x000087a5
--define_symbol gatt_client_listen_for_characteristic_value_updates=0x000087bb
--define_symbol gatt_client_prepare_write=0x000087dd
--define_symbol gatt_client_read_characteristic_descriptor_using_descriptor_handle=0x00008819
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle=0x00008843
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x00008849
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle=0x00008877
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset=0x0000887d
--define_symbol gatt_client_read_multiple_characteristic_values=0x000088ab
--define_symbol gatt_client_read_value_of_characteristic_using_value_handle=0x000088db
--define_symbol gatt_client_read_value_of_characteristics_by_uuid128=0x00008909
--define_symbol gatt_client_read_value_of_characteristics_by_uuid16=0x00008955
--define_symbol gatt_client_register_handler=0x000089a1
--define_symbol gatt_client_reliable_write_long_value_of_characteristic=0x000089ad
--define_symbol gatt_client_signed_write_without_response=0x00008ddd
--define_symbol gatt_client_write_characteristic_descriptor_using_descriptor_handle=0x00008ea1
--define_symbol gatt_client_write_client_characteristic_configuration=0x00008edb
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle=0x00008f2d
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x00008f3d
--define_symbol gatt_client_write_long_value_of_characteristic=0x00008f79
--define_symbol gatt_client_write_long_value_of_characteristic_with_offset=0x00008f89
--define_symbol gatt_client_write_value_of_characteristic=0x00008fc5
--define_symbol gatt_client_write_value_of_characteristic_without_response=0x00008ffb
--define_symbol hci_add_event_handler=0x0000a53d
--define_symbol hci_power_control=0x0000acc5
--define_symbol hci_register_acl_packet_handler=0x0000ae79
--define_symbol kv_commit=0x0000b5e5
--define_symbol kv_get=0x0000b641
--define_symbol kv_init=0x0000b64d
--define_symbol kv_init_backend=0x0000b6cd
--define_symbol kv_put=0x0000b6e1
--define_symbol kv_remove=0x0000b6ed
--define_symbol kv_remove_all=0x0000b721
--define_symbol kv_value_modified=0x0000b751
--define_symbol kv_value_modified_of_key=0x0000b76d
--define_symbol kv_visit=0x0000b779
--define_symbol l2cap_add_event_handler=0x0000b809
--define_symbol l2cap_can_send_packet_now=0x0000b819
--define_symbol l2cap_create_le_credit_based_connection_request=0x0000b9d5
--define_symbol l2cap_credit_based_send=0x0000bb19
--define_symbol l2cap_credit_based_send_continue=0x0000bb45
--define_symbol l2cap_disconnect=0x0000bbc1
--define_symbol l2cap_get_le_credit_based_connection_credits=0x0000be11
--define_symbol l2cap_get_peer_mtu_for_local_cid=0x0000be2d
--define_symbol l2cap_init=0x0000c201
--define_symbol l2cap_le_send_flow_control_credit=0x0000c2f7
--define_symbol l2cap_max_le_mtu=0x0000c601
--define_symbol l2cap_register_packet_handler=0x0000c729
--define_symbol l2cap_register_service=0x0000c735
--define_symbol l2cap_request_can_send_now_event=0x0000c845
--define_symbol l2cap_request_connection_parameter_update=0x0000c85f
--define_symbol l2cap_send_echo_request=0x0000cd39
--define_symbol l2cap_unregister_service=0x0000cdf9
--define_symbol le_device_db_add=0x0000ce51
--define_symbol le_device_db_find=0x0000cf29
--define_symbol le_device_db_from_key=0x0000cf55
--define_symbol le_device_db_iter_cur=0x0000cf5d
--define_symbol le_device_db_iter_cur_key=0x0000cf61
--define_symbol le_device_db_iter_init=0x0000cf65
--define_symbol le_device_db_iter_next=0x0000cf6d
--define_symbol le_device_db_remove_key=0x0000cf93
--define_symbol ll_aes_encrypt=0x0000cfc1
--define_symbol ll_config=0x0000d03d
--define_symbol ll_free=0x0000d073
--define_symbol ll_get_heap_free_size=0x0000d07d
--define_symbol ll_hint_on_ce_len=0x0000d091
--define_symbol ll_legacy_adv_set_interval=0x0000d0c9
--define_symbol ll_malloc=0x0000d0d9
--define_symbol ll_query_timing_info=0x0000d211
--define_symbol ll_register_hci_acl_previewer=0x0000d25d
--define_symbol ll_scan_set_fixed_channel=0x0000d2c1
--define_symbol ll_set_adv_access_address=0x0000d4d9
--define_symbol ll_set_adv_coded_scheme=0x0000d4e5
--define_symbol ll_set_conn_acl_report_latency=0x0000d515
--define_symbol ll_set_conn_coded_scheme=0x0000d545
--define_symbol ll_set_conn_latency=0x0000d571
--define_symbol ll_set_conn_tx_power=0x0000d5a1
--define_symbol ll_set_def_antenna=0x0000d5e9
--define_symbol ll_set_initiating_coded_scheme=0x0000d605
--define_symbol ll_set_max_conn_number=0x0000d611
--define_symbol nibble_for_char=0x0001e6b1
--define_symbol platform_32k_rc_auto_tune=0x0001e75d
--define_symbol platform_32k_rc_tune=0x0001e7d9
--define_symbol platform_calibrate_32k=0x0001e7ed
--define_symbol platform_config=0x0001e7f1
--define_symbol platform_delete_timer=0x0001e915
--define_symbol platform_enable_irq=0x0001e91d
--define_symbol platform_get_current_task=0x0001e955
--define_symbol platform_get_gen_os_driver=0x0001e979
--define_symbol platform_get_heap_status=0x0001e981
--define_symbol platform_get_task_handle=0x0001e999
--define_symbol platform_get_timer_counter=0x0001e9b9
--define_symbol platform_get_us_time=0x0001e9bd
--define_symbol platform_get_version=0x0001e9c1
--define_symbol platform_hrng=0x0001e9c9
--define_symbol platform_install_isr_stack=0x0001e9d1
--define_symbol platform_install_task_stack=0x0001e9dd
--define_symbol platform_patch_rf_init_data=0x0001ea15
--define_symbol platform_printf=0x0001ea21
--define_symbol platform_raise_assertion=0x0001ea35
--define_symbol platform_rand=0x0001ea49
--define_symbol platform_read_info=0x0001ea4d
--define_symbol platform_read_persistent_reg=0x0001ea7d
--define_symbol platform_reset=0x0001ea8d
--define_symbol platform_set_abs_timer=0x0001eab1
--define_symbol platform_set_evt_callback=0x0001eab5
--define_symbol platform_set_evt_callback_table=0x0001eac9
--define_symbol platform_set_irq_callback=0x0001ead5
--define_symbol platform_set_irq_callback_table=0x0001eaf1
--define_symbol platform_set_rf_clk_source=0x0001eafd
--define_symbol platform_set_rf_init_data=0x0001eb09
--define_symbol platform_set_rf_power_mapping=0x0001eb15
--define_symbol platform_set_timer=0x0001eb21
--define_symbol platform_shutdown=0x0001eb25
--define_symbol platform_switch_app=0x0001eb29
--define_symbol platform_trace_raw=0x0001eb55
--define_symbol platform_write_persistent_reg=0x0001eb6d
--define_symbol printf_hexdump=0x0001ed21
--define_symbol pvPortMalloc=0x0001f815
--define_symbol pvTaskIncrementMutexHeldCount=0x0001f8fd
--define_symbol pvTimerGetTimerID=0x0001f915
--define_symbol pxPortInitialiseStack=0x0001f941
--define_symbol reverse_128=0x0001fb21
--define_symbol reverse_24=0x0001fb27
--define_symbol reverse_256=0x0001fb2d
--define_symbol reverse_48=0x0001fb33
--define_symbol reverse_56=0x0001fb39
--define_symbol reverse_64=0x0001fb3f
--define_symbol reverse_bd_addr=0x0001fb45
--define_symbol reverse_bytes=0x0001fb4b
--define_symbol sm_add_event_handler=0x0001fe09
--define_symbol sm_address_resolution_lookup=0x0001ff61
--define_symbol sm_authenticated=0x000202dd
--define_symbol sm_authorization_decline=0x000202eb
--define_symbol sm_authorization_grant=0x0002030b
--define_symbol sm_authorization_state=0x0002032b
--define_symbol sm_bonding_decline=0x00020345
--define_symbol sm_config=0x000207a1
--define_symbol sm_config_conn=0x000207b9
--define_symbol sm_encryption_key_size=0x0002096f
--define_symbol sm_just_works_confirm=0x00020ef5
--define_symbol sm_le_device_key=0x00021241
--define_symbol sm_passkey_input=0x000212d7
--define_symbol sm_private_random_address_generation_get=0x00021691
--define_symbol sm_private_random_address_generation_get_mode=0x00021699
--define_symbol sm_private_random_address_generation_set_mode=0x000216a5
--define_symbol sm_private_random_address_generation_set_update_period=0x000216cd
--define_symbol sm_register_external_ltk_callback=0x00021809
--define_symbol sm_register_oob_data_callback=0x00021815
--define_symbol sm_request_pairing=0x00021821
--define_symbol sm_send_security_request=0x000222f7
--define_symbol sm_set_accepted_stk_generation_methods=0x0002231d
--define_symbol sm_set_authentication_requirements=0x00022329
--define_symbol sm_set_encryption_key_size_range=0x00022335
--define_symbol sscanf_bd_addr=0x00022691
--define_symbol sysSetPublicDeviceAddr=0x00022a45
--define_symbol uuid128_to_str=0x000231b9
--define_symbol uuid_add_bluetooth_prefix=0x00023211
--define_symbol uuid_has_bluetooth_prefix=0x00023231
--define_symbol uxListRemove=0x0002324d
--define_symbol uxQueueMessagesWaiting=0x00023275
--define_symbol uxQueueMessagesWaitingFromISR=0x0002329d
--define_symbol uxQueueSpacesAvailable=0x000232b9
--define_symbol uxTaskGetStackHighWaterMark=0x000232e5
--define_symbol uxTaskPriorityGet=0x00023305
--define_symbol uxTaskPriorityGetFromISR=0x00023321
--define_symbol vListInitialise=0x000233db
--define_symbol vListInitialiseItem=0x000233f1
--define_symbol vListInsert=0x000233f7
--define_symbol vListInsertEnd=0x00023427
--define_symbol vPortEndScheduler=0x00023441
--define_symbol vPortEnterCritical=0x0002346d
--define_symbol vPortExitCritical=0x000234b1
--define_symbol vPortFree=0x000234e5
--define_symbol vPortSuppressTicksAndSleep=0x00023579
--define_symbol vPortValidateInterruptPriority=0x000236a1
--define_symbol vQueueDelete=0x000236fd
--define_symbol vQueueWaitForMessageRestricted=0x00023729
--define_symbol vTaskDelay=0x00023771
--define_symbol vTaskInternalSetTimeOutState=0x000237bd
--define_symbol vTaskMissedYield=0x000237cd
--define_symbol vTaskPlaceOnEventList=0x000237d9
--define_symbol vTaskPlaceOnEventListRestricted=0x00023811
--define_symbol vTaskPriorityDisinheritAfterTimeout=0x00023851
--define_symbol vTaskPrioritySet=0x000238fd
--define_symbol vTaskResume=0x000239c5
--define_symbol vTaskStartScheduler=0x00023a49
--define_symbol vTaskStepTick=0x00023ad9
--define_symbol vTaskSuspend=0x00023b09
--define_symbol vTaskSuspendAll=0x00023bc5
--define_symbol vTaskSwitchContext=0x00023bd5
--define_symbol xPortStartScheduler=0x00023c7d
--define_symbol xQueueAddToSet=0x00023d45
--define_symbol xQueueCreateCountingSemaphore=0x00023d69
--define_symbol xQueueCreateCountingSemaphoreStatic=0x00023da5
--define_symbol xQueueCreateMutex=0x00023de9
--define_symbol xQueueCreateMutexStatic=0x00023dff
--define_symbol xQueueCreateSet=0x00023e19
--define_symbol xQueueGenericCreate=0x00023e21
--define_symbol xQueueGenericCreateStatic=0x00023e6d
--define_symbol xQueueGenericReset=0x00023ed5
--define_symbol xQueueGenericSend=0x00023f61
--define_symbol xQueueGenericSendFromISR=0x000240cd
--define_symbol xQueueGiveFromISR=0x0002418d
--define_symbol xQueueGiveMutexRecursive=0x00024231
--define_symbol xQueueIsQueueEmptyFromISR=0x00024271
--define_symbol xQueueIsQueueFullFromISR=0x00024295
--define_symbol xQueuePeek=0x000242bd
--define_symbol xQueuePeekFromISR=0x000243e5
--define_symbol xQueueReceive=0x00024451
--define_symbol xQueueReceiveFromISR=0x0002457d
--define_symbol xQueueRemoveFromSet=0x00024611
--define_symbol xQueueSelectFromSet=0x00024633
--define_symbol xQueueSelectFromSetFromISR=0x00024645
--define_symbol xQueueSemaphoreTake=0x00024659
--define_symbol xQueueTakeMutexRecursive=0x000247c5
--define_symbol xTaskCheckForTimeOut=0x00024809
--define_symbol xTaskCreate=0x00024879
--define_symbol xTaskCreateStatic=0x000248d5
--define_symbol xTaskGetCurrentTaskHandle=0x00024945
--define_symbol xTaskGetSchedulerState=0x00024951
--define_symbol xTaskGetTickCount=0x0002496d
--define_symbol xTaskGetTickCountFromISR=0x00024979
--define_symbol xTaskIncrementTick=0x00024989
--define_symbol xTaskPriorityDisinherit=0x00024a55
--define_symbol xTaskPriorityInherit=0x00024ae9
--define_symbol xTaskRemoveFromEventList=0x00024b7d
--define_symbol xTaskResumeAll=0x00024bfd
--define_symbol xTaskResumeFromISR=0x00024cc5
--define_symbol xTimerCreate=0x00024d51
--define_symbol xTimerCreateStatic=0x00024d85
--define_symbol xTimerCreateTimerTask=0x00024dbd
--define_symbol xTimerGenericCommand=0x00024e29
--define_symbol xTimerGetExpiryTime=0x00024e99
--define_symbol xTimerGetTimerDaemonTaskHandle=0x00024eb9
