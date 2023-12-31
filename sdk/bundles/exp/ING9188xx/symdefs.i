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
--define_symbol char_for_nibble=0x00006b73
--define_symbol eTaskConfirmSleepModeStatus=0x00006e49
--define_symbol gap_add_dev_to_periodic_list=0x00007499
--define_symbol gap_add_whitelist=0x000074a9
--define_symbol gap_aes_encrypt=0x000074b5
--define_symbol gap_clear_white_lists=0x000074ed
--define_symbol gap_clr_adv_set=0x000074f9
--define_symbol gap_clr_periodic_adv_list=0x00007505
--define_symbol gap_create_connection_cancel=0x00007511
--define_symbol gap_default_periodic_adv_sync_transfer_param=0x0000751d
--define_symbol gap_disconnect=0x00007535
--define_symbol gap_disconnect_all=0x00007561
--define_symbol gap_ext_create_connection=0x000075a1
--define_symbol gap_get_connection_parameter_range=0x0000769d
--define_symbol gap_le_read_channel_map=0x000076d9
--define_symbol gap_periodic_adv_create_sync=0x00007745
--define_symbol gap_periodic_adv_create_sync_cancel=0x00007769
--define_symbol gap_periodic_adv_set_info_transfer=0x00007775
--define_symbol gap_periodic_adv_sync_transfer=0x00007785
--define_symbol gap_periodic_adv_sync_transfer_param=0x00007795
--define_symbol gap_periodic_adv_term_sync=0x000077b1
--define_symbol gap_read_antenna_info=0x00007839
--define_symbol gap_read_local_tx_power_level=0x00007851
--define_symbol gap_read_periodic_adv_list_size=0x00007861
--define_symbol gap_read_phy=0x0000786d
--define_symbol gap_read_remote_tx_power_level=0x00007879
--define_symbol gap_read_remote_used_features=0x00007889
--define_symbol gap_read_remote_version=0x00007895
--define_symbol gap_read_rssi=0x000078a1
--define_symbol gap_remove_whitelist=0x000078ad
--define_symbol gap_rmv_adv_set=0x00007929
--define_symbol gap_rmv_dev_from_periodic_list=0x00007935
--define_symbol gap_rx_test_v2=0x00007945
--define_symbol gap_rx_test_v3=0x00007955
--define_symbol gap_set_adv_set_random_addr=0x000079a1
--define_symbol gap_set_callback_for_next_hci=0x000079dd
--define_symbol gap_set_connection_cte_request_enable=0x000079fd
--define_symbol gap_set_connection_cte_response_enable=0x00007a19
--define_symbol gap_set_connection_cte_rx_param=0x00007a29
--define_symbol gap_set_connection_cte_tx_param=0x00007a85
--define_symbol gap_set_connection_parameter_range=0x00007ad9
--define_symbol gap_set_connectionless_cte_tx_enable=0x00007af1
--define_symbol gap_set_connectionless_cte_tx_param=0x00007b01
--define_symbol gap_set_connectionless_iq_sampling_enable=0x00007b61
--define_symbol gap_set_data_length=0x00007bc5
--define_symbol gap_set_def_phy=0x00007bdd
--define_symbol gap_set_default_subrate=0x00007bed
--define_symbol gap_set_ext_adv_data=0x00007c09
--define_symbol gap_set_ext_adv_enable=0x00007c21
--define_symbol gap_set_ext_adv_para=0x00007c9d
--define_symbol gap_set_ext_scan_enable=0x00007d75
--define_symbol gap_set_ext_scan_para=0x00007d8d
--define_symbol gap_set_ext_scan_response_data=0x00007e35
--define_symbol gap_set_host_channel_classification=0x00007e4d
--define_symbol gap_set_path_loss_reporting_enable=0x00007e5d
--define_symbol gap_set_path_loss_reporting_param=0x00007e6d
--define_symbol gap_set_periodic_adv_data=0x00007e89
--define_symbol gap_set_periodic_adv_enable=0x00007ef9
--define_symbol gap_set_periodic_adv_para=0x00007f09
--define_symbol gap_set_periodic_adv_rx_enable=0x00007f21
--define_symbol gap_set_phy=0x00007f31
--define_symbol gap_set_random_device_address=0x00007f4d
--define_symbol gap_set_tx_power_reporting_enable=0x00007f6d
--define_symbol gap_start_ccm=0x00007f8d
--define_symbol gap_subrate_request=0x00007fd5
--define_symbol gap_test_end=0x00007ff1
--define_symbol gap_tx_test_v2=0x00007ffd
--define_symbol gap_tx_test_v4=0x00008015
--define_symbol gap_update_connection_parameters=0x00008039
--define_symbol gap_vendor_tx_continuous_wave=0x0000807d
--define_symbol gatt_client_cancel_write=0x000085a5
--define_symbol gatt_client_discover_characteristic_descriptors=0x000085cb
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid128=0x0000860b
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid16=0x0000865b
--define_symbol gatt_client_discover_characteristics_for_service=0x000086ab
--define_symbol gatt_client_discover_primary_services=0x000086e1
--define_symbol gatt_client_discover_primary_services_by_uuid128=0x00008713
--define_symbol gatt_client_discover_primary_services_by_uuid16=0x00008757
--define_symbol gatt_client_execute_write=0x00008793
--define_symbol gatt_client_find_included_services_for_service=0x000087b9
--define_symbol gatt_client_get_mtu=0x000087e7
--define_symbol gatt_client_is_ready=0x00008889
--define_symbol gatt_client_listen_for_characteristic_value_updates=0x0000889f
--define_symbol gatt_client_prepare_write=0x000088c1
--define_symbol gatt_client_read_characteristic_descriptor_using_descriptor_handle=0x000088fd
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle=0x00008927
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x0000892d
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle=0x0000895b
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset=0x00008961
--define_symbol gatt_client_read_multiple_characteristic_values=0x0000898f
--define_symbol gatt_client_read_value_of_characteristic_using_value_handle=0x000089bf
--define_symbol gatt_client_read_value_of_characteristics_by_uuid128=0x000089ed
--define_symbol gatt_client_read_value_of_characteristics_by_uuid16=0x00008a39
--define_symbol gatt_client_register_handler=0x00008a85
--define_symbol gatt_client_reliable_write_long_value_of_characteristic=0x00008a91
--define_symbol gatt_client_signed_write_without_response=0x00008ec1
--define_symbol gatt_client_write_characteristic_descriptor_using_descriptor_handle=0x00008f85
--define_symbol gatt_client_write_client_characteristic_configuration=0x00008fbf
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle=0x00009011
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x00009021
--define_symbol gatt_client_write_long_value_of_characteristic=0x0000905d
--define_symbol gatt_client_write_long_value_of_characteristic_with_offset=0x0000906d
--define_symbol gatt_client_write_value_of_characteristic=0x000090a9
--define_symbol gatt_client_write_value_of_characteristic_without_response=0x000090df
--define_symbol hci_add_event_handler=0x0000a68d
--define_symbol hci_power_control=0x0000ae21
--define_symbol hci_register_acl_packet_handler=0x0000afd5
--define_symbol kv_commit=0x0000b72d
--define_symbol kv_get=0x0000b789
--define_symbol kv_init=0x0000b795
--define_symbol kv_init_backend=0x0000b815
--define_symbol kv_put=0x0000b829
--define_symbol kv_remove=0x0000b835
--define_symbol kv_remove_all=0x0000b869
--define_symbol kv_value_modified=0x0000b899
--define_symbol kv_value_modified_of_key=0x0000b8b5
--define_symbol kv_visit=0x0000b8c1
--define_symbol l2cap_add_event_handler=0x0000b951
--define_symbol l2cap_can_send_packet_now=0x0000b961
--define_symbol l2cap_create_le_credit_based_connection_request=0x0000bb1d
--define_symbol l2cap_credit_based_send=0x0000bc61
--define_symbol l2cap_credit_based_send_continue=0x0000bc8d
--define_symbol l2cap_disconnect=0x0000bd09
--define_symbol l2cap_get_le_credit_based_connection_credits=0x0000bf59
--define_symbol l2cap_get_peer_mtu_for_local_cid=0x0000bf75
--define_symbol l2cap_init=0x0000c349
--define_symbol l2cap_le_send_flow_control_credit=0x0000c43f
--define_symbol l2cap_max_le_mtu=0x0000c749
--define_symbol l2cap_register_packet_handler=0x0000c871
--define_symbol l2cap_register_service=0x0000c87d
--define_symbol l2cap_request_can_send_now_event=0x0000c98d
--define_symbol l2cap_request_connection_parameter_update=0x0000c9a7
--define_symbol l2cap_send_echo_request=0x0000ce81
--define_symbol l2cap_unregister_service=0x0000cf41
--define_symbol le_device_db_add=0x0000cf99
--define_symbol le_device_db_find=0x0000d071
--define_symbol le_device_db_from_key=0x0000d09d
--define_symbol le_device_db_iter_cur=0x0000d0a5
--define_symbol le_device_db_iter_cur_key=0x0000d0a9
--define_symbol le_device_db_iter_init=0x0000d0ad
--define_symbol le_device_db_iter_next=0x0000d0b5
--define_symbol le_device_db_remove_key=0x0000d0db
--define_symbol ll_ackable_packet_alloc=0x0000d107
--define_symbol ll_ackable_packet_get_status=0x0000d241
--define_symbol ll_ackable_packet_run=0x0000d2b1
--define_symbol ll_ackable_packet_set_tx_data=0x0000d355
--define_symbol ll_adjust_conn_peer_tx_power=0x0000d37d
--define_symbol ll_aes_encrypt=0x0000d3a9
--define_symbol ll_channel_monitor_alloc=0x0000d425
--define_symbol ll_channel_monitor_check_each_pdu=0x0000d4a7
--define_symbol ll_channel_monitor_run=0x0000d50d
--define_symbol ll_config=0x0000d5c1
--define_symbol ll_dhkey_generated=0x0000d815
--define_symbol ll_free=0x0000d849
--define_symbol ll_get_conn_events_info=0x0000d855
--define_symbol ll_get_conn_info=0x0000d939
--define_symbol ll_get_heap_free_size=0x0000d985
--define_symbol ll_hint_on_ce_len=0x0000d999
--define_symbol ll_install_ecc_engine=0x0000d9d1
--define_symbol ll_legacy_adv_set_interval=0x0000d9dd
--define_symbol ll_lock_frequency=0x0000d9ed
--define_symbol ll_malloc=0x0000da51
--define_symbol ll_p256_key_pair_generated=0x0000da59
--define_symbol ll_raw_packet_alloc=0x0000dc0d
--define_symbol ll_raw_packet_free=0x0000dce1
--define_symbol ll_raw_packet_get_bare_rx_data=0x0000dd19
--define_symbol ll_raw_packet_get_iq_samples=0x0000dddf
--define_symbol ll_raw_packet_get_rx_data=0x0000de79
--define_symbol ll_raw_packet_recv=0x0000df19
--define_symbol ll_raw_packet_send=0x0000dfd5
--define_symbol ll_raw_packet_set_bare_data=0x0000e0bd
--define_symbol ll_raw_packet_set_bare_mode=0x0000e0fb
--define_symbol ll_raw_packet_set_fake_cte_info=0x0000e201
--define_symbol ll_raw_packet_set_param=0x0000e223
--define_symbol ll_raw_packet_set_rx_cte=0x0000e281
--define_symbol ll_raw_packet_set_tx_cte=0x0000e317
--define_symbol ll_raw_packet_set_tx_data=0x0000e355
--define_symbol ll_register_hci_acl_previewer=0x0000e3b9
--define_symbol ll_scan_set_fixed_channel=0x0000e41d
--define_symbol ll_scanner_enable_iq_sampling=0x0000e429
--define_symbol ll_set_adv_access_address=0x0000e6dd
--define_symbol ll_set_adv_coded_scheme=0x0000e6e9
--define_symbol ll_set_conn_acl_report_latency=0x0000e719
--define_symbol ll_set_conn_coded_scheme=0x0000e749
--define_symbol ll_set_conn_interval_unit=0x0000e775
--define_symbol ll_set_conn_latency=0x0000e781
--define_symbol ll_set_conn_tx_power=0x0000e7b1
--define_symbol ll_set_def_antenna=0x0000e7ed
--define_symbol ll_set_initiating_coded_scheme=0x0000e809
--define_symbol ll_set_max_conn_number=0x0000e815
--define_symbol ll_set_tx_power_range=0x0000e8a9
--define_symbol ll_unlock_frequency=0x0000e8d1
--define_symbol nibble_for_char=0x00021235
--define_symbol platform_32k_rc_auto_tune=0x000212e5
--define_symbol platform_32k_rc_tune=0x00021361
--define_symbol platform_calibrate_32k=0x00021375
--define_symbol platform_config=0x00021379
--define_symbol platform_delete_timer=0x0002149d
--define_symbol platform_enable_irq=0x000214a5
--define_symbol platform_get_current_task=0x000214dd
--define_symbol platform_get_gen_os_driver=0x00021501
--define_symbol platform_get_heap_status=0x00021509
--define_symbol platform_get_task_handle=0x00021521
--define_symbol platform_get_timer_counter=0x00021541
--define_symbol platform_get_us_time=0x00021545
--define_symbol platform_get_version=0x00021549
--define_symbol platform_hrng=0x00021551
--define_symbol platform_install_isr_stack=0x00021559
--define_symbol platform_install_task_stack=0x00021565
--define_symbol platform_patch_rf_init_data=0x0002159d
--define_symbol platform_printf=0x000215a9
--define_symbol platform_raise_assertion=0x000215bd
--define_symbol platform_rand=0x000215d1
--define_symbol platform_read_info=0x000215d5
--define_symbol platform_read_persistent_reg=0x00021605
--define_symbol platform_reset=0x00021615
--define_symbol platform_set_abs_timer=0x00021639
--define_symbol platform_set_evt_callback=0x0002163d
--define_symbol platform_set_evt_callback_table=0x00021651
--define_symbol platform_set_irq_callback=0x0002165d
--define_symbol platform_set_irq_callback_table=0x00021679
--define_symbol platform_set_rf_clk_source=0x00021685
--define_symbol platform_set_rf_init_data=0x00021691
--define_symbol platform_set_rf_power_mapping=0x0002169d
--define_symbol platform_set_timer=0x000216a9
--define_symbol platform_shutdown=0x000216ad
--define_symbol platform_switch_app=0x000216b1
--define_symbol platform_trace_raw=0x000216dd
--define_symbol platform_write_persistent_reg=0x000216f5
--define_symbol printf_hexdump=0x000218a9
--define_symbol pvPortMalloc=0x0002239d
--define_symbol pvTaskIncrementMutexHeldCount=0x00022485
--define_symbol pvTimerGetTimerID=0x0002249d
--define_symbol pxPortInitialiseStack=0x000224c9
--define_symbol reverse_128=0x000226a9
--define_symbol reverse_24=0x000226af
--define_symbol reverse_256=0x000226b5
--define_symbol reverse_48=0x000226bb
--define_symbol reverse_56=0x000226c1
--define_symbol reverse_64=0x000226c7
--define_symbol reverse_bd_addr=0x000226cd
--define_symbol reverse_bytes=0x000226d3
--define_symbol sm_add_event_handler=0x000229e1
--define_symbol sm_address_resolution_lookup=0x00022b39
--define_symbol sm_authenticated=0x00022eb5
--define_symbol sm_authorization_decline=0x00022ec3
--define_symbol sm_authorization_grant=0x00022ee3
--define_symbol sm_authorization_state=0x00022f03
--define_symbol sm_bonding_decline=0x00022f1d
--define_symbol sm_config=0x00023379
--define_symbol sm_config_conn=0x00023391
--define_symbol sm_encryption_key_size=0x00023547
--define_symbol sm_just_works_confirm=0x00023acd
--define_symbol sm_le_device_key=0x00023e19
--define_symbol sm_passkey_input=0x00023eaf
--define_symbol sm_private_random_address_generation_get=0x00024269
--define_symbol sm_private_random_address_generation_get_mode=0x00024271
--define_symbol sm_private_random_address_generation_set_mode=0x0002427d
--define_symbol sm_private_random_address_generation_set_update_period=0x000242a5
--define_symbol sm_register_external_ltk_callback=0x000243e1
--define_symbol sm_register_oob_data_callback=0x000243ed
--define_symbol sm_request_pairing=0x000243f9
--define_symbol sm_send_security_request=0x00024ecf
--define_symbol sm_set_accepted_stk_generation_methods=0x00024ef5
--define_symbol sm_set_authentication_requirements=0x00024f01
--define_symbol sm_set_encryption_key_size_range=0x00024f0d
--define_symbol sscanf_bd_addr=0x000252dd
--define_symbol sysSetPublicDeviceAddr=0x00025691
--define_symbol uuid128_to_str=0x00025e2d
--define_symbol uuid_add_bluetooth_prefix=0x00025e85
--define_symbol uuid_has_bluetooth_prefix=0x00025ea5
--define_symbol uxListRemove=0x00025ec1
--define_symbol uxQueueMessagesWaiting=0x00025ee9
--define_symbol uxQueueMessagesWaitingFromISR=0x00025f11
--define_symbol uxQueueSpacesAvailable=0x00025f2d
--define_symbol uxTaskGetStackHighWaterMark=0x00025f59
--define_symbol uxTaskPriorityGet=0x00025f79
--define_symbol uxTaskPriorityGetFromISR=0x00025f95
--define_symbol vListInitialise=0x0002604f
--define_symbol vListInitialiseItem=0x00026065
--define_symbol vListInsert=0x0002606b
--define_symbol vListInsertEnd=0x0002609b
--define_symbol vPortEndScheduler=0x000260b5
--define_symbol vPortEnterCritical=0x000260e1
--define_symbol vPortExitCritical=0x00026125
--define_symbol vPortFree=0x00026159
--define_symbol vPortSuppressTicksAndSleep=0x000261ed
--define_symbol vPortValidateInterruptPriority=0x00026315
--define_symbol vQueueDelete=0x00026371
--define_symbol vQueueWaitForMessageRestricted=0x0002639d
--define_symbol vTaskDelay=0x000263e5
--define_symbol vTaskInternalSetTimeOutState=0x00026431
--define_symbol vTaskMissedYield=0x00026441
--define_symbol vTaskPlaceOnEventList=0x0002644d
--define_symbol vTaskPlaceOnEventListRestricted=0x00026485
--define_symbol vTaskPriorityDisinheritAfterTimeout=0x000264c5
--define_symbol vTaskPrioritySet=0x00026571
--define_symbol vTaskResume=0x00026639
--define_symbol vTaskStartScheduler=0x000266bd
--define_symbol vTaskStepTick=0x0002674d
--define_symbol vTaskSuspend=0x0002677d
--define_symbol vTaskSuspendAll=0x00026839
--define_symbol vTaskSwitchContext=0x00026849
--define_symbol xPortStartScheduler=0x000268f1
--define_symbol xQueueAddToSet=0x000269b9
--define_symbol xQueueCreateCountingSemaphore=0x000269dd
--define_symbol xQueueCreateCountingSemaphoreStatic=0x00026a19
--define_symbol xQueueCreateMutex=0x00026a5d
--define_symbol xQueueCreateMutexStatic=0x00026a73
--define_symbol xQueueCreateSet=0x00026a8d
--define_symbol xQueueGenericCreate=0x00026a95
--define_symbol xQueueGenericCreateStatic=0x00026ae1
--define_symbol xQueueGenericReset=0x00026b49
--define_symbol xQueueGenericSend=0x00026bd5
--define_symbol xQueueGenericSendFromISR=0x00026d41
--define_symbol xQueueGiveFromISR=0x00026e01
--define_symbol xQueueGiveMutexRecursive=0x00026ea5
--define_symbol xQueueIsQueueEmptyFromISR=0x00026ee5
--define_symbol xQueueIsQueueFullFromISR=0x00026f09
--define_symbol xQueuePeek=0x00026f31
--define_symbol xQueuePeekFromISR=0x00027059
--define_symbol xQueueReceive=0x000270c5
--define_symbol xQueueReceiveFromISR=0x000271f1
--define_symbol xQueueRemoveFromSet=0x00027285
--define_symbol xQueueSelectFromSet=0x000272a7
--define_symbol xQueueSelectFromSetFromISR=0x000272b9
--define_symbol xQueueSemaphoreTake=0x000272cd
--define_symbol xQueueTakeMutexRecursive=0x00027439
--define_symbol xTaskCheckForTimeOut=0x0002747d
--define_symbol xTaskCreate=0x000274ed
--define_symbol xTaskCreateStatic=0x00027549
--define_symbol xTaskGetCurrentTaskHandle=0x000275b9
--define_symbol xTaskGetSchedulerState=0x000275c5
--define_symbol xTaskGetTickCount=0x000275e1
--define_symbol xTaskGetTickCountFromISR=0x000275ed
--define_symbol xTaskIncrementTick=0x000275fd
--define_symbol xTaskPriorityDisinherit=0x000276c9
--define_symbol xTaskPriorityInherit=0x0002775d
--define_symbol xTaskRemoveFromEventList=0x000277f1
--define_symbol xTaskResumeAll=0x00027871
--define_symbol xTaskResumeFromISR=0x00027939
--define_symbol xTimerCreate=0x000279c5
--define_symbol xTimerCreateStatic=0x000279f9
--define_symbol xTimerCreateTimerTask=0x00027a31
--define_symbol xTimerGenericCommand=0x00027a9d
--define_symbol xTimerGetExpiryTime=0x00027b0d
--define_symbol xTimerGetTimerDaemonTaskHandle=0x00027b2d
