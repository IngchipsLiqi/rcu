--define_symbol att_dispatch_client_can_send_now=0x020040bd
--define_symbol att_dispatch_client_request_can_send_now_event=0x020040c3
--define_symbol att_dispatch_register_client=0x020040c9
--define_symbol att_dispatch_register_server=0x020040dd
--define_symbol att_dispatch_server_can_send_now=0x020040f1
--define_symbol att_dispatch_server_request_can_send_now_event=0x020040f7
--define_symbol att_emit_general_event=0x020041a9
--define_symbol att_server_can_send_packet_now=0x020048dd
--define_symbol att_server_deferred_read_response=0x020048e1
--define_symbol att_server_get_mtu=0x020048f9
--define_symbol att_server_indicate=0x02004965
--define_symbol att_server_init=0x020049e9
--define_symbol att_server_notify=0x02004a25
--define_symbol att_server_register_packet_handler=0x02004b3d
--define_symbol att_server_request_can_send_now_event=0x02004b49
--define_symbol att_set_db=0x02004b65
--define_symbol att_set_read_callback=0x02004b79
--define_symbol att_set_write_callback=0x02004b85
--define_symbol bd_addr_cmp=0x02004d59
--define_symbol bd_addr_copy=0x02004d5f
--define_symbol bd_addr_to_str=0x02004d69
--define_symbol big_endian_read_16=0x02004da1
--define_symbol big_endian_read_32=0x02004da9
--define_symbol big_endian_store_16=0x02004dbd
--define_symbol big_endian_store_32=0x02004dc9
--define_symbol btstack_config=0x02004df5
--define_symbol btstack_memory_pool_create=0x02004f43
--define_symbol btstack_memory_pool_free=0x02004f6d
--define_symbol btstack_memory_pool_get=0x02004fcd
--define_symbol btstack_push_user_msg=0x02005015
--define_symbol btstack_push_user_runnable=0x02005021
--define_symbol char_for_nibble=0x02005237
--define_symbol gap_add_dev_to_periodic_list=0x02005b71
--define_symbol gap_add_whitelist=0x02005b81
--define_symbol gap_aes_encrypt=0x02005b8d
--define_symbol gap_clear_white_lists=0x02005bc5
--define_symbol gap_clr_adv_set=0x02005bd1
--define_symbol gap_clr_periodic_adv_list=0x02005bdd
--define_symbol gap_create_connection_cancel=0x02005be9
--define_symbol gap_default_periodic_adv_sync_transfer_param=0x02005bf5
--define_symbol gap_disconnect=0x02005c0d
--define_symbol gap_disconnect_all=0x02005c39
--define_symbol gap_ext_create_connection=0x02005c79
--define_symbol gap_get_connection_parameter_range=0x02005d59
--define_symbol gap_le_read_channel_map=0x02005d91
--define_symbol gap_periodic_adv_create_sync=0x02005dfd
--define_symbol gap_periodic_adv_create_sync_cancel=0x02005e21
--define_symbol gap_periodic_adv_set_info_transfer=0x02005e2d
--define_symbol gap_periodic_adv_sync_transfer=0x02005e3d
--define_symbol gap_periodic_adv_sync_transfer_param=0x02005e4d
--define_symbol gap_periodic_adv_term_sync=0x02005e69
--define_symbol gap_read_antenna_info=0x02005ef1
--define_symbol gap_read_periodic_adv_list_size=0x02005efd
--define_symbol gap_read_phy=0x02005f09
--define_symbol gap_read_remote_used_features=0x02005f15
--define_symbol gap_read_remote_version=0x02005f21
--define_symbol gap_read_rssi=0x02005f2d
--define_symbol gap_remove_whitelist=0x02005f39
--define_symbol gap_rmv_adv_set=0x02005fb5
--define_symbol gap_rmv_dev_from_periodic_list=0x02005fc1
--define_symbol gap_rx_test_v2=0x02005fd1
--define_symbol gap_rx_test_v3=0x02005fe1
--define_symbol gap_set_adv_set_random_addr=0x0200602d
--define_symbol gap_set_callback_for_next_hci=0x02006069
--define_symbol gap_set_connection_cte_request_enable=0x02006089
--define_symbol gap_set_connection_cte_response_enable=0x020060a5
--define_symbol gap_set_connection_cte_rx_param=0x020060b5
--define_symbol gap_set_connection_cte_tx_param=0x02006111
--define_symbol gap_set_connection_parameter_range=0x02006165
--define_symbol gap_set_connectionless_cte_tx_enable=0x0200617d
--define_symbol gap_set_connectionless_cte_tx_param=0x0200618d
--define_symbol gap_set_connectionless_iq_sampling_enable=0x020061ed
--define_symbol gap_set_data_length=0x02006251
--define_symbol gap_set_def_phy=0x02006269
--define_symbol gap_set_ext_adv_data=0x02006279
--define_symbol gap_set_ext_adv_enable=0x02006291
--define_symbol gap_set_ext_adv_para=0x0200630d
--define_symbol gap_set_ext_scan_enable=0x020063dd
--define_symbol gap_set_ext_scan_para=0x020063f5
--define_symbol gap_set_ext_scan_response_data=0x0200649d
--define_symbol gap_set_host_channel_classification=0x020064b5
--define_symbol gap_set_periodic_adv_data=0x020064c5
--define_symbol gap_set_periodic_adv_enable=0x02006535
--define_symbol gap_set_periodic_adv_para=0x02006545
--define_symbol gap_set_periodic_adv_rx_enable=0x0200655d
--define_symbol gap_set_phy=0x0200656d
--define_symbol gap_set_random_device_address=0x02006589
--define_symbol gap_start_ccm=0x020065b9
--define_symbol gap_test_end=0x02006601
--define_symbol gap_tx_test_v2=0x0200660d
--define_symbol gap_tx_test_v4=0x02006625
--define_symbol gap_update_connection_parameters=0x02006649
--define_symbol gap_vendor_tx_continuous_wave=0x02006689
--define_symbol gatt_client_cancel_write=0x02006bb1
--define_symbol gatt_client_discover_characteristic_descriptors=0x02006bd7
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid128=0x02006c17
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid16=0x02006c67
--define_symbol gatt_client_discover_characteristics_for_service=0x02006cb7
--define_symbol gatt_client_discover_primary_services=0x02006ced
--define_symbol gatt_client_discover_primary_services_by_uuid128=0x02006d1f
--define_symbol gatt_client_discover_primary_services_by_uuid16=0x02006d63
--define_symbol gatt_client_execute_write=0x02006da1
--define_symbol gatt_client_find_included_services_for_service=0x02006dc7
--define_symbol gatt_client_get_mtu=0x02006df5
--define_symbol gatt_client_is_ready=0x02006eb9
--define_symbol gatt_client_listen_for_characteristic_value_updates=0x02006ecf
--define_symbol gatt_client_prepare_write=0x02006eef
--define_symbol gatt_client_read_characteristic_descriptor_using_descriptor_handle=0x02006f2b
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle=0x02006f55
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x02006f5b
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle=0x02006f89
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset=0x02006f8f
--define_symbol gatt_client_read_multiple_characteristic_values=0x02006fbd
--define_symbol gatt_client_read_value_of_characteristic_using_value_handle=0x02006fed
--define_symbol gatt_client_read_value_of_characteristics_by_uuid128=0x0200701b
--define_symbol gatt_client_read_value_of_characteristics_by_uuid16=0x02007067
--define_symbol gatt_client_register_handler=0x020070b1
--define_symbol gatt_client_reliable_write_long_value_of_characteristic=0x020070bd
--define_symbol gatt_client_signed_write_without_response=0x020074c5
--define_symbol gatt_client_write_characteristic_descriptor_using_descriptor_handle=0x02007589
--define_symbol gatt_client_write_client_characteristic_configuration=0x020075c3
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle=0x02007615
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x02007625
--define_symbol gatt_client_write_long_value_of_characteristic=0x02007661
--define_symbol gatt_client_write_long_value_of_characteristic_with_offset=0x02007671
--define_symbol gatt_client_write_value_of_characteristic=0x020076ad
--define_symbol gatt_client_write_value_of_characteristic_without_response=0x020076e3
--define_symbol hci_add_event_handler=0x02008cbd
--define_symbol hci_power_control=0x02009435
--define_symbol hci_register_acl_packet_handler=0x020095e9
--define_symbol kv_commit=0x02009c71
--define_symbol kv_get=0x02009ccd
--define_symbol kv_init=0x02009cd9
--define_symbol kv_init_backend=0x02009d59
--define_symbol kv_put=0x02009d6d
--define_symbol kv_remove=0x02009d79
--define_symbol kv_remove_all=0x02009dad
--define_symbol kv_value_modified=0x02009ddd
--define_symbol kv_value_modified_of_key=0x02009df9
--define_symbol kv_visit=0x02009e05
--define_symbol l2cap_add_event_handler=0x02009e95
--define_symbol l2cap_can_send_packet_now=0x02009ea5
--define_symbol l2cap_create_le_credit_based_connection_request=0x0200a069
--define_symbol l2cap_credit_based_send=0x0200a1b1
--define_symbol l2cap_credit_based_send_continue=0x0200a1dd
--define_symbol l2cap_disconnect=0x0200a259
--define_symbol l2cap_get_le_credit_based_connection_credits=0x0200a445
--define_symbol l2cap_get_peer_mtu_for_local_cid=0x0200a461
--define_symbol l2cap_init=0x0200a8a1
--define_symbol l2cap_le_send_flow_control_credit=0x0200a997
--define_symbol l2cap_max_le_mtu=0x0200aca5
--define_symbol l2cap_register_packet_handler=0x0200adcd
--define_symbol l2cap_register_service=0x0200add9
--define_symbol l2cap_request_can_send_now_event=0x0200aee9
--define_symbol l2cap_request_connection_parameter_update=0x0200af03
--define_symbol l2cap_send_echo_request=0x0200b3e5
--define_symbol l2cap_unregister_service=0x0200b4c5
--define_symbol le_device_db_add=0x0200b51d
--define_symbol le_device_db_find=0x0200b5e5
--define_symbol le_device_db_from_key=0x0200b611
--define_symbol le_device_db_iter_cur=0x0200b619
--define_symbol le_device_db_iter_cur_key=0x0200b61d
--define_symbol le_device_db_iter_init=0x0200b621
--define_symbol le_device_db_iter_next=0x0200b629
--define_symbol le_device_db_remove_key=0x0200b64f
--define_symbol ll_adjust_conn_peer_tx_power=0x0200b67d
--define_symbol ll_aes_encrypt=0x0200b6a5
--define_symbol ll_config=0x0200b719
--define_symbol ll_free=0x0200b74f
--define_symbol ll_get_heap_free_size=0x0200b759
--define_symbol ll_hint_on_ce_len=0x0200b76d
--define_symbol ll_legacy_adv_set_interval=0x0200b7a5
--define_symbol ll_malloc=0x0200b7b5
--define_symbol ll_register_hci_acl_previewer=0x0200b8cd
--define_symbol ll_scan_set_fixed_channel=0x0200b931
--define_symbol ll_set_adv_access_address=0x0200bb49
--define_symbol ll_set_adv_coded_scheme=0x0200bb55
--define_symbol ll_set_conn_acl_report_latency=0x0200bb85
--define_symbol ll_set_conn_coded_scheme=0x0200bbb1
--define_symbol ll_set_conn_latency=0x0200bbd9
--define_symbol ll_set_conn_tx_power=0x0200bc05
--define_symbol ll_set_def_antenna=0x0200bc3d
--define_symbol ll_set_initiating_coded_scheme=0x0200bc5d
--define_symbol ll_set_max_conn_number=0x0200bc69
--define_symbol ll_set_tx_power_range=0x0200bcfd
--define_symbol nibble_for_char=0x0201c6b1
--define_symbol platform_32k_rc_auto_tune=0x0201c729
--define_symbol platform_32k_rc_tune=0x0201c775
--define_symbol platform_calibrate_32k=0x0201c791
--define_symbol platform_config=0x0201c795
--define_symbol platform_controller_run=0x20000113
--define_symbol platform_delete_timer=0x0201c8c9
--define_symbol platform_enable_irq=0x0201c8d1
--define_symbol platform_get_gen_os_driver=0x0201c905
--define_symbol platform_get_task_handle=0x0201c911
--define_symbol platform_get_timer_counter=0x0201c929
--define_symbol platform_get_us_time=0x0201c92d
--define_symbol platform_get_version=0x0201c931
--define_symbol platform_hrng=0x0201c939
--define_symbol platform_init_controller=0x200000fd
--define_symbol platform_os_idle_resumed_hook=0x20000369
--define_symbol platform_patch_rf_init_data=0x0201c941
--define_symbol platform_post_sleep_processing=0x20000363
--define_symbol platform_pre_sleep_processing=0x2000035d
--define_symbol platform_pre_suppress_ticks_and_sleep_processing=0x20000359
--define_symbol platform_printf=0x0201c94d
--define_symbol platform_raise_assertion=0x0201c961
--define_symbol platform_rand=0x0201c975
--define_symbol platform_read_info=0x0201c979
--define_symbol platform_read_persistent_reg=0x0201c9a9
--define_symbol platform_reset=0x0201c9b5
--define_symbol platform_set_abs_timer=0x0201c9c9
--define_symbol platform_set_evt_callback=0x0201c9cd
--define_symbol platform_set_evt_callback_table=0x0201c9e1
--define_symbol platform_set_irq_callback=0x0201c9ed
--define_symbol platform_set_irq_callback_table=0x0201ca09
--define_symbol platform_set_rf_clk_source=0x0201ca15
--define_symbol platform_set_rf_init_data=0x0201ca21
--define_symbol platform_set_rf_power_mapping=0x0201ca2d
--define_symbol platform_set_timer=0x0201ca39
--define_symbol platform_shutdown=0x0201ca3d
--define_symbol platform_switch_app=0x0201ca41
--define_symbol platform_trace_raw=0x0201ca59
--define_symbol platform_write_persistent_reg=0x0201ca71
--define_symbol printf_hexdump=0x0201ca85
--define_symbol reverse_128=0x0201cd85
--define_symbol reverse_24=0x0201cd8b
--define_symbol reverse_256=0x0201cd91
--define_symbol reverse_48=0x0201cd97
--define_symbol reverse_56=0x0201cd9d
--define_symbol reverse_64=0x0201cda3
--define_symbol reverse_bd_addr=0x0201cda9
--define_symbol reverse_bytes=0x0201cdaf
--define_symbol sm_add_event_handler=0x0201d085
--define_symbol sm_address_resolution_lookup=0x0201d1dd
--define_symbol sm_authenticated=0x0201d559
--define_symbol sm_authorization_decline=0x0201d567
--define_symbol sm_authorization_grant=0x0201d587
--define_symbol sm_authorization_state=0x0201d5a7
--define_symbol sm_bonding_decline=0x0201d5c1
--define_symbol sm_config=0x0201da15
--define_symbol sm_config_conn=0x0201da2d
--define_symbol sm_encryption_key_size=0x0201dbe3
--define_symbol sm_just_works_confirm=0x0201e169
--define_symbol sm_le_device_key=0x0201e4b5
--define_symbol sm_passkey_input=0x0201e54b
--define_symbol sm_private_random_address_generation_get=0x0201e905
--define_symbol sm_private_random_address_generation_get_mode=0x0201e90d
--define_symbol sm_private_random_address_generation_set_mode=0x0201e919
--define_symbol sm_private_random_address_generation_set_update_period=0x0201e941
--define_symbol sm_register_external_ltk_callback=0x0201ea7d
--define_symbol sm_register_oob_data_callback=0x0201ea89
--define_symbol sm_request_pairing=0x0201ea95
--define_symbol sm_send_security_request=0x0201f56b
--define_symbol sm_set_accepted_stk_generation_methods=0x0201f591
--define_symbol sm_set_authentication_requirements=0x0201f59d
--define_symbol sm_set_encryption_key_size_range=0x0201f5a9
--define_symbol sscanf_bd_addr=0x0201f909
--define_symbol sysSetPublicDeviceAddr=0x0201f9e5
--define_symbol uuid128_to_str=0x02020169
--define_symbol uuid_add_bluetooth_prefix=0x020201c1
--define_symbol uuid_has_bluetooth_prefix=0x020201e1
