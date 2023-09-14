--define_symbol att_dispatch_client_can_send_now=0x00005781
--define_symbol att_dispatch_client_request_can_send_now_event=0x00005787
--define_symbol att_dispatch_register_client=0x0000578d
--define_symbol att_dispatch_register_server=0x000057a1
--define_symbol att_dispatch_server_can_send_now=0x000057b5
--define_symbol att_dispatch_server_request_can_send_now_event=0x000057bb
--define_symbol att_emit_general_event=0x0000586d
--define_symbol att_server_can_send_packet_now=0x00005f9d
--define_symbol att_server_deferred_read_response=0x00005fa1
--define_symbol att_server_get_mtu=0x00005fb9
--define_symbol att_server_indicate=0x00006031
--define_symbol att_server_init=0x000060b5
--define_symbol att_server_notify=0x000060f1
--define_symbol att_server_register_packet_handler=0x00006209
--define_symbol att_server_request_can_send_now_event=0x00006215
--define_symbol att_set_db=0x00006231
--define_symbol att_set_read_callback=0x00006245
--define_symbol att_set_write_callback=0x00006251
--define_symbol bd_addr_cmp=0x000063c1
--define_symbol bd_addr_copy=0x000063c7
--define_symbol bd_addr_to_str=0x000063d1
--define_symbol big_endian_read_16=0x00006409
--define_symbol big_endian_read_32=0x00006411
--define_symbol big_endian_store_16=0x00006425
--define_symbol big_endian_store_32=0x00006431
--define_symbol btstack_config=0x00006569
--define_symbol btstack_memory_pool_create=0x000066b7
--define_symbol btstack_memory_pool_free=0x000066e1
--define_symbol btstack_memory_pool_get=0x00006741
--define_symbol btstack_push_user_msg=0x00006789
--define_symbol btstack_push_user_runnable=0x00006795
--define_symbol char_for_nibble=0x00006a05
--define_symbol gap_add_dev_to_periodic_list=0x000072f9
--define_symbol gap_add_whitelist=0x00007309
--define_symbol gap_aes_encrypt=0x00007315
--define_symbol gap_clear_white_lists=0x0000734d
--define_symbol gap_clr_adv_set=0x00007359
--define_symbol gap_clr_periodic_adv_list=0x00007365
--define_symbol gap_create_connection_cancel=0x00007371
--define_symbol gap_default_periodic_adv_sync_transfer_param=0x0000737d
--define_symbol gap_disconnect=0x00007395
--define_symbol gap_disconnect_all=0x000073c1
--define_symbol gap_ext_create_connection=0x00007401
--define_symbol gap_get_connection_parameter_range=0x000074e1
--define_symbol gap_le_read_channel_map=0x00007519
--define_symbol gap_periodic_adv_create_sync=0x00007585
--define_symbol gap_periodic_adv_create_sync_cancel=0x000075a9
--define_symbol gap_periodic_adv_set_info_transfer=0x000075b5
--define_symbol gap_periodic_adv_sync_transfer=0x000075c5
--define_symbol gap_periodic_adv_sync_transfer_param=0x000075d5
--define_symbol gap_periodic_adv_term_sync=0x000075f1
--define_symbol gap_read_antenna_info=0x00007679
--define_symbol gap_read_periodic_adv_list_size=0x00007685
--define_symbol gap_read_phy=0x00007691
--define_symbol gap_read_remote_used_features=0x0000769d
--define_symbol gap_read_remote_version=0x000076a9
--define_symbol gap_read_rssi=0x000076b5
--define_symbol gap_remove_whitelist=0x000076c1
--define_symbol gap_rmv_adv_set=0x0000773d
--define_symbol gap_rmv_dev_from_periodic_list=0x00007749
--define_symbol gap_rx_test_v2=0x00007759
--define_symbol gap_rx_test_v3=0x00007769
--define_symbol gap_set_adv_set_random_addr=0x000077b5
--define_symbol gap_set_callback_for_next_hci=0x000077f1
--define_symbol gap_set_connection_cte_request_enable=0x00007819
--define_symbol gap_set_connection_cte_response_enable=0x00007835
--define_symbol gap_set_connection_cte_rx_param=0x00007845
--define_symbol gap_set_connection_cte_tx_param=0x000078a1
--define_symbol gap_set_connection_parameter_range=0x000078f5
--define_symbol gap_set_connectionless_cte_tx_enable=0x00007911
--define_symbol gap_set_connectionless_cte_tx_param=0x00007921
--define_symbol gap_set_connectionless_iq_sampling_enable=0x00007981
--define_symbol gap_set_data_length=0x000079e5
--define_symbol gap_set_def_phy=0x000079fd
--define_symbol gap_set_ext_adv_data=0x00007a0d
--define_symbol gap_set_ext_adv_enable=0x00007a25
--define_symbol gap_set_ext_adv_para=0x00007aa1
--define_symbol gap_set_ext_scan_enable=0x00007b79
--define_symbol gap_set_ext_scan_para=0x00007b91
--define_symbol gap_set_ext_scan_response_data=0x00007c39
--define_symbol gap_set_host_channel_classification=0x00007c51
--define_symbol gap_set_periodic_adv_data=0x00007c61
--define_symbol gap_set_periodic_adv_enable=0x00007cd1
--define_symbol gap_set_periodic_adv_para=0x00007ce1
--define_symbol gap_set_periodic_adv_rx_enable=0x00007cf9
--define_symbol gap_set_phy=0x00007d09
--define_symbol gap_set_random_device_address=0x00007d25
--define_symbol gap_start_ccm=0x00007d55
--define_symbol gap_test_end=0x00007d9d
--define_symbol gap_tx_test_v2=0x00007da9
--define_symbol gap_tx_test_v4=0x00007dc1
--define_symbol gap_update_connection_parameters=0x00007de5
--define_symbol gap_vendor_tx_continuous_wave=0x00007e29
--define_symbol gatt_client_cancel_write=0x00008351
--define_symbol gatt_client_discover_characteristic_descriptors=0x00008377
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid128=0x000083b7
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid16=0x00008407
--define_symbol gatt_client_discover_characteristics_for_service=0x00008457
--define_symbol gatt_client_discover_primary_services=0x0000848d
--define_symbol gatt_client_discover_primary_services_by_uuid128=0x000084bf
--define_symbol gatt_client_discover_primary_services_by_uuid16=0x00008503
--define_symbol gatt_client_execute_write=0x0000853f
--define_symbol gatt_client_find_included_services_for_service=0x00008565
--define_symbol gatt_client_get_mtu=0x00008593
--define_symbol gatt_client_is_ready=0x00008635
--define_symbol gatt_client_listen_for_characteristic_value_updates=0x0000864b
--define_symbol gatt_client_prepare_write=0x0000866d
--define_symbol gatt_client_read_characteristic_descriptor_using_descriptor_handle=0x000086a9
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle=0x000086d3
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x000086d9
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle=0x00008707
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset=0x0000870d
--define_symbol gatt_client_read_multiple_characteristic_values=0x0000873b
--define_symbol gatt_client_read_value_of_characteristic_using_value_handle=0x0000876b
--define_symbol gatt_client_read_value_of_characteristics_by_uuid128=0x00008799
--define_symbol gatt_client_read_value_of_characteristics_by_uuid16=0x000087e5
--define_symbol gatt_client_register_handler=0x00008831
--define_symbol gatt_client_reliable_write_long_value_of_characteristic=0x0000883d
--define_symbol gatt_client_signed_write_without_response=0x00008c6d
--define_symbol gatt_client_write_characteristic_descriptor_using_descriptor_handle=0x00008d31
--define_symbol gatt_client_write_client_characteristic_configuration=0x00008d6b
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle=0x00008dbd
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x00008dcd
--define_symbol gatt_client_write_long_value_of_characteristic=0x00008e09
--define_symbol gatt_client_write_long_value_of_characteristic_with_offset=0x00008e19
--define_symbol gatt_client_write_value_of_characteristic=0x00008e55
--define_symbol gatt_client_write_value_of_characteristic_without_response=0x00008e8b
--define_symbol hci_add_event_handler=0x0000a3cd
--define_symbol hci_power_control=0x0000ab55
--define_symbol hci_register_acl_packet_handler=0x0000ad09
--define_symbol kv_commit=0x0000b499
--define_symbol kv_get=0x0000b4f5
--define_symbol kv_init=0x0000b501
--define_symbol kv_init_backend=0x0000b581
--define_symbol kv_put=0x0000b595
--define_symbol kv_remove=0x0000b5a1
--define_symbol kv_remove_all=0x0000b5d5
--define_symbol kv_value_modified=0x0000b605
--define_symbol kv_value_modified_of_key=0x0000b621
--define_symbol kv_visit=0x0000b62d
--define_symbol l2cap_add_event_handler=0x0000b6bd
--define_symbol l2cap_can_send_packet_now=0x0000b6cd
--define_symbol l2cap_create_le_credit_based_connection_request=0x0000b889
--define_symbol l2cap_credit_based_send=0x0000b9cd
--define_symbol l2cap_credit_based_send_continue=0x0000b9f9
--define_symbol l2cap_disconnect=0x0000ba75
--define_symbol l2cap_get_le_credit_based_connection_credits=0x0000bcc5
--define_symbol l2cap_get_peer_mtu_for_local_cid=0x0000bce1
--define_symbol l2cap_init=0x0000c0b5
--define_symbol l2cap_le_send_flow_control_credit=0x0000c1ab
--define_symbol l2cap_max_le_mtu=0x0000c4b5
--define_symbol l2cap_register_packet_handler=0x0000c5dd
--define_symbol l2cap_register_service=0x0000c5e9
--define_symbol l2cap_request_can_send_now_event=0x0000c6f9
--define_symbol l2cap_request_connection_parameter_update=0x0000c713
--define_symbol l2cap_send_echo_request=0x0000cbed
--define_symbol l2cap_unregister_service=0x0000ccad
--define_symbol le_device_db_add=0x0000cd05
--define_symbol le_device_db_find=0x0000cddd
--define_symbol le_device_db_from_key=0x0000ce09
--define_symbol le_device_db_iter_cur=0x0000ce11
--define_symbol le_device_db_iter_cur_key=0x0000ce15
--define_symbol le_device_db_iter_init=0x0000ce19
--define_symbol le_device_db_iter_next=0x0000ce21
--define_symbol le_device_db_remove_key=0x0000ce47
--define_symbol ll_aes_encrypt=0x0000ce75
--define_symbol ll_config=0x0000cef1
--define_symbol ll_free=0x0000cf27
--define_symbol ll_get_heap_free_size=0x0000cf31
--define_symbol ll_hint_on_ce_len=0x0000cf45
--define_symbol ll_legacy_adv_set_interval=0x0000cf7d
--define_symbol ll_malloc=0x0000cf8d
--define_symbol ll_query_timing_info=0x0000d0c5
--define_symbol ll_register_hci_acl_previewer=0x0000d111
--define_symbol ll_scan_set_fixed_channel=0x0000d175
--define_symbol ll_set_adv_access_address=0x0000d38d
--define_symbol ll_set_adv_coded_scheme=0x0000d399
--define_symbol ll_set_conn_acl_report_latency=0x0000d3c9
--define_symbol ll_set_conn_coded_scheme=0x0000d3f9
--define_symbol ll_set_conn_latency=0x0000d425
--define_symbol ll_set_conn_tx_power=0x0000d455
--define_symbol ll_set_def_antenna=0x0000d49d
--define_symbol ll_set_initiating_coded_scheme=0x0000d4b9
--define_symbol ll_set_max_conn_number=0x0000d4c5
--define_symbol nibble_for_char=0x0001e539
--define_symbol platform_32k_rc_auto_tune=0x0001e5d5
--define_symbol platform_32k_rc_tune=0x0001e651
--define_symbol platform_calibrate_32k=0x0001e665
--define_symbol platform_config=0x0001e669
--define_symbol platform_controller_run=0x0001e78d
--define_symbol platform_delete_timer=0x0001e7c1
--define_symbol platform_enable_irq=0x0001e7c9
--define_symbol platform_get_gen_os_driver=0x0001e801
--define_symbol platform_get_task_handle=0x0001e80d
--define_symbol platform_get_timer_counter=0x0001e825
--define_symbol platform_get_us_time=0x0001e829
--define_symbol platform_get_version=0x0001e82d
--define_symbol platform_hrng=0x0001e835
--define_symbol platform_init_controller=0x0001e83d
--define_symbol platform_os_idle_resumed_hook=0x0001e859
--define_symbol platform_patch_rf_init_data=0x0001e85d
--define_symbol platform_post_sleep_processing=0x0001e869
--define_symbol platform_pre_sleep_processing=0x0001e86f
--define_symbol platform_pre_suppress_ticks_and_sleep_processing=0x0001e875
--define_symbol platform_printf=0x0001e879
--define_symbol platform_raise_assertion=0x0001e88d
--define_symbol platform_rand=0x0001e8a1
--define_symbol platform_read_info=0x0001e8a5
--define_symbol platform_read_persistent_reg=0x0001e8d5
--define_symbol platform_reset=0x0001e8e5
--define_symbol platform_set_abs_timer=0x0001e909
--define_symbol platform_set_evt_callback=0x0001e90d
--define_symbol platform_set_evt_callback_table=0x0001e921
--define_symbol platform_set_irq_callback=0x0001e92d
--define_symbol platform_set_irq_callback_table=0x0001e949
--define_symbol platform_set_rf_clk_source=0x0001e955
--define_symbol platform_set_rf_init_data=0x0001e961
--define_symbol platform_set_rf_power_mapping=0x0001e96d
--define_symbol platform_set_timer=0x0001e979
--define_symbol platform_shutdown=0x0001e97d
--define_symbol platform_switch_app=0x0001e981
--define_symbol platform_trace_raw=0x0001e9ad
--define_symbol platform_write_persistent_reg=0x0001e9c5
--define_symbol printf_hexdump=0x0001e9d5
--define_symbol reverse_128=0x0001ed4d
--define_symbol reverse_24=0x0001ed53
--define_symbol reverse_256=0x0001ed59
--define_symbol reverse_48=0x0001ed5f
--define_symbol reverse_56=0x0001ed65
--define_symbol reverse_64=0x0001ed6b
--define_symbol reverse_bd_addr=0x0001ed71
--define_symbol reverse_bytes=0x0001ed77
--define_symbol sm_add_event_handler=0x0001f035
--define_symbol sm_address_resolution_lookup=0x0001f18d
--define_symbol sm_authenticated=0x0001f509
--define_symbol sm_authorization_decline=0x0001f517
--define_symbol sm_authorization_grant=0x0001f537
--define_symbol sm_authorization_state=0x0001f557
--define_symbol sm_bonding_decline=0x0001f571
--define_symbol sm_config=0x0001f9cd
--define_symbol sm_config_conn=0x0001f9e5
--define_symbol sm_encryption_key_size=0x0001fb9b
--define_symbol sm_just_works_confirm=0x00020121
--define_symbol sm_le_device_key=0x0002046d
--define_symbol sm_passkey_input=0x00020503
--define_symbol sm_private_random_address_generation_get=0x000208bd
--define_symbol sm_private_random_address_generation_get_mode=0x000208c5
--define_symbol sm_private_random_address_generation_set_mode=0x000208d1
--define_symbol sm_private_random_address_generation_set_update_period=0x000208f9
--define_symbol sm_register_external_ltk_callback=0x00020a35
--define_symbol sm_register_oob_data_callback=0x00020a41
--define_symbol sm_request_pairing=0x00020a4d
--define_symbol sm_send_security_request=0x00021523
--define_symbol sm_set_accepted_stk_generation_methods=0x00021549
--define_symbol sm_set_authentication_requirements=0x00021555
--define_symbol sm_set_encryption_key_size_range=0x00021561
--define_symbol sscanf_bd_addr=0x000218bd
--define_symbol sysSetPublicDeviceAddr=0x00021c71
--define_symbol uuid128_to_str=0x000223e9
--define_symbol uuid_add_bluetooth_prefix=0x00022441
--define_symbol uuid_has_bluetooth_prefix=0x00022461