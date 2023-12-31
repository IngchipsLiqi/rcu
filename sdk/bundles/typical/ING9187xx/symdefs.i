--define_symbol att_dispatch_client_can_send_now=0x00005751
--define_symbol att_dispatch_client_request_can_send_now_event=0x00005757
--define_symbol att_dispatch_register_client=0x0000575d
--define_symbol att_dispatch_register_server=0x00005771
--define_symbol att_dispatch_server_can_send_now=0x00005785
--define_symbol att_dispatch_server_request_can_send_now_event=0x0000578b
--define_symbol att_emit_general_event=0x0000583d
--define_symbol att_server_can_send_packet_now=0x00005f6d
--define_symbol att_server_deferred_read_response=0x00005f71
--define_symbol att_server_get_mtu=0x00005f89
--define_symbol att_server_indicate=0x00006001
--define_symbol att_server_init=0x00006085
--define_symbol att_server_notify=0x000060c1
--define_symbol att_server_register_packet_handler=0x000061d9
--define_symbol att_server_request_can_send_now_event=0x000061e5
--define_symbol att_set_db=0x00006201
--define_symbol att_set_read_callback=0x00006215
--define_symbol att_set_write_callback=0x00006221
--define_symbol bd_addr_cmp=0x00006391
--define_symbol bd_addr_copy=0x00006397
--define_symbol bd_addr_to_str=0x000063a1
--define_symbol big_endian_read_16=0x000063d9
--define_symbol big_endian_read_32=0x000063e1
--define_symbol big_endian_store_16=0x000063f5
--define_symbol big_endian_store_32=0x00006401
--define_symbol btstack_config=0x00006555
--define_symbol btstack_memory_pool_create=0x00006693
--define_symbol btstack_memory_pool_free=0x000066bd
--define_symbol btstack_memory_pool_get=0x0000671d
--define_symbol btstack_push_user_msg=0x00006785
--define_symbol btstack_push_user_runnable=0x00006791
--define_symbol char_for_nibble=0x00006a19
--define_symbol eTaskConfirmSleepModeStatus=0x00006ced
--define_symbol gap_add_dev_to_periodic_list=0x000072cd
--define_symbol gap_add_whitelist=0x000072dd
--define_symbol gap_aes_encrypt=0x000072e9
--define_symbol gap_clear_white_lists=0x00007321
--define_symbol gap_clr_adv_set=0x0000732d
--define_symbol gap_clr_periodic_adv_list=0x00007339
--define_symbol gap_create_connection_cancel=0x00007345
--define_symbol gap_disconnect=0x00007351
--define_symbol gap_disconnect_all=0x0000737d
--define_symbol gap_ext_create_connection=0x000073bd
--define_symbol gap_get_connection_parameter_range=0x0000749d
--define_symbol gap_le_read_channel_map=0x000074d9
--define_symbol gap_periodic_adv_create_sync=0x00007545
--define_symbol gap_periodic_adv_create_sync_cancel=0x00007569
--define_symbol gap_periodic_adv_term_sync=0x00007575
--define_symbol gap_read_periodic_adv_list_size=0x000075fd
--define_symbol gap_read_phy=0x00007609
--define_symbol gap_read_remote_used_features=0x00007615
--define_symbol gap_read_remote_version=0x00007621
--define_symbol gap_read_rssi=0x0000762d
--define_symbol gap_remove_whitelist=0x00007639
--define_symbol gap_rmv_adv_set=0x000076b5
--define_symbol gap_rmv_dev_from_periodic_list=0x000076c1
--define_symbol gap_rx_test_v2=0x000076d1
--define_symbol gap_set_adv_set_random_addr=0x00007709
--define_symbol gap_set_callback_for_next_hci=0x00007745
--define_symbol gap_set_connection_parameter_range=0x00007765
--define_symbol gap_set_data_length=0x0000777d
--define_symbol gap_set_def_phy=0x00007795
--define_symbol gap_set_ext_adv_data=0x000077a5
--define_symbol gap_set_ext_adv_enable=0x000077bd
--define_symbol gap_set_ext_adv_para=0x00007839
--define_symbol gap_set_ext_scan_enable=0x00007911
--define_symbol gap_set_ext_scan_para=0x00007929
--define_symbol gap_set_ext_scan_response_data=0x000079d1
--define_symbol gap_set_host_channel_classification=0x000079e9
--define_symbol gap_set_periodic_adv_data=0x000079f9
--define_symbol gap_set_periodic_adv_enable=0x00007a69
--define_symbol gap_set_periodic_adv_para=0x00007a79
--define_symbol gap_set_phy=0x00007a91
--define_symbol gap_set_random_device_address=0x00007aad
--define_symbol gap_start_ccm=0x00007add
--define_symbol gap_test_end=0x00007b25
--define_symbol gap_tx_test_v2=0x00007b31
--define_symbol gap_tx_test_v4=0x00007b49
--define_symbol gap_update_connection_parameters=0x00007b6d
--define_symbol gap_vendor_tx_continuous_wave=0x00007bb1
--define_symbol gatt_client_cancel_write=0x000080d9
--define_symbol gatt_client_discover_characteristic_descriptors=0x000080ff
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid128=0x0000813f
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid16=0x0000818f
--define_symbol gatt_client_discover_characteristics_for_service=0x000081df
--define_symbol gatt_client_discover_primary_services=0x00008215
--define_symbol gatt_client_discover_primary_services_by_uuid128=0x00008247
--define_symbol gatt_client_discover_primary_services_by_uuid16=0x0000828b
--define_symbol gatt_client_execute_write=0x000082c7
--define_symbol gatt_client_find_included_services_for_service=0x000082ed
--define_symbol gatt_client_get_mtu=0x0000831b
--define_symbol gatt_client_is_ready=0x000083bd
--define_symbol gatt_client_listen_for_characteristic_value_updates=0x000083d3
--define_symbol gatt_client_prepare_write=0x000083f5
--define_symbol gatt_client_read_characteristic_descriptor_using_descriptor_handle=0x00008431
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle=0x0000845b
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x00008461
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle=0x0000848f
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset=0x00008495
--define_symbol gatt_client_read_multiple_characteristic_values=0x000084c3
--define_symbol gatt_client_read_value_of_characteristic_using_value_handle=0x000084f3
--define_symbol gatt_client_read_value_of_characteristics_by_uuid128=0x00008521
--define_symbol gatt_client_read_value_of_characteristics_by_uuid16=0x0000856d
--define_symbol gatt_client_register_handler=0x000085b9
--define_symbol gatt_client_reliable_write_long_value_of_characteristic=0x000085c5
--define_symbol gatt_client_signed_write_without_response=0x000089f5
--define_symbol gatt_client_write_characteristic_descriptor_using_descriptor_handle=0x00008ab9
--define_symbol gatt_client_write_client_characteristic_configuration=0x00008af3
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle=0x00008b45
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x00008b55
--define_symbol gatt_client_write_long_value_of_characteristic=0x00008b91
--define_symbol gatt_client_write_long_value_of_characteristic_with_offset=0x00008ba1
--define_symbol gatt_client_write_value_of_characteristic=0x00008bdd
--define_symbol gatt_client_write_value_of_characteristic_without_response=0x00008c13
--define_symbol hci_add_event_handler=0x0000a139
--define_symbol hci_power_control=0x0000a8b9
--define_symbol hci_register_acl_packet_handler=0x0000aa6d
--define_symbol kv_commit=0x0000b1c5
--define_symbol kv_get=0x0000b221
--define_symbol kv_init=0x0000b22d
--define_symbol kv_init_backend=0x0000b2ad
--define_symbol kv_put=0x0000b2c1
--define_symbol kv_remove=0x0000b2cd
--define_symbol kv_remove_all=0x0000b301
--define_symbol kv_value_modified=0x0000b331
--define_symbol kv_value_modified_of_key=0x0000b34d
--define_symbol kv_visit=0x0000b359
--define_symbol l2cap_add_event_handler=0x0000b3e9
--define_symbol l2cap_can_send_packet_now=0x0000b3f9
--define_symbol l2cap_create_le_credit_based_connection_request=0x0000b5b5
--define_symbol l2cap_credit_based_send=0x0000b6f9
--define_symbol l2cap_credit_based_send_continue=0x0000b725
--define_symbol l2cap_disconnect=0x0000b7a1
--define_symbol l2cap_get_le_credit_based_connection_credits=0x0000b9f1
--define_symbol l2cap_get_peer_mtu_for_local_cid=0x0000ba0d
--define_symbol l2cap_init=0x0000bde1
--define_symbol l2cap_le_send_flow_control_credit=0x0000bed7
--define_symbol l2cap_max_le_mtu=0x0000c1e1
--define_symbol l2cap_register_packet_handler=0x0000c309
--define_symbol l2cap_register_service=0x0000c315
--define_symbol l2cap_request_can_send_now_event=0x0000c425
--define_symbol l2cap_request_connection_parameter_update=0x0000c43f
--define_symbol l2cap_send_echo_request=0x0000c919
--define_symbol l2cap_unregister_service=0x0000c9d9
--define_symbol le_device_db_add=0x0000ca31
--define_symbol le_device_db_find=0x0000cb09
--define_symbol le_device_db_from_key=0x0000cb35
--define_symbol le_device_db_iter_cur=0x0000cb3d
--define_symbol le_device_db_iter_cur_key=0x0000cb41
--define_symbol le_device_db_iter_init=0x0000cb45
--define_symbol le_device_db_iter_next=0x0000cb4d
--define_symbol le_device_db_remove_key=0x0000cb73
--define_symbol ll_aes_encrypt=0x0000cba1
--define_symbol ll_config=0x0000cc1d
--define_symbol ll_free=0x0000cc53
--define_symbol ll_get_heap_free_size=0x0000cc5d
--define_symbol ll_hint_on_ce_len=0x0000cc71
--define_symbol ll_legacy_adv_set_interval=0x0000cca9
--define_symbol ll_malloc=0x0000ccb9
--define_symbol ll_query_timing_info=0x0000cdf1
--define_symbol ll_register_hci_acl_previewer=0x0000ce3d
--define_symbol ll_scan_set_fixed_channel=0x0000cea1
--define_symbol ll_set_adv_access_address=0x0000d0b9
--define_symbol ll_set_adv_coded_scheme=0x0000d0c5
--define_symbol ll_set_conn_acl_report_latency=0x0000d0f5
--define_symbol ll_set_conn_coded_scheme=0x0000d125
--define_symbol ll_set_conn_latency=0x0000d151
--define_symbol ll_set_conn_tx_power=0x0000d181
--define_symbol ll_set_def_antenna=0x0000d1c9
--define_symbol ll_set_initiating_coded_scheme=0x0000d1e5
--define_symbol ll_set_max_conn_number=0x0000d1f1
--define_symbol nibble_for_char=0x0001d399
--define_symbol platform_32k_rc_auto_tune=0x0001d445
--define_symbol platform_32k_rc_tune=0x0001d4c1
--define_symbol platform_calibrate_32k=0x0001d4d5
--define_symbol platform_config=0x0001d4d9
--define_symbol platform_delete_timer=0x0001d5fd
--define_symbol platform_enable_irq=0x0001d605
--define_symbol platform_get_current_task=0x0001d63d
--define_symbol platform_get_gen_os_driver=0x0001d661
--define_symbol platform_get_heap_status=0x0001d669
--define_symbol platform_get_task_handle=0x0001d681
--define_symbol platform_get_timer_counter=0x0001d6a1
--define_symbol platform_get_us_time=0x0001d6a5
--define_symbol platform_get_version=0x0001d6a9
--define_symbol platform_hrng=0x0001d6b1
--define_symbol platform_install_isr_stack=0x0001d6b9
--define_symbol platform_install_task_stack=0x0001d6c5
--define_symbol platform_patch_rf_init_data=0x0001d6fd
--define_symbol platform_printf=0x0001d709
--define_symbol platform_raise_assertion=0x0001d71d
--define_symbol platform_rand=0x0001d731
--define_symbol platform_read_info=0x0001d735
--define_symbol platform_read_persistent_reg=0x0001d765
--define_symbol platform_reset=0x0001d775
--define_symbol platform_set_abs_timer=0x0001d799
--define_symbol platform_set_evt_callback=0x0001d79d
--define_symbol platform_set_evt_callback_table=0x0001d7b1
--define_symbol platform_set_irq_callback=0x0001d7bd
--define_symbol platform_set_irq_callback_table=0x0001d7d9
--define_symbol platform_set_rf_clk_source=0x0001d7e5
--define_symbol platform_set_rf_init_data=0x0001d7f1
--define_symbol platform_set_rf_power_mapping=0x0001d7fd
--define_symbol platform_set_timer=0x0001d809
--define_symbol platform_shutdown=0x0001d80d
--define_symbol platform_switch_app=0x0001d811
--define_symbol platform_trace_raw=0x0001d83d
--define_symbol platform_write_persistent_reg=0x0001d855
--define_symbol printf_hexdump=0x0001da09
--define_symbol pvPortMalloc=0x0001e4fd
--define_symbol pvTaskIncrementMutexHeldCount=0x0001e5e5
--define_symbol pvTimerGetTimerID=0x0001e5fd
--define_symbol pxPortInitialiseStack=0x0001e629
--define_symbol reverse_128=0x0001e7d1
--define_symbol reverse_24=0x0001e7d7
--define_symbol reverse_256=0x0001e7dd
--define_symbol reverse_48=0x0001e7e3
--define_symbol reverse_56=0x0001e7e9
--define_symbol reverse_64=0x0001e7ef
--define_symbol reverse_bd_addr=0x0001e7f5
--define_symbol reverse_bytes=0x0001e7fb
--define_symbol sm_add_event_handler=0x0001e969
--define_symbol sm_address_resolution_lookup=0x0001eac1
--define_symbol sm_authenticated=0x0001ee3d
--define_symbol sm_authorization_decline=0x0001ee4b
--define_symbol sm_authorization_grant=0x0001ee6b
--define_symbol sm_authorization_state=0x0001ee8b
--define_symbol sm_bonding_decline=0x0001eea5
--define_symbol sm_config=0x0001f301
--define_symbol sm_config_conn=0x0001f319
--define_symbol sm_encryption_key_size=0x0001f4cf
--define_symbol sm_just_works_confirm=0x0001fa55
--define_symbol sm_le_device_key=0x0001fda1
--define_symbol sm_passkey_input=0x0001fe37
--define_symbol sm_private_random_address_generation_get=0x000201f1
--define_symbol sm_private_random_address_generation_get_mode=0x000201f9
--define_symbol sm_private_random_address_generation_set_mode=0x00020205
--define_symbol sm_private_random_address_generation_set_update_period=0x0002022d
--define_symbol sm_register_external_ltk_callback=0x00020369
--define_symbol sm_register_oob_data_callback=0x00020375
--define_symbol sm_request_pairing=0x00020381
--define_symbol sm_send_security_request=0x00020e57
--define_symbol sm_set_accepted_stk_generation_methods=0x00020e7d
--define_symbol sm_set_authentication_requirements=0x00020e89
--define_symbol sm_set_encryption_key_size_range=0x00020e95
--define_symbol sscanf_bd_addr=0x000211f1
--define_symbol sysSetPublicDeviceAddr=0x000215a5
--define_symbol uuid128_to_str=0x00021b85
--define_symbol uuid_add_bluetooth_prefix=0x00021bdd
--define_symbol uuid_has_bluetooth_prefix=0x00021bfd
--define_symbol uxListRemove=0x00021c19
--define_symbol uxQueueMessagesWaiting=0x00021c41
--define_symbol uxQueueMessagesWaitingFromISR=0x00021c69
--define_symbol uxQueueSpacesAvailable=0x00021c85
--define_symbol uxTaskGetStackHighWaterMark=0x00021cb1
--define_symbol uxTaskPriorityGet=0x00021cd1
--define_symbol uxTaskPriorityGetFromISR=0x00021ced
--define_symbol vListInitialise=0x00021da7
--define_symbol vListInitialiseItem=0x00021dbd
--define_symbol vListInsert=0x00021dc3
--define_symbol vListInsertEnd=0x00021df3
--define_symbol vPortEndScheduler=0x00021e0d
--define_symbol vPortEnterCritical=0x00021e39
--define_symbol vPortExitCritical=0x00021e7d
--define_symbol vPortFree=0x00021eb1
--define_symbol vPortSuppressTicksAndSleep=0x00021f45
--define_symbol vPortValidateInterruptPriority=0x0002206d
--define_symbol vQueueDelete=0x000220c9
--define_symbol vQueueWaitForMessageRestricted=0x000220f5
--define_symbol vTaskDelay=0x0002213d
--define_symbol vTaskInternalSetTimeOutState=0x00022189
--define_symbol vTaskMissedYield=0x00022199
--define_symbol vTaskPlaceOnEventList=0x000221a5
--define_symbol vTaskPlaceOnEventListRestricted=0x000221dd
--define_symbol vTaskPriorityDisinheritAfterTimeout=0x0002221d
--define_symbol vTaskPrioritySet=0x000222c9
--define_symbol vTaskResume=0x00022391
--define_symbol vTaskStartScheduler=0x00022415
--define_symbol vTaskStepTick=0x000224a5
--define_symbol vTaskSuspend=0x000224d5
--define_symbol vTaskSuspendAll=0x00022591
--define_symbol vTaskSwitchContext=0x000225a1
--define_symbol xPortStartScheduler=0x00022649
--define_symbol xQueueAddToSet=0x00022711
--define_symbol xQueueCreateCountingSemaphore=0x00022735
--define_symbol xQueueCreateCountingSemaphoreStatic=0x00022771
--define_symbol xQueueCreateMutex=0x000227b5
--define_symbol xQueueCreateMutexStatic=0x000227cb
--define_symbol xQueueCreateSet=0x000227e5
--define_symbol xQueueGenericCreate=0x000227ed
--define_symbol xQueueGenericCreateStatic=0x00022839
--define_symbol xQueueGenericReset=0x000228a1
--define_symbol xQueueGenericSend=0x0002292d
--define_symbol xQueueGenericSendFromISR=0x00022a99
--define_symbol xQueueGiveFromISR=0x00022b59
--define_symbol xQueueGiveMutexRecursive=0x00022bfd
--define_symbol xQueueIsQueueEmptyFromISR=0x00022c3d
--define_symbol xQueueIsQueueFullFromISR=0x00022c61
--define_symbol xQueuePeek=0x00022c89
--define_symbol xQueuePeekFromISR=0x00022db1
--define_symbol xQueueReceive=0x00022e1d
--define_symbol xQueueReceiveFromISR=0x00022f49
--define_symbol xQueueRemoveFromSet=0x00022fdd
--define_symbol xQueueSelectFromSet=0x00022fff
--define_symbol xQueueSelectFromSetFromISR=0x00023011
--define_symbol xQueueSemaphoreTake=0x00023025
--define_symbol xQueueTakeMutexRecursive=0x00023191
--define_symbol xTaskCheckForTimeOut=0x000231d5
--define_symbol xTaskCreate=0x00023245
--define_symbol xTaskCreateStatic=0x000232a1
--define_symbol xTaskGetCurrentTaskHandle=0x00023311
--define_symbol xTaskGetSchedulerState=0x0002331d
--define_symbol xTaskGetTickCount=0x00023339
--define_symbol xTaskGetTickCountFromISR=0x00023345
--define_symbol xTaskIncrementTick=0x00023355
--define_symbol xTaskPriorityDisinherit=0x00023421
--define_symbol xTaskPriorityInherit=0x000234b5
--define_symbol xTaskRemoveFromEventList=0x00023549
--define_symbol xTaskResumeAll=0x000235c9
--define_symbol xTaskResumeFromISR=0x00023691
--define_symbol xTimerCreate=0x0002371d
--define_symbol xTimerCreateStatic=0x00023751
--define_symbol xTimerCreateTimerTask=0x00023789
--define_symbol xTimerGenericCommand=0x000237f5
--define_symbol xTimerGetExpiryTime=0x00023865
--define_symbol xTimerGetTimerDaemonTaskHandle=0x00023885
