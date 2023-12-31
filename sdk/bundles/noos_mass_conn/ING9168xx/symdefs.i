--define_symbol att_dispatch_client_can_send_now=0x02004345
--define_symbol att_dispatch_client_request_can_send_now_event=0x0200434b
--define_symbol att_dispatch_register_client=0x02004351
--define_symbol att_dispatch_register_server=0x02004365
--define_symbol att_dispatch_server_can_send_now=0x02004379
--define_symbol att_dispatch_server_request_can_send_now_event=0x0200437f
--define_symbol att_emit_general_event=0x02004431
--define_symbol att_server_can_send_packet_now=0x02004b69
--define_symbol att_server_deferred_read_response=0x02004b6d
--define_symbol att_server_get_mtu=0x02004b85
--define_symbol att_server_indicate=0x02004bfd
--define_symbol att_server_init=0x02004c81
--define_symbol att_server_notify=0x02004cbd
--define_symbol att_server_register_packet_handler=0x02004dd5
--define_symbol att_server_request_can_send_now_event=0x02004de1
--define_symbol att_set_db=0x02004dfd
--define_symbol att_set_read_callback=0x02004e11
--define_symbol att_set_write_callback=0x02004e1d
--define_symbol bd_addr_cmp=0x02004ff1
--define_symbol bd_addr_copy=0x02004ff7
--define_symbol bd_addr_to_str=0x02005001
--define_symbol big_endian_read_16=0x02005039
--define_symbol big_endian_read_32=0x02005041
--define_symbol big_endian_store_16=0x02005055
--define_symbol big_endian_store_32=0x02005061
--define_symbol btstack_config=0x020051a5
--define_symbol btstack_memory_pool_create=0x020052f3
--define_symbol btstack_memory_pool_free=0x0200531d
--define_symbol btstack_memory_pool_get=0x0200537d
--define_symbol btstack_push_user_msg=0x020053c5
--define_symbol btstack_push_user_runnable=0x020053d1
--define_symbol char_for_nibble=0x02005657
--define_symbol gap_add_dev_to_periodic_list=0x02006005
--define_symbol gap_add_whitelist=0x02006015
--define_symbol gap_aes_encrypt=0x02006021
--define_symbol gap_clear_white_lists=0x02006059
--define_symbol gap_clr_adv_set=0x02006065
--define_symbol gap_clr_periodic_adv_list=0x02006071
--define_symbol gap_create_connection_cancel=0x0200607d
--define_symbol gap_default_periodic_adv_sync_transfer_param=0x02006089
--define_symbol gap_disconnect=0x020060a1
--define_symbol gap_disconnect_all=0x020060cd
--define_symbol gap_ext_create_connection=0x0200610d
--define_symbol gap_get_connection_parameter_range=0x020061ed
--define_symbol gap_le_read_channel_map=0x02006229
--define_symbol gap_periodic_adv_create_sync=0x02006295
--define_symbol gap_periodic_adv_create_sync_cancel=0x020062b9
--define_symbol gap_periodic_adv_set_info_transfer=0x020062c5
--define_symbol gap_periodic_adv_sync_transfer=0x020062d5
--define_symbol gap_periodic_adv_sync_transfer_param=0x020062e5
--define_symbol gap_periodic_adv_term_sync=0x02006301
--define_symbol gap_read_antenna_info=0x02006389
--define_symbol gap_read_periodic_adv_list_size=0x02006395
--define_symbol gap_read_phy=0x020063a1
--define_symbol gap_read_remote_used_features=0x020063ad
--define_symbol gap_read_remote_version=0x020063b9
--define_symbol gap_read_rssi=0x020063c5
--define_symbol gap_remove_whitelist=0x020063d1
--define_symbol gap_rmv_adv_set=0x0200644d
--define_symbol gap_rmv_dev_from_periodic_list=0x02006459
--define_symbol gap_rx_test_v2=0x02006469
--define_symbol gap_rx_test_v3=0x02006479
--define_symbol gap_set_adv_set_random_addr=0x020064c5
--define_symbol gap_set_callback_for_next_hci=0x02006501
--define_symbol gap_set_connection_cte_request_enable=0x02006521
--define_symbol gap_set_connection_cte_response_enable=0x0200653d
--define_symbol gap_set_connection_cte_rx_param=0x0200654d
--define_symbol gap_set_connection_cte_tx_param=0x020065a9
--define_symbol gap_set_connection_parameter_range=0x020065fd
--define_symbol gap_set_connectionless_cte_tx_enable=0x02006615
--define_symbol gap_set_connectionless_cte_tx_param=0x02006625
--define_symbol gap_set_connectionless_iq_sampling_enable=0x02006685
--define_symbol gap_set_data_length=0x020066e9
--define_symbol gap_set_def_phy=0x02006701
--define_symbol gap_set_ext_adv_data=0x02006711
--define_symbol gap_set_ext_adv_enable=0x02006729
--define_symbol gap_set_ext_adv_para=0x020067a5
--define_symbol gap_set_ext_scan_enable=0x02006875
--define_symbol gap_set_ext_scan_para=0x0200688d
--define_symbol gap_set_ext_scan_response_data=0x02006935
--define_symbol gap_set_host_channel_classification=0x0200694d
--define_symbol gap_set_periodic_adv_data=0x0200695d
--define_symbol gap_set_periodic_adv_enable=0x020069cd
--define_symbol gap_set_periodic_adv_para=0x020069dd
--define_symbol gap_set_periodic_adv_rx_enable=0x020069f5
--define_symbol gap_set_phy=0x02006a05
--define_symbol gap_set_random_device_address=0x02006a21
--define_symbol gap_start_ccm=0x02006a51
--define_symbol gap_test_end=0x02006a99
--define_symbol gap_tx_test_v2=0x02006aa5
--define_symbol gap_tx_test_v4=0x02006abd
--define_symbol gap_update_connection_parameters=0x02006ae1
--define_symbol gap_vendor_tx_continuous_wave=0x02006b25
--define_symbol gatt_client_cancel_write=0x0200704d
--define_symbol gatt_client_discover_characteristic_descriptors=0x02007073
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid128=0x020070b3
--define_symbol gatt_client_discover_characteristics_for_handle_range_by_uuid16=0x02007103
--define_symbol gatt_client_discover_characteristics_for_service=0x02007153
--define_symbol gatt_client_discover_primary_services=0x02007189
--define_symbol gatt_client_discover_primary_services_by_uuid128=0x020071bb
--define_symbol gatt_client_discover_primary_services_by_uuid16=0x020071ff
--define_symbol gatt_client_execute_write=0x0200723d
--define_symbol gatt_client_find_included_services_for_service=0x02007263
--define_symbol gatt_client_get_mtu=0x02007291
--define_symbol gatt_client_is_ready=0x02007355
--define_symbol gatt_client_listen_for_characteristic_value_updates=0x0200736b
--define_symbol gatt_client_prepare_write=0x0200738d
--define_symbol gatt_client_read_characteristic_descriptor_using_descriptor_handle=0x020073c9
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle=0x020073f3
--define_symbol gatt_client_read_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x020073f9
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle=0x02007427
--define_symbol gatt_client_read_long_value_of_characteristic_using_value_handle_with_offset=0x0200742d
--define_symbol gatt_client_read_multiple_characteristic_values=0x0200745b
--define_symbol gatt_client_read_value_of_characteristic_using_value_handle=0x0200748b
--define_symbol gatt_client_read_value_of_characteristics_by_uuid128=0x020074b9
--define_symbol gatt_client_read_value_of_characteristics_by_uuid16=0x02007505
--define_symbol gatt_client_register_handler=0x02007551
--define_symbol gatt_client_reliable_write_long_value_of_characteristic=0x0200755d
--define_symbol gatt_client_signed_write_without_response=0x02007991
--define_symbol gatt_client_write_characteristic_descriptor_using_descriptor_handle=0x02007a55
--define_symbol gatt_client_write_client_characteristic_configuration=0x02007a8f
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle=0x02007ae1
--define_symbol gatt_client_write_long_characteristic_descriptor_using_descriptor_handle_with_offset=0x02007af1
--define_symbol gatt_client_write_long_value_of_characteristic=0x02007b2d
--define_symbol gatt_client_write_long_value_of_characteristic_with_offset=0x02007b3d
--define_symbol gatt_client_write_value_of_characteristic=0x02007b79
--define_symbol gatt_client_write_value_of_characteristic_without_response=0x02007baf
--define_symbol hci_add_event_handler=0x020091a5
--define_symbol hci_power_control=0x02009931
--define_symbol hci_register_acl_packet_handler=0x02009ae5
--define_symbol kv_commit=0x0200a21d
--define_symbol kv_get=0x0200a279
--define_symbol kv_init=0x0200a285
--define_symbol kv_init_backend=0x0200a305
--define_symbol kv_put=0x0200a319
--define_symbol kv_remove=0x0200a325
--define_symbol kv_remove_all=0x0200a359
--define_symbol kv_value_modified=0x0200a389
--define_symbol kv_value_modified_of_key=0x0200a3a5
--define_symbol kv_visit=0x0200a3b1
--define_symbol l2cap_add_event_handler=0x0200a441
--define_symbol l2cap_can_send_packet_now=0x0200a451
--define_symbol l2cap_create_le_credit_based_connection_request=0x0200a615
--define_symbol l2cap_credit_based_send=0x0200a75d
--define_symbol l2cap_credit_based_send_continue=0x0200a789
--define_symbol l2cap_disconnect=0x0200a805
--define_symbol l2cap_get_le_credit_based_connection_credits=0x0200a9f1
--define_symbol l2cap_get_peer_mtu_for_local_cid=0x0200aa0d
--define_symbol l2cap_init=0x0200ae4d
--define_symbol l2cap_le_send_flow_control_credit=0x0200af43
--define_symbol l2cap_max_le_mtu=0x0200b251
--define_symbol l2cap_register_packet_handler=0x0200b379
--define_symbol l2cap_register_service=0x0200b385
--define_symbol l2cap_request_can_send_now_event=0x0200b495
--define_symbol l2cap_request_connection_parameter_update=0x0200b4af
--define_symbol l2cap_send_echo_request=0x0200b991
--define_symbol l2cap_unregister_service=0x0200ba71
--define_symbol le_device_db_add=0x0200bac9
--define_symbol le_device_db_find=0x0200bba1
--define_symbol le_device_db_from_key=0x0200bbcd
--define_symbol le_device_db_iter_cur=0x0200bbd5
--define_symbol le_device_db_iter_cur_key=0x0200bbd9
--define_symbol le_device_db_iter_init=0x0200bbdd
--define_symbol le_device_db_iter_next=0x0200bbe5
--define_symbol le_device_db_remove_key=0x0200bc0b
--define_symbol ll_adjust_conn_peer_tx_power=0x0200bc39
--define_symbol ll_aes_encrypt=0x0200bc65
--define_symbol ll_config=0x0200bcd9
--define_symbol ll_free=0x0200bd0f
--define_symbol ll_get_heap_free_size=0x0200bd19
--define_symbol ll_hint_on_ce_len=0x0200bd2d
--define_symbol ll_legacy_adv_set_interval=0x0200bd65
--define_symbol ll_malloc=0x0200bd75
--define_symbol ll_register_hci_acl_previewer=0x0200be8d
--define_symbol ll_scan_set_fixed_channel=0x0200bef1
--define_symbol ll_set_adv_access_address=0x0200c109
--define_symbol ll_set_adv_coded_scheme=0x0200c115
--define_symbol ll_set_conn_acl_report_latency=0x0200c14d
--define_symbol ll_set_conn_coded_scheme=0x0200c17d
--define_symbol ll_set_conn_latency=0x0200c1a9
--define_symbol ll_set_conn_tx_power=0x0200c1d9
--define_symbol ll_set_def_antenna=0x0200c215
--define_symbol ll_set_initiating_coded_scheme=0x0200c235
--define_symbol ll_set_max_conn_number=0x0200c241
--define_symbol ll_set_tx_power_range=0x0200c2d5
--define_symbol nibble_for_char=0x0201ed29
--define_symbol platform_32k_rc_auto_tune=0x0201edc1
--define_symbol platform_32k_rc_tune=0x0201ee0d
--define_symbol platform_calibrate_32k=0x0201ee29
--define_symbol platform_config=0x0201ee2d
--define_symbol platform_controller_run=0x0201ef55
--define_symbol platform_delete_timer=0x0201ef89
--define_symbol platform_enable_irq=0x0201ef91
--define_symbol platform_get_gen_os_driver=0x0201efc5
--define_symbol platform_get_task_handle=0x0201efd1
--define_symbol platform_get_timer_counter=0x0201efe9
--define_symbol platform_get_us_time=0x0201efed
--define_symbol platform_get_version=0x0201eff1
--define_symbol platform_hrng=0x0201eff9
--define_symbol platform_init_controller=0x0201f001
--define_symbol platform_os_idle_resumed_hook=0x0201f01d
--define_symbol platform_patch_rf_init_data=0x0201f021
--define_symbol platform_post_sleep_processing=0x0201f02d
--define_symbol platform_pre_sleep_processing=0x0201f033
--define_symbol platform_pre_suppress_ticks_and_sleep_processing=0x0201f039
--define_symbol platform_printf=0x0201f03d
--define_symbol platform_raise_assertion=0x0201f051
--define_symbol platform_rand=0x0201f065
--define_symbol platform_read_info=0x0201f069
--define_symbol platform_read_persistent_reg=0x0201f099
--define_symbol platform_reset=0x0201f0a5
--define_symbol platform_set_abs_timer=0x0201f0b9
--define_symbol platform_set_evt_callback=0x0201f0bd
--define_symbol platform_set_evt_callback_table=0x0201f0d1
--define_symbol platform_set_irq_callback=0x0201f0dd
--define_symbol platform_set_irq_callback_table=0x0201f0f9
--define_symbol platform_set_rf_clk_source=0x0201f105
--define_symbol platform_set_rf_init_data=0x0201f111
--define_symbol platform_set_rf_power_mapping=0x0201f11d
--define_symbol platform_set_timer=0x0201f129
--define_symbol platform_shutdown=0x0201f12d
--define_symbol platform_switch_app=0x0201f131
--define_symbol platform_trace_raw=0x0201f149
--define_symbol platform_write_persistent_reg=0x0201f161
--define_symbol printf_hexdump=0x0201f175
--define_symbol reverse_128=0x0201f4ed
--define_symbol reverse_24=0x0201f4f3
--define_symbol reverse_256=0x0201f4f9
--define_symbol reverse_48=0x0201f4ff
--define_symbol reverse_56=0x0201f505
--define_symbol reverse_64=0x0201f50b
--define_symbol reverse_bd_addr=0x0201f511
--define_symbol reverse_bytes=0x0201f517
--define_symbol sm_add_event_handler=0x0201f845
--define_symbol sm_address_resolution_lookup=0x0201f99d
--define_symbol sm_authenticated=0x0201fd19
--define_symbol sm_authorization_decline=0x0201fd27
--define_symbol sm_authorization_grant=0x0201fd47
--define_symbol sm_authorization_state=0x0201fd67
--define_symbol sm_bonding_decline=0x0201fd81
--define_symbol sm_config=0x020201d5
--define_symbol sm_config_conn=0x020201ed
--define_symbol sm_encryption_key_size=0x020203a3
--define_symbol sm_just_works_confirm=0x02020929
--define_symbol sm_le_device_key=0x02020c75
--define_symbol sm_passkey_input=0x02020d0b
--define_symbol sm_private_random_address_generation_get=0x020210c5
--define_symbol sm_private_random_address_generation_get_mode=0x020210cd
--define_symbol sm_private_random_address_generation_set_mode=0x020210d9
--define_symbol sm_private_random_address_generation_set_update_period=0x02021101
--define_symbol sm_register_external_ltk_callback=0x0202123d
--define_symbol sm_register_oob_data_callback=0x02021249
--define_symbol sm_request_pairing=0x02021255
--define_symbol sm_send_security_request=0x02021d2b
--define_symbol sm_set_accepted_stk_generation_methods=0x02021d51
--define_symbol sm_set_authentication_requirements=0x02021d5d
--define_symbol sm_set_encryption_key_size_range=0x02021d69
--define_symbol sscanf_bd_addr=0x020220c9
--define_symbol sysSetPublicDeviceAddr=0x02022575
--define_symbol uuid128_to_str=0x02022d99
--define_symbol uuid_add_bluetooth_prefix=0x02022df1
--define_symbol uuid_has_bluetooth_prefix=0x02022e11
