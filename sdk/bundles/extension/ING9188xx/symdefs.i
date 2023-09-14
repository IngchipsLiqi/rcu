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
--define_symbol eTaskConfirmSleepModeStatus=0x00006e15
--define_symbol gap_add_dev_to_periodic_list=0x00007465
--define_symbol gap_add_whitelist=0x00007475
--define_symbol gap_aes_encrypt=0x00007481
--define_symbol gap_clear_white_lists=0x000074b9
--define_symbol gap_clr_adv_set=0x000074c5
--define_symbol gap_clr_periodic_adv_list=0x000074d1
--define_symbol gap_create_connection_cancel=0x000074dd
--define_symbol gap_default_periodic_adv_sync_transfer_param=0x000074e9
--define_symbol gap_disconnect=0x00007501
--define_symbol gap_disconnect_all=0x0000752d
--define_symbol gap_ext_create_connection=0x0000756d
--define_symbol gap_get_connection_parameter_range=0x0000764d
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
--define_symbol gap_set_connection_cte_request_enable=0x00007981
--define_symbol gap_set_connection_cte_response_enable=0x0000799d
--define_symbol gap_set_connection_cte_rx_param=0x000079ad
--define_symbol gap_set_connection_cte_tx_param=0x00007a09
--define_symbol gap_set_connection_parameter_range=0x00007a5d
--define_symbol gap_set_connectionless_cte_tx_enable=0x00007a75
--define_symbol gap_set_connectionless_cte_tx_param=0x00007a85
--define_symbol gap_set_connectionless_iq_sampling_enable=0x00007ae5
--define_symbol gap_set_data_length=0x00007b49
--define_symbol gap_set_def_phy=0x00007b61
--define_symbol gap_set_ext_adv_data=0x00007b71
--define_symbol gap_set_ext_adv_enable=0x00007b89
--define_symbol gap_set_ext_adv_para=0x00007c05
--define_symbol gap_set_ext_scan_enable=0x00007cdd
--define_symbol gap_set_ext_scan_para=0x00007cf5
--define_symbol gap_set_ext_scan_response_data=0x00007d9d
--define_symbol gap_set_host_channel_classification=0x00007db5
--define_symbol gap_set_periodic_adv_data=0x00007dc5
--define_symbol gap_set_periodic_adv_enable=0x00007e35
--define_symbol gap_set_periodic_adv_para=0x00007e45
--define_symbol gap_set_periodic_adv_rx_enable=0x00007e5d
--define_symbol gap_set_phy=0x00007e6d
--define_symbol gap_set_random_device_address=0x00007e89
--define_symbol gap_start_ccm=0x00007eb9
--define_symbol gap_test_end=0x00007f01
--define_symbol gap_tx_test_v2=0x00007f0d
--define_symbol gap_tx_test_v4=0x00007f25
--define_symbol gap_update_connection_parameters=0x00007f49
--define_symbol gap_vendor_tx_continuous_wave=0x00007f8d
--define_symbol gatt_client_cancel_write=0x000084b5
--define_symbol gatt_client_discover_characteristic_descriptors=0x000084db
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid128=0x0000851b
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid16=0x0000856b
--define_symbol gatt_client_discover_characteristics_for_service=0x000085bb
--define_symbol gatt_client_discover_primary_services=0x000085f1
--define_symbol gatt_client_discover_primary_services_by_uuid128=0x00008623
--define_symbol gatt_client_discover_primary_services_by_uuid16=0x00008667
--define_symbol gatt_client_execute_write=0x000086a3
--define_symbol gatt_client_find_included_services_for_service=0x000086c9
--define_symbol gatt_client_get_mtu=0x000086f7
--define_symbol gatt_client_is_ready=0x00008799
--define_symbol gatt_client_listen_for_characteristic_value_updates=0x000087af
--define_symbol gatt_client_prepare_write=0x000087d1
--define_symbol gatt_client_read_characteristic_descriptor_using_descriptor_handle=0x0000880d
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle=0x00008837
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x0000883d
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle=0x0000886b
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset=0x00008871
--define_symbol gatt_client_read_multiple_characteristic_values=0x0000889f
--define_symbol gatt_client_read_value_of_characteristic_using_value_handle=0x000088cf
--define_symbol gatt_client_read_value_of_characteristics_by_uuid128=0x000088fd
--define_symbol gatt_client_read_value_of_characteristics_by_uuid16=0x00008949
--define_symbol gatt_client_register_handler=0x00008995
--define_symbol gatt_client_reliable_write_long_value_of_characteristic=0x000089a1
--define_symbol gatt_client_signed_write_without_response=0x00008dd1
--define_symbol gatt_client_write_characteristic_descriptor_using_descriptor_handle=0x00008e95
--define_symbol gatt_client_write_client_characteristic_configuration=0x00008ecf
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle=0x00008f21
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x00008f31
--define_symbol gatt_client_write_long_value_of_characteristic=0x00008f6d
--define_symbol gatt_client_write_long_value_of_characteristic_with_offset=0x00008f7d
--define_symbol gatt_client_write_value_of_characteristic=0x00008fb9
--define_symbol gatt_client_write_value_of_characteristic_without_response=0x00008fef
--define_symbol hci_add_event_handler=0x0000a531
--define_symbol hci_power_control=0x0000acb5
--define_symbol hci_register_acl_packet_handler=0x0000ae69
--define_symbol kv_commit=0x0000b5c1
--define_symbol kv_get=0x0000b61d
--define_symbol kv_init=0x0000b629
--define_symbol kv_init_backend=0x0000b6a9
--define_symbol kv_put=0x0000b6bd
--define_symbol kv_remove=0x0000b6c9
--define_symbol kv_remove_all=0x0000b6fd
--define_symbol kv_value_modified=0x0000b72d
--define_symbol kv_value_modified_of_key=0x0000b749
--define_symbol kv_visit=0x0000b755
--define_symbol l2cap_add_event_handler=0x0000b7e5
--define_symbol l2cap_can_send_packet_now=0x0000b7f5
--define_symbol l2cap_create_le_credit_based_connection_request=0x0000b9b1
--define_symbol l2cap_credit_based_send=0x0000baf5
--define_symbol l2cap_credit_based_send_continue=0x0000bb21
--define_symbol l2cap_disconnect=0x0000bb9d
--define_symbol l2cap_get_le_credit_based_connection_credits=0x0000bded
--define_symbol l2cap_get_peer_mtu_for_local_cid=0x0000be09
--define_symbol l2cap_init=0x0000c1dd
--define_symbol l2cap_le_send_flow_control_credit=0x0000c2d3
--define_symbol l2cap_max_le_mtu=0x0000c5dd
--define_symbol l2cap_register_packet_handler=0x0000c705
--define_symbol l2cap_register_service=0x0000c711
--define_symbol l2cap_request_can_send_now_event=0x0000c821
--define_symbol l2cap_request_connection_parameter_update=0x0000c83b
--define_symbol l2cap_send_echo_request=0x0000cd15
--define_symbol l2cap_unregister_service=0x0000cdd5
--define_symbol le_device_db_add=0x0000ce2d
--define_symbol le_device_db_find=0x0000cf05
--define_symbol le_device_db_from_key=0x0000cf31
--define_symbol le_device_db_iter_cur=0x0000cf39
--define_symbol le_device_db_iter_cur_key=0x0000cf3d
--define_symbol le_device_db_iter_init=0x0000cf41
--define_symbol le_device_db_iter_next=0x0000cf49
--define_symbol le_device_db_remove_key=0x0000cf6f
--define_symbol ll_ackable_packet_alloc=0x0000cf9b
--define_symbol ll_ackable_packet_get_status=0x0000d0cd
--define_symbol ll_ackable_packet_run=0x0000d13d
--define_symbol ll_ackable_packet_set_tx_data=0x0000d1d9
--define_symbol ll_aes_encrypt=0x0000d1f5
--define_symbol ll_attach_cte_to_adv_set=0x0000d271
--define_symbol ll_channel_monitor_alloc=0x0000d409
--define_symbol ll_channel_monitor_check_each_pdu=0x0000d48b
--define_symbol ll_channel_monitor_run=0x0000d4f1
--define_symbol ll_config=0x0000d5a5
--define_symbol ll_free=0x0000d5db
--define_symbol ll_get_heap_free_size=0x0000d5e5
--define_symbol ll_hint_on_ce_len=0x0000d5f9
--define_symbol ll_legacy_adv_set_interval=0x0000d631
--define_symbol ll_lock_frequency=0x0000d641
--define_symbol ll_malloc=0x0000d6a5
--define_symbol ll_query_timing_info=0x0000d7dd
--define_symbol ll_raw_packet_alloc=0x0000d829
--define_symbol ll_raw_packet_free=0x0000d8fd
--define_symbol ll_raw_packet_get_bare_rx_data=0x0000d935
--define_symbol ll_raw_packet_get_iq_samples=0x0000d9fb
--define_symbol ll_raw_packet_get_rx_data=0x0000da95
--define_symbol ll_raw_packet_recv=0x0000db35
--define_symbol ll_raw_packet_send=0x0000dbf1
--define_symbol ll_raw_packet_set_bare_data=0x0000dcd9
--define_symbol ll_raw_packet_set_bare_mode=0x0000dd17
--define_symbol ll_raw_packet_set_fake_cte_info=0x0000de1d
--define_symbol ll_raw_packet_set_param=0x0000de3f
--define_symbol ll_raw_packet_set_rx_cte=0x0000de9d
--define_symbol ll_raw_packet_set_tx_cte=0x0000df33
--define_symbol ll_raw_packet_set_tx_data=0x0000df71
--define_symbol ll_register_hci_acl_previewer=0x0000dfd5
--define_symbol ll_scan_set_fixed_channel=0x0000e039
--define_symbol ll_scanner_enable_iq_sampling=0x0000e045
--define_symbol ll_set_adv_access_address=0x0000e2f9
--define_symbol ll_set_adv_coded_scheme=0x0000e305
--define_symbol ll_set_conn_acl_report_latency=0x0000e335
--define_symbol ll_set_conn_coded_scheme=0x0000e365
--define_symbol ll_set_conn_interval_unit=0x0000e391
--define_symbol ll_set_conn_latency=0x0000e39d
--define_symbol ll_set_conn_tx_power=0x0000e3cd
--define_symbol ll_set_def_antenna=0x0000e415
--define_symbol ll_set_initiating_coded_scheme=0x0000e431
--define_symbol ll_set_max_conn_number=0x0000e43d
--define_symbol ll_unlock_frequency=0x0000e4d1
--define_symbol nibble_for_char=0x0001f781
--define_symbol platform_32k_rc_auto_tune=0x0001f82d
--define_symbol platform_32k_rc_tune=0x0001f8a9
--define_symbol platform_calibrate_32k=0x0001f8bd
--define_symbol platform_config=0x0001f8c1
--define_symbol platform_delete_timer=0x0001f9e5
--define_symbol platform_enable_irq=0x0001f9ed
--define_symbol platform_get_current_task=0x0001fa25
--define_symbol platform_get_gen_os_driver=0x0001fa49
--define_symbol platform_get_heap_status=0x0001fa51
--define_symbol platform_get_task_handle=0x0001fa69
--define_symbol platform_get_timer_counter=0x0001fa89
--define_symbol platform_get_us_time=0x0001fa8d
--define_symbol platform_get_version=0x0001fa91
--define_symbol platform_hrng=0x0001fa99
--define_symbol platform_install_isr_stack=0x0001faa1
--define_symbol platform_install_task_stack=0x0001faad
--define_symbol platform_patch_rf_init_data=0x0001fae5
--define_symbol platform_printf=0x0001faf1
--define_symbol platform_raise_assertion=0x0001fb05
--define_symbol platform_rand=0x0001fb19
--define_symbol platform_read_info=0x0001fb1d
--define_symbol platform_read_persistent_reg=0x0001fb4d
--define_symbol platform_reset=0x0001fb5d
--define_symbol platform_set_abs_timer=0x0001fb81
--define_symbol platform_set_evt_callback=0x0001fb85
--define_symbol platform_set_evt_callback_table=0x0001fb99
--define_symbol platform_set_irq_callback=0x0001fba5
--define_symbol platform_set_irq_callback_table=0x0001fbc1
--define_symbol platform_set_rf_clk_source=0x0001fbcd
--define_symbol platform_set_rf_init_data=0x0001fbd9
--define_symbol platform_set_rf_power_mapping=0x0001fbe5
--define_symbol platform_set_timer=0x0001fbf1
--define_symbol platform_shutdown=0x0001fbf5
--define_symbol platform_switch_app=0x0001fbf9
--define_symbol platform_trace_raw=0x0001fc25
--define_symbol platform_write_persistent_reg=0x0001fc3d
--define_symbol printf_hexdump=0x0001fdf1
--define_symbol pvPortMalloc=0x000208e5
--define_symbol pvTaskIncrementMutexHeldCount=0x000209cd
--define_symbol pvTimerGetTimerID=0x000209e5
--define_symbol pxPortInitialiseStack=0x00020a11
--define_symbol reverse_128=0x00020bf1
--define_symbol reverse_24=0x00020bf7
--define_symbol reverse_256=0x00020bfd
--define_symbol reverse_48=0x00020c03
--define_symbol reverse_56=0x00020c09
--define_symbol reverse_64=0x00020c0f
--define_symbol reverse_bd_addr=0x00020c15
--define_symbol reverse_bytes=0x00020c1b
--define_symbol sm_add_event_handler=0x00020f09
--define_symbol sm_address_resolution_lookup=0x00021061
--define_symbol sm_authenticated=0x000213dd
--define_symbol sm_authorization_decline=0x000213eb
--define_symbol sm_authorization_grant=0x0002140b
--define_symbol sm_authorization_state=0x0002142b
--define_symbol sm_bonding_decline=0x00021445
--define_symbol sm_config=0x000218a1
--define_symbol sm_config_conn=0x000218b9
--define_symbol sm_encryption_key_size=0x00021a6f
--define_symbol sm_just_works_confirm=0x00021ff5
--define_symbol sm_le_device_key=0x00022341
--define_symbol sm_passkey_input=0x000223d7
--define_symbol sm_private_random_address_generation_get=0x00022791
--define_symbol sm_private_random_address_generation_get_mode=0x00022799
--define_symbol sm_private_random_address_generation_set_mode=0x000227a5
--define_symbol sm_private_random_address_generation_set_update_period=0x000227cd
--define_symbol sm_register_external_ltk_callback=0x00022909
--define_symbol sm_register_oob_data_callback=0x00022915
--define_symbol sm_request_pairing=0x00022921
--define_symbol sm_send_security_request=0x000233f7
--define_symbol sm_set_accepted_stk_generation_methods=0x0002341d
--define_symbol sm_set_authentication_requirements=0x00023429
--define_symbol sm_set_encryption_key_size_range=0x00023435
--define_symbol sscanf_bd_addr=0x00023805
--define_symbol sysSetPublicDeviceAddr=0x00023bb9
--define_symbol uuid128_to_str=0x0002432d
--define_symbol uuid_add_bluetooth_prefix=0x00024385
--define_symbol uuid_has_bluetooth_prefix=0x000243a5
--define_symbol uxListRemove=0x000243c1
--define_symbol uxQueueMessagesWaiting=0x000243e9
--define_symbol uxQueueMessagesWaitingFromISR=0x00024411
--define_symbol uxQueueSpacesAvailable=0x0002442d
--define_symbol uxTaskGetStackHighWaterMark=0x00024459
--define_symbol uxTaskPriorityGet=0x00024479
--define_symbol uxTaskPriorityGetFromISR=0x00024495
--define_symbol vListInitialise=0x0002454f
--define_symbol vListInitialiseItem=0x00024565
--define_symbol vListInsert=0x0002456b
--define_symbol vListInsertEnd=0x0002459b
--define_symbol vPortEndScheduler=0x000245b5
--define_symbol vPortEnterCritical=0x000245e1
--define_symbol vPortExitCritical=0x00024625
--define_symbol vPortFree=0x00024659
--define_symbol vPortSuppressTicksAndSleep=0x000246ed
--define_symbol vPortValidateInterruptPriority=0x00024815
--define_symbol vQueueDelete=0x00024871
--define_symbol vQueueWaitForMessageRestricted=0x0002489d
--define_symbol vTaskDelay=0x000248e5
--define_symbol vTaskInternalSetTimeOutState=0x00024931
--define_symbol vTaskMissedYield=0x00024941
--define_symbol vTaskPlaceOnEventList=0x0002494d
--define_symbol vTaskPlaceOnEventListRestricted=0x00024985
--define_symbol vTaskPriorityDisinheritAfterTimeout=0x000249c5
--define_symbol vTaskPrioritySet=0x00024a71
--define_symbol vTaskResume=0x00024b39
--define_symbol vTaskStartScheduler=0x00024bbd
--define_symbol vTaskStepTick=0x00024c4d
--define_symbol vTaskSuspend=0x00024c7d
--define_symbol vTaskSuspendAll=0x00024d39
--define_symbol vTaskSwitchContext=0x00024d49
--define_symbol xPortStartScheduler=0x00024df1
--define_symbol xQueueAddToSet=0x00024eb9
--define_symbol xQueueCreateCountingSemaphore=0x00024edd
--define_symbol xQueueCreateCountingSemaphoreStatic=0x00024f19
--define_symbol xQueueCreateMutex=0x00024f5d
--define_symbol xQueueCreateMutexStatic=0x00024f73
--define_symbol xQueueCreateSet=0x00024f8d
--define_symbol xQueueGenericCreate=0x00024f95
--define_symbol xQueueGenericCreateStatic=0x00024fe1
--define_symbol xQueueGenericReset=0x00025049
--define_symbol xQueueGenericSend=0x000250d5
--define_symbol xQueueGenericSendFromISR=0x00025241
--define_symbol xQueueGiveFromISR=0x00025301
--define_symbol xQueueGiveMutexRecursive=0x000253a5
--define_symbol xQueueIsQueueEmptyFromISR=0x000253e5
--define_symbol xQueueIsQueueFullFromISR=0x00025409
--define_symbol xQueuePeek=0x00025431
--define_symbol xQueuePeekFromISR=0x00025559
--define_symbol xQueueReceive=0x000255c5
--define_symbol xQueueReceiveFromISR=0x000256f1
--define_symbol xQueueRemoveFromSet=0x00025785
--define_symbol xQueueSelectFromSet=0x000257a7
--define_symbol xQueueSelectFromSetFromISR=0x000257b9
--define_symbol xQueueSemaphoreTake=0x000257cd
--define_symbol xQueueTakeMutexRecursive=0x00025939
--define_symbol xTaskCheckForTimeOut=0x0002597d
--define_symbol xTaskCreate=0x000259ed
--define_symbol xTaskCreateStatic=0x00025a49
--define_symbol xTaskGetCurrentTaskHandle=0x00025ab9
--define_symbol xTaskGetSchedulerState=0x00025ac5
--define_symbol xTaskGetTickCount=0x00025ae1
--define_symbol xTaskGetTickCountFromISR=0x00025aed
--define_symbol xTaskIncrementTick=0x00025afd
--define_symbol xTaskPriorityDisinherit=0x00025bc9
--define_symbol xTaskPriorityInherit=0x00025c5d
--define_symbol xTaskRemoveFromEventList=0x00025cf1
--define_symbol xTaskResumeAll=0x00025d71
--define_symbol xTaskResumeFromISR=0x00025e39
--define_symbol xTimerCreate=0x00025ec5
--define_symbol xTimerCreateStatic=0x00025ef9
--define_symbol xTimerCreateTimerTask=0x00025f31
--define_symbol xTimerGenericCommand=0x00025f9d
--define_symbol xTimerGetExpiryTime=0x0002600d
--define_symbol xTimerGetTimerDaemonTaskHandle=0x0002602d
