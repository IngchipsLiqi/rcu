--define_symbol att_dispatch_client_can_send_now=0x0000565d
--define_symbol att_dispatch_client_request_can_send_now_event=0x00005663
--define_symbol att_dispatch_register_client=0x00005669
--define_symbol att_dispatch_register_server=0x0000567d
--define_symbol att_dispatch_server_can_send_now=0x00005691
--define_symbol att_dispatch_server_request_can_send_now_event=0x00005697
--define_symbol att_emit_general_event=0x00005749
--define_symbol att_server_can_send_packet_now=0x00005e79
--define_symbol att_server_deferred_read_response=0x00005e7d
--define_symbol att_server_get_mtu=0x00005e95
--define_symbol att_server_indicate=0x00005f0d
--define_symbol att_server_init=0x00005f91
--define_symbol att_server_notify=0x00005fcd
--define_symbol att_server_register_packet_handler=0x000060e5
--define_symbol att_server_request_can_send_now_event=0x000060f1
--define_symbol att_set_db=0x0000610d
--define_symbol att_set_read_callback=0x00006121
--define_symbol att_set_write_callback=0x0000612d
--define_symbol bd_addr_cmp=0x0000629d
--define_symbol bd_addr_copy=0x000062a3
--define_symbol bd_addr_to_str=0x000062ad
--define_symbol big_endian_read_16=0x000062e5
--define_symbol big_endian_read_32=0x000062ed
--define_symbol big_endian_store_16=0x00006301
--define_symbol big_endian_store_32=0x0000630d
--define_symbol btstack_config=0x00006445
--define_symbol btstack_memory_pool_create=0x00006593
--define_symbol btstack_memory_pool_free=0x000065bd
--define_symbol btstack_memory_pool_get=0x0000661d
--define_symbol btstack_push_user_msg=0x00006665
--define_symbol btstack_push_user_runnable=0x00006671
--define_symbol char_for_nibble=0x000068e1
--define_symbol gap_add_dev_to_periodic_list=0x00007165
--define_symbol gap_add_whitelist=0x00007175
--define_symbol gap_aes_encrypt=0x00007181
--define_symbol gap_clear_white_lists=0x000071b9
--define_symbol gap_clr_adv_set=0x000071c5
--define_symbol gap_clr_periodic_adv_list=0x000071d1
--define_symbol gap_create_connection_cancel=0x000071dd
--define_symbol gap_disconnect=0x000071e9
--define_symbol gap_disconnect_all=0x00007215
--define_symbol gap_ext_create_connection=0x00007255
--define_symbol gap_get_connection_parameter_range=0x00007335
--define_symbol gap_le_read_channel_map=0x0000736d
--define_symbol gap_periodic_adv_create_sync=0x000073d9
--define_symbol gap_periodic_adv_create_sync_cancel=0x000073fd
--define_symbol gap_periodic_adv_term_sync=0x00007409
--define_symbol gap_read_periodic_adv_list_size=0x00007491
--define_symbol gap_read_phy=0x0000749d
--define_symbol gap_read_remote_used_features=0x000074a9
--define_symbol gap_read_remote_version=0x000074b5
--define_symbol gap_read_rssi=0x000074c1
--define_symbol gap_remove_whitelist=0x000074cd
--define_symbol gap_rmv_adv_set=0x00007549
--define_symbol gap_rmv_dev_from_periodic_list=0x00007555
--define_symbol gap_rx_test_v2=0x00007565
--define_symbol gap_set_adv_set_random_addr=0x0000759d
--define_symbol gap_set_callback_for_next_hci=0x000075d9
--define_symbol gap_set_connection_parameter_range=0x00007601
--define_symbol gap_set_data_length=0x0000761d
--define_symbol gap_set_def_phy=0x00007635
--define_symbol gap_set_ext_adv_data=0x00007645
--define_symbol gap_set_ext_adv_enable=0x0000765d
--define_symbol gap_set_ext_adv_para=0x000076d9
--define_symbol gap_set_ext_scan_enable=0x000077b1
--define_symbol gap_set_ext_scan_para=0x000077c9
--define_symbol gap_set_ext_scan_response_data=0x00007871
--define_symbol gap_set_host_channel_classification=0x00007889
--define_symbol gap_set_periodic_adv_data=0x00007899
--define_symbol gap_set_periodic_adv_enable=0x00007909
--define_symbol gap_set_periodic_adv_para=0x00007919
--define_symbol gap_set_phy=0x00007931
--define_symbol gap_set_random_device_address=0x0000794d
--define_symbol gap_start_ccm=0x0000797d
--define_symbol gap_test_end=0x000079c5
--define_symbol gap_tx_test_v2=0x000079d1
--define_symbol gap_tx_test_v4=0x000079e9
--define_symbol gap_update_connection_parameters=0x00007a0d
--define_symbol gap_vendor_tx_continuous_wave=0x00007a51
--define_symbol gatt_client_cancel_write=0x00007f79
--define_symbol gatt_client_discover_characteristic_descriptors=0x00007f9f
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid128=0x00007fdf
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid16=0x0000802f
--define_symbol gatt_client_discover_characteristics_for_service=0x0000807f
--define_symbol gatt_client_discover_primary_services=0x000080b5
--define_symbol gatt_client_discover_primary_services_by_uuid128=0x000080e7
--define_symbol gatt_client_discover_primary_services_by_uuid16=0x0000812b
--define_symbol gatt_client_execute_write=0x00008167
--define_symbol gatt_client_find_included_services_for_service=0x0000818d
--define_symbol gatt_client_get_mtu=0x000081bb
--define_symbol gatt_client_is_ready=0x0000825d
--define_symbol gatt_client_listen_for_characteristic_value_updates=0x00008273
--define_symbol gatt_client_prepare_write=0x00008295
--define_symbol gatt_client_read_characteristic_descriptor_using_descriptor_handle=0x000082d1
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle=0x000082fb
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x00008301
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle=0x0000832f
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset=0x00008335
--define_symbol gatt_client_read_multiple_characteristic_values=0x00008363
--define_symbol gatt_client_read_value_of_characteristic_using_value_handle=0x00008393
--define_symbol gatt_client_read_value_of_characteristics_by_uuid128=0x000083c1
--define_symbol gatt_client_read_value_of_characteristics_by_uuid16=0x0000840d
--define_symbol gatt_client_register_handler=0x00008459
--define_symbol gatt_client_reliable_write_long_value_of_characteristic=0x00008465
--define_symbol gatt_client_signed_write_without_response=0x00008895
--define_symbol gatt_client_write_characteristic_descriptor_using_descriptor_handle=0x00008959
--define_symbol gatt_client_write_client_characteristic_configuration=0x00008993
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle=0x000089e5
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x000089f5
--define_symbol gatt_client_write_long_value_of_characteristic=0x00008a31
--define_symbol gatt_client_write_long_value_of_characteristic_with_offset=0x00008a41
--define_symbol gatt_client_write_value_of_characteristic=0x00008a7d
--define_symbol gatt_client_write_value_of_characteristic_without_response=0x00008ab3
--define_symbol hci_add_event_handler=0x00009fd9
--define_symbol hci_power_control=0x0000a761
--define_symbol hci_register_acl_packet_handler=0x0000a915
--define_symbol kv_commit=0x0000b0a5
--define_symbol kv_get=0x0000b101
--define_symbol kv_init=0x0000b10d
--define_symbol kv_init_backend=0x0000b18d
--define_symbol kv_put=0x0000b1a1
--define_symbol kv_remove=0x0000b1ad
--define_symbol kv_remove_all=0x0000b1e1
--define_symbol kv_value_modified=0x0000b211
--define_symbol kv_value_modified_of_key=0x0000b22d
--define_symbol kv_visit=0x0000b239
--define_symbol l2cap_add_event_handler=0x0000b2c9
--define_symbol l2cap_can_send_packet_now=0x0000b2d9
--define_symbol l2cap_create_le_credit_based_connection_request=0x0000b495
--define_symbol l2cap_credit_based_send=0x0000b5d9
--define_symbol l2cap_credit_based_send_continue=0x0000b605
--define_symbol l2cap_disconnect=0x0000b681
--define_symbol l2cap_get_le_credit_based_connection_credits=0x0000b8d1
--define_symbol l2cap_get_peer_mtu_for_local_cid=0x0000b8ed
--define_symbol l2cap_init=0x0000bcc1
--define_symbol l2cap_le_send_flow_control_credit=0x0000bdb7
--define_symbol l2cap_max_le_mtu=0x0000c0c1
--define_symbol l2cap_register_packet_handler=0x0000c1e9
--define_symbol l2cap_register_service=0x0000c1f5
--define_symbol l2cap_request_can_send_now_event=0x0000c305
--define_symbol l2cap_request_connection_parameter_update=0x0000c31f
--define_symbol l2cap_send_echo_request=0x0000c7f9
--define_symbol l2cap_unregister_service=0x0000c8b9
--define_symbol le_device_db_add=0x0000c911
--define_symbol le_device_db_find=0x0000c9e9
--define_symbol le_device_db_from_key=0x0000ca15
--define_symbol le_device_db_iter_cur=0x0000ca1d
--define_symbol le_device_db_iter_cur_key=0x0000ca21
--define_symbol le_device_db_iter_init=0x0000ca25
--define_symbol le_device_db_iter_next=0x0000ca2d
--define_symbol le_device_db_remove_key=0x0000ca53
--define_symbol ll_aes_encrypt=0x0000ca81
--define_symbol ll_config=0x0000cafd
--define_symbol ll_free=0x0000cb33
--define_symbol ll_get_heap_free_size=0x0000cb3d
--define_symbol ll_hint_on_ce_len=0x0000cb51
--define_symbol ll_legacy_adv_set_interval=0x0000cb89
--define_symbol ll_malloc=0x0000cb99
--define_symbol ll_query_timing_info=0x0000ccd1
--define_symbol ll_register_hci_acl_previewer=0x0000cd1d
--define_symbol ll_scan_set_fixed_channel=0x0000cd81
--define_symbol ll_set_adv_access_address=0x0000cf99
--define_symbol ll_set_adv_coded_scheme=0x0000cfa5
--define_symbol ll_set_conn_acl_report_latency=0x0000cfd5
--define_symbol ll_set_conn_coded_scheme=0x0000d005
--define_symbol ll_set_conn_latency=0x0000d031
--define_symbol ll_set_conn_tx_power=0x0000d061
--define_symbol ll_set_def_antenna=0x0000d0a9
--define_symbol ll_set_initiating_coded_scheme=0x0000d0c5
--define_symbol ll_set_max_conn_number=0x0000d0d1
--define_symbol nibble_for_char=0x0001d265
--define_symbol platform_32k_rc_auto_tune=0x0001d301
--define_symbol platform_32k_rc_tune=0x0001d37d
--define_symbol platform_calibrate_32k=0x0001d391
--define_symbol platform_config=0x0001d395
--define_symbol platform_controller_run=0x0001d4b9
--define_symbol platform_delete_timer=0x0001d4ed
--define_symbol platform_enable_irq=0x0001d4f5
--define_symbol platform_get_gen_os_driver=0x0001d52d
--define_symbol platform_get_task_handle=0x0001d539
--define_symbol platform_get_timer_counter=0x0001d551
--define_symbol platform_get_us_time=0x0001d555
--define_symbol platform_get_version=0x0001d559
--define_symbol platform_hrng=0x0001d561
--define_symbol platform_init_controller=0x0001d569
--define_symbol platform_os_idle_resumed_hook=0x0001d585
--define_symbol platform_patch_rf_init_data=0x0001d589
--define_symbol platform_post_sleep_processing=0x0001d595
--define_symbol platform_pre_sleep_processing=0x0001d59b
--define_symbol platform_pre_suppress_ticks_and_sleep_processing=0x0001d5a1
--define_symbol platform_printf=0x0001d5a5
--define_symbol platform_raise_assertion=0x0001d5b9
--define_symbol platform_rand=0x0001d5cd
--define_symbol platform_read_info=0x0001d5d1
--define_symbol platform_read_persistent_reg=0x0001d601
--define_symbol platform_reset=0x0001d611
--define_symbol platform_set_abs_timer=0x0001d635
--define_symbol platform_set_evt_callback=0x0001d639
--define_symbol platform_set_evt_callback_table=0x0001d64d
--define_symbol platform_set_irq_callback=0x0001d659
--define_symbol platform_set_irq_callback_table=0x0001d675
--define_symbol platform_set_rf_clk_source=0x0001d681
--define_symbol platform_set_rf_init_data=0x0001d68d
--define_symbol platform_set_rf_power_mapping=0x0001d699
--define_symbol platform_set_timer=0x0001d6a5
--define_symbol platform_shutdown=0x0001d6a9
--define_symbol platform_switch_app=0x0001d6ad
--define_symbol platform_trace_raw=0x0001d6d9
--define_symbol platform_write_persistent_reg=0x0001d6f1
--define_symbol printf_hexdump=0x0001d701
--define_symbol reverse_128=0x0001da41
--define_symbol reverse_24=0x0001da47
--define_symbol reverse_256=0x0001da4d
--define_symbol reverse_48=0x0001da53
--define_symbol reverse_56=0x0001da59
--define_symbol reverse_64=0x0001da5f
--define_symbol reverse_bd_addr=0x0001da65
--define_symbol reverse_bytes=0x0001da6b
--define_symbol sm_add_event_handler=0x0001dbd9
--define_symbol sm_address_resolution_lookup=0x0001dd31
--define_symbol sm_authenticated=0x0001e0ad
--define_symbol sm_authorization_decline=0x0001e0bb
--define_symbol sm_authorization_grant=0x0001e0db
--define_symbol sm_authorization_state=0x0001e0fb
--define_symbol sm_bonding_decline=0x0001e115
--define_symbol sm_config=0x0001e571
--define_symbol sm_config_conn=0x0001e589
--define_symbol sm_encryption_key_size=0x0001e73f
--define_symbol sm_just_works_confirm=0x0001ecc5
--define_symbol sm_le_device_key=0x0001f011
--define_symbol sm_passkey_input=0x0001f0a7
--define_symbol sm_private_random_address_generation_get=0x0001f461
--define_symbol sm_private_random_address_generation_get_mode=0x0001f469
--define_symbol sm_private_random_address_generation_set_mode=0x0001f475
--define_symbol sm_private_random_address_generation_set_update_period=0x0001f49d
--define_symbol sm_register_external_ltk_callback=0x0001f5d9
--define_symbol sm_register_oob_data_callback=0x0001f5e5
--define_symbol sm_request_pairing=0x0001f5f1
--define_symbol sm_send_security_request=0x000200c7
--define_symbol sm_set_accepted_stk_generation_methods=0x000200ed
--define_symbol sm_set_authentication_requirements=0x000200f9
--define_symbol sm_set_encryption_key_size_range=0x00020105
--define_symbol sscanf_bd_addr=0x00020461
--define_symbol sysSetPublicDeviceAddr=0x00020815
--define_symbol uuid128_to_str=0x00020df9
--define_symbol uuid_add_bluetooth_prefix=0x00020e51
--define_symbol uuid_has_bluetooth_prefix=0x00020e71
