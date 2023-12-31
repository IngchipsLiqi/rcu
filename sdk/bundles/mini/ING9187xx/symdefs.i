--define_symbol att_dispatch_client_can_send_now=0x00005749
--define_symbol att_dispatch_client_request_can_send_now_event=0x0000574f
--define_symbol att_dispatch_register_client=0x00005755
--define_symbol att_dispatch_register_server=0x00005769
--define_symbol att_dispatch_server_can_send_now=0x0000577d
--define_symbol att_dispatch_server_request_can_send_now_event=0x00005783
--define_symbol att_emit_general_event=0x00005835
--define_symbol att_server_can_send_packet_now=0x00005f61
--define_symbol att_server_deferred_read_response=0x00005f65
--define_symbol att_server_get_mtu=0x00005f7d
--define_symbol att_server_indicate=0x00005fe9
--define_symbol att_server_init=0x0000606d
--define_symbol att_server_notify=0x000060a9
--define_symbol att_server_register_packet_handler=0x000061c1
--define_symbol att_server_request_can_send_now_event=0x000061cd
--define_symbol att_set_db=0x000061e9
--define_symbol att_set_read_callback=0x000061fd
--define_symbol att_set_write_callback=0x00006209
--define_symbol bd_addr_cmp=0x00006379
--define_symbol bd_addr_copy=0x0000637f
--define_symbol bd_addr_to_str=0x00006389
--define_symbol big_endian_read_16=0x000063c1
--define_symbol big_endian_read_32=0x000063c9
--define_symbol big_endian_store_16=0x000063dd
--define_symbol big_endian_store_32=0x000063e9
--define_symbol btstack_config=0x0000653d
--define_symbol btstack_memory_pool_create=0x0000667b
--define_symbol btstack_memory_pool_free=0x000066a5
--define_symbol btstack_memory_pool_get=0x00006705
--define_symbol btstack_push_user_msg=0x0000676d
--define_symbol btstack_push_user_runnable=0x00006779
--define_symbol char_for_nibble=0x00006a01
--define_symbol eTaskConfirmSleepModeStatus=0x00006cd1
--define_symbol gap_add_dev_to_periodic_list=0x000072ad
--define_symbol gap_add_whitelist=0x000072bd
--define_symbol gap_aes_encrypt=0x000072c9
--define_symbol gap_clear_white_lists=0x00007301
--define_symbol gap_clr_adv_set=0x0000730d
--define_symbol gap_clr_periodic_adv_list=0x00007319
--define_symbol gap_create_connection_cancel=0x00007325
--define_symbol gap_disconnect=0x00007331
--define_symbol gap_disconnect_all=0x0000735d
--define_symbol gap_ext_create_connection=0x0000739d
--define_symbol gap_get_connection_parameter_range=0x0000747d
--define_symbol gap_le_read_channel_map=0x000074b5
--define_symbol gap_periodic_adv_create_sync=0x00007521
--define_symbol gap_periodic_adv_create_sync_cancel=0x00007545
--define_symbol gap_periodic_adv_term_sync=0x00007551
--define_symbol gap_read_periodic_adv_list_size=0x000075d9
--define_symbol gap_read_phy=0x000075e5
--define_symbol gap_read_remote_used_features=0x000075f1
--define_symbol gap_read_remote_version=0x000075fd
--define_symbol gap_read_rssi=0x00007609
--define_symbol gap_remove_whitelist=0x00007615
--define_symbol gap_rmv_adv_set=0x00007691
--define_symbol gap_rmv_dev_from_periodic_list=0x0000769d
--define_symbol gap_rx_test_v2=0x000076ad
--define_symbol gap_set_adv_set_random_addr=0x000076e5
--define_symbol gap_set_callback_for_next_hci=0x00007721
--define_symbol gap_set_connection_parameter_range=0x00007741
--define_symbol gap_set_data_length=0x00007759
--define_symbol gap_set_def_phy=0x00007771
--define_symbol gap_set_ext_adv_data=0x00007781
--define_symbol gap_set_ext_adv_enable=0x00007799
--define_symbol gap_set_ext_adv_para=0x00007815
--define_symbol gap_set_ext_scan_enable=0x000078ed
--define_symbol gap_set_ext_scan_para=0x00007905
--define_symbol gap_set_ext_scan_response_data=0x000079ad
--define_symbol gap_set_host_channel_classification=0x000079c5
--define_symbol gap_set_periodic_adv_data=0x000079d5
--define_symbol gap_set_periodic_adv_enable=0x00007a45
--define_symbol gap_set_periodic_adv_para=0x00007a55
--define_symbol gap_set_phy=0x00007a6d
--define_symbol gap_set_random_device_address=0x00007a89
--define_symbol gap_start_ccm=0x00007ab9
--define_symbol gap_test_end=0x00007b01
--define_symbol gap_tx_test_v2=0x00007b0d
--define_symbol gap_tx_test_v4=0x00007b25
--define_symbol gap_update_connection_parameters=0x00007b49
--define_symbol gap_vendor_tx_continuous_wave=0x00007b89
--define_symbol gatt_client_cancel_write=0x000080b1
--define_symbol gatt_client_discover_characteristic_descriptors=0x000080d7
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid128=0x00008117
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid16=0x00008167
--define_symbol gatt_client_discover_characteristics_for_service=0x000081b7
--define_symbol gatt_client_discover_primary_services=0x000081ed
--define_symbol gatt_client_discover_primary_services_by_uuid128=0x0000821f
--define_symbol gatt_client_discover_primary_services_by_uuid16=0x00008263
--define_symbol gatt_client_execute_write=0x0000829f
--define_symbol gatt_client_find_included_services_for_service=0x000082c5
--define_symbol gatt_client_get_mtu=0x000082f3
--define_symbol gatt_client_is_ready=0x00008391
--define_symbol gatt_client_listen_for_characteristic_value_updates=0x000083a7
--define_symbol gatt_client_prepare_write=0x000083c7
--define_symbol gatt_client_read_characteristic_descriptor_using_descriptor_handle=0x00008403
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle=0x0000842d
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x00008433
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle=0x00008461
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset=0x00008467
--define_symbol gatt_client_read_multiple_characteristic_values=0x00008495
--define_symbol gatt_client_read_value_of_characteristic_using_value_handle=0x000084c5
--define_symbol gatt_client_read_value_of_characteristics_by_uuid128=0x000084f3
--define_symbol gatt_client_read_value_of_characteristics_by_uuid16=0x0000853f
--define_symbol gatt_client_register_handler=0x00008589
--define_symbol gatt_client_reliable_write_long_value_of_characteristic=0x00008595
--define_symbol gatt_client_signed_write_without_response=0x00008999
--define_symbol gatt_client_write_characteristic_descriptor_using_descriptor_handle=0x00008a5d
--define_symbol gatt_client_write_client_characteristic_configuration=0x00008a97
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle=0x00008ae9
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x00008af9
--define_symbol gatt_client_write_long_value_of_characteristic=0x00008b35
--define_symbol gatt_client_write_long_value_of_characteristic_with_offset=0x00008b45
--define_symbol gatt_client_write_value_of_characteristic=0x00008b81
--define_symbol gatt_client_write_value_of_characteristic_without_response=0x00008bb7
--define_symbol hci_add_event_handler=0x0000a0d1
--define_symbol hci_power_control=0x0000a83d
--define_symbol hci_register_acl_packet_handler=0x0000a9f1
--define_symbol kv_commit=0x0000b13d
--define_symbol kv_get=0x0000b199
--define_symbol kv_init=0x0000b1a5
--define_symbol kv_init_backend=0x0000b221
--define_symbol kv_put=0x0000b235
--define_symbol kv_remove=0x0000b241
--define_symbol kv_remove_all=0x0000b275
--define_symbol kv_value_modified=0x0000b2a5
--define_symbol kv_value_modified_of_key=0x0000b2c1
--define_symbol kv_visit=0x0000b2cd
--define_symbol l2cap_add_event_handler=0x0000b35d
--define_symbol l2cap_can_send_packet_now=0x0000b36d
--define_symbol l2cap_create_le_credit_based_connection_request=0x0000b529
--define_symbol l2cap_credit_based_send=0x0000b66d
--define_symbol l2cap_credit_based_send_continue=0x0000b699
--define_symbol l2cap_disconnect=0x0000b715
--define_symbol l2cap_get_le_credit_based_connection_credits=0x0000b965
--define_symbol l2cap_get_peer_mtu_for_local_cid=0x0000b981
--define_symbol l2cap_init=0x0000bd55
--define_symbol l2cap_le_send_flow_control_credit=0x0000be4b
--define_symbol l2cap_max_le_mtu=0x0000c155
--define_symbol l2cap_register_packet_handler=0x0000c27d
--define_symbol l2cap_register_service=0x0000c289
--define_symbol l2cap_request_can_send_now_event=0x0000c399
--define_symbol l2cap_request_connection_parameter_update=0x0000c3b3
--define_symbol l2cap_send_echo_request=0x0000c88d
--define_symbol l2cap_unregister_service=0x0000c94d
--define_symbol le_device_db_add=0x0000c9a5
--define_symbol le_device_db_find=0x0000ca6d
--define_symbol le_device_db_from_key=0x0000ca99
--define_symbol le_device_db_iter_cur=0x0000caa1
--define_symbol le_device_db_iter_cur_key=0x0000caa5
--define_symbol le_device_db_iter_init=0x0000caa9
--define_symbol le_device_db_iter_next=0x0000cab1
--define_symbol le_device_db_remove_key=0x0000cad7
--define_symbol ll_aes_encrypt=0x0000cb05
--define_symbol ll_config=0x0000cb81
--define_symbol ll_free=0x0000cbb7
--define_symbol ll_get_heap_free_size=0x0000cbc1
--define_symbol ll_hint_on_ce_len=0x0000cbd5
--define_symbol ll_legacy_adv_set_interval=0x0000cc0d
--define_symbol ll_malloc=0x0000cc1d
--define_symbol ll_query_timing_info=0x0000cd55
--define_symbol ll_register_hci_acl_previewer=0x0000cda1
--define_symbol ll_scan_set_fixed_channel=0x0000ce05
--define_symbol ll_set_adv_access_address=0x0000d01d
--define_symbol ll_set_adv_coded_scheme=0x0000d029
--define_symbol ll_set_conn_acl_report_latency=0x0000d051
--define_symbol ll_set_conn_coded_scheme=0x0000d07d
--define_symbol ll_set_conn_latency=0x0000d0a5
--define_symbol ll_set_conn_tx_power=0x0000d0d1
--define_symbol ll_set_def_antenna=0x0000d115
--define_symbol ll_set_initiating_coded_scheme=0x0000d131
--define_symbol ll_set_max_conn_number=0x0000d13d
--define_symbol nibble_for_char=0x0001d1d1
--define_symbol platform_32k_rc_auto_tune=0x0001d271
--define_symbol platform_32k_rc_tune=0x0001d2ed
--define_symbol platform_calibrate_32k=0x0001d301
--define_symbol platform_config=0x0001d305
--define_symbol platform_delete_timer=0x0001d429
--define_symbol platform_enable_irq=0x0001d431
--define_symbol platform_get_current_task=0x0001d469
--define_symbol platform_get_gen_os_driver=0x0001d48d
--define_symbol platform_get_heap_status=0x0001d495
--define_symbol platform_get_task_handle=0x0001d4ad
--define_symbol platform_get_timer_counter=0x0001d4cd
--define_symbol platform_get_us_time=0x0001d4d1
--define_symbol platform_get_version=0x0001d4d5
--define_symbol platform_hrng=0x0001d4dd
--define_symbol platform_install_isr_stack=0x0001d4e5
--define_symbol platform_install_task_stack=0x0001d4f1
--define_symbol platform_patch_rf_init_data=0x0001d529
--define_symbol platform_printf=0x0001d535
--define_symbol platform_raise_assertion=0x0001d549
--define_symbol platform_rand=0x0001d55d
--define_symbol platform_read_info=0x0001d561
--define_symbol platform_read_persistent_reg=0x0001d591
--define_symbol platform_reset=0x0001d5a1
--define_symbol platform_set_abs_timer=0x0001d5c5
--define_symbol platform_set_evt_callback=0x0001d5c9
--define_symbol platform_set_evt_callback_table=0x0001d5dd
--define_symbol platform_set_irq_callback=0x0001d5e9
--define_symbol platform_set_irq_callback_table=0x0001d605
--define_symbol platform_set_rf_clk_source=0x0001d611
--define_symbol platform_set_rf_init_data=0x0001d61d
--define_symbol platform_set_rf_power_mapping=0x0001d629
--define_symbol platform_set_timer=0x0001d635
--define_symbol platform_shutdown=0x0001d639
--define_symbol platform_switch_app=0x0001d63d
--define_symbol platform_trace_raw=0x0001d669
--define_symbol platform_write_persistent_reg=0x0001d681
--define_symbol printf_hexdump=0x0001d835
--define_symbol pvPortMalloc=0x0001e321
--define_symbol pvTaskIncrementMutexHeldCount=0x0001e409
--define_symbol pvTimerGetTimerID=0x0001e421
--define_symbol pxPortInitialiseStack=0x0001e44d
--define_symbol reverse_128=0x0001e5f5
--define_symbol reverse_24=0x0001e5fb
--define_symbol reverse_256=0x0001e601
--define_symbol reverse_48=0x0001e607
--define_symbol reverse_56=0x0001e60d
--define_symbol reverse_64=0x0001e613
--define_symbol reverse_bd_addr=0x0001e619
--define_symbol reverse_bytes=0x0001e61f
--define_symbol sm_add_event_handler=0x0001e78d
--define_symbol sm_address_resolution_lookup=0x0001e8e5
--define_symbol sm_authenticated=0x0001ec61
--define_symbol sm_authorization_decline=0x0001ec6f
--define_symbol sm_authorization_grant=0x0001ec8f
--define_symbol sm_authorization_state=0x0001ecaf
--define_symbol sm_bonding_decline=0x0001ecc9
--define_symbol sm_config=0x0001f125
--define_symbol sm_config_conn=0x0001f13d
--define_symbol sm_encryption_key_size=0x0001f2f3
--define_symbol sm_just_works_confirm=0x0001f879
--define_symbol sm_le_device_key=0x0001fbc5
--define_symbol sm_passkey_input=0x0001fc5b
--define_symbol sm_private_random_address_generation_get=0x00020015
--define_symbol sm_private_random_address_generation_get_mode=0x0002001d
--define_symbol sm_private_random_address_generation_set_mode=0x00020029
--define_symbol sm_private_random_address_generation_set_update_period=0x00020051
--define_symbol sm_register_external_ltk_callback=0x0002018d
--define_symbol sm_register_oob_data_callback=0x00020199
--define_symbol sm_request_pairing=0x000201a5
--define_symbol sm_send_security_request=0x00020c7b
--define_symbol sm_set_accepted_stk_generation_methods=0x00020ca1
--define_symbol sm_set_authentication_requirements=0x00020cad
--define_symbol sm_set_encryption_key_size_range=0x00020cb9
--define_symbol sscanf_bd_addr=0x00021015
--define_symbol sysSetPublicDeviceAddr=0x000213c9
--define_symbol uuid128_to_str=0x000219a9
--define_symbol uuid_add_bluetooth_prefix=0x00021a01
--define_symbol uuid_has_bluetooth_prefix=0x00021a21
--define_symbol uxListRemove=0x00021a3d
--define_symbol uxQueueMessagesWaiting=0x00021a65
--define_symbol uxQueueMessagesWaitingFromISR=0x00021a8d
--define_symbol uxQueueSpacesAvailable=0x00021aa9
--define_symbol uxTaskGetStackHighWaterMark=0x00021ad5
--define_symbol uxTaskPriorityGet=0x00021af5
--define_symbol uxTaskPriorityGetFromISR=0x00021b11
--define_symbol vListInitialise=0x00021bcb
--define_symbol vListInitialiseItem=0x00021be1
--define_symbol vListInsert=0x00021be7
--define_symbol vListInsertEnd=0x00021c17
--define_symbol vPortEndScheduler=0x00021c31
--define_symbol vPortEnterCritical=0x00021c5d
--define_symbol vPortExitCritical=0x00021ca1
--define_symbol vPortFree=0x00021cd5
--define_symbol vPortSuppressTicksAndSleep=0x00021d69
--define_symbol vPortValidateInterruptPriority=0x00021e91
--define_symbol vQueueDelete=0x00021eed
--define_symbol vQueueWaitForMessageRestricted=0x00021f19
--define_symbol vTaskDelay=0x00021f61
--define_symbol vTaskInternalSetTimeOutState=0x00021fad
--define_symbol vTaskMissedYield=0x00021fbd
--define_symbol vTaskPlaceOnEventList=0x00021fc9
--define_symbol vTaskPlaceOnEventListRestricted=0x00022001
--define_symbol vTaskPriorityDisinheritAfterTimeout=0x00022041
--define_symbol vTaskPrioritySet=0x000220ed
--define_symbol vTaskResume=0x000221b5
--define_symbol vTaskStartScheduler=0x00022239
--define_symbol vTaskStepTick=0x000222c9
--define_symbol vTaskSuspend=0x000222f9
--define_symbol vTaskSuspendAll=0x000223b5
--define_symbol vTaskSwitchContext=0x000223c5
--define_symbol xPortStartScheduler=0x00022469
--define_symbol xQueueAddToSet=0x00022531
--define_symbol xQueueCreateCountingSemaphore=0x00022555
--define_symbol xQueueCreateCountingSemaphoreStatic=0x00022591
--define_symbol xQueueCreateMutex=0x000225d5
--define_symbol xQueueCreateMutexStatic=0x000225eb
--define_symbol xQueueCreateSet=0x00022605
--define_symbol xQueueGenericCreate=0x0002260d
--define_symbol xQueueGenericCreateStatic=0x00022659
--define_symbol xQueueGenericReset=0x000226c1
--define_symbol xQueueGenericSend=0x0002274d
--define_symbol xQueueGenericSendFromISR=0x000228b9
--define_symbol xQueueGiveFromISR=0x00022979
--define_symbol xQueueGiveMutexRecursive=0x00022a1d
--define_symbol xQueueIsQueueEmptyFromISR=0x00022a5d
--define_symbol xQueueIsQueueFullFromISR=0x00022a81
--define_symbol xQueuePeek=0x00022aa9
--define_symbol xQueuePeekFromISR=0x00022bd1
--define_symbol xQueueReceive=0x00022c3d
--define_symbol xQueueReceiveFromISR=0x00022d69
--define_symbol xQueueRemoveFromSet=0x00022dfd
--define_symbol xQueueSelectFromSet=0x00022e1f
--define_symbol xQueueSelectFromSetFromISR=0x00022e31
--define_symbol xQueueSemaphoreTake=0x00022e45
--define_symbol xQueueTakeMutexRecursive=0x00022fb1
--define_symbol xTaskCheckForTimeOut=0x00022ff5
--define_symbol xTaskCreate=0x00023065
--define_symbol xTaskCreateStatic=0x000230c1
--define_symbol xTaskGetCurrentTaskHandle=0x00023131
--define_symbol xTaskGetSchedulerState=0x0002313d
--define_symbol xTaskGetTickCount=0x00023159
--define_symbol xTaskGetTickCountFromISR=0x00023165
--define_symbol xTaskIncrementTick=0x00023175
--define_symbol xTaskPriorityDisinherit=0x00023241
--define_symbol xTaskPriorityInherit=0x000232d5
--define_symbol xTaskRemoveFromEventList=0x00023369
--define_symbol xTaskResumeAll=0x000233e9
--define_symbol xTaskResumeFromISR=0x000234b1
--define_symbol xTimerCreate=0x0002353d
--define_symbol xTimerCreateStatic=0x00023571
--define_symbol xTimerCreateTimerTask=0x000235a9
--define_symbol xTimerGenericCommand=0x00023615
--define_symbol xTimerGetExpiryTime=0x00023685
--define_symbol xTimerGetTimerDaemonTaskHandle=0x000236a5
