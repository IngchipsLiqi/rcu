
/*
** COPYRIGHT (c) 2023 by INGCHIPS
*/

#ifndef __PAIR_BOND_H__
#define __PAIR_BOND_H__

#include <stdio.h>
#include <string.h>

#include "sm.h"

#if defined __cplusplus
    extern "C" {
#endif

typedef struct 
{
    bd_addr_t peer_addr;
    bd_addr_type_t peer_addr_type;
}le_peer_device_information_t;

typedef struct
{
    bd_addr_t addr;
    bd_addr_type_t addr_type;
    sm_key_t irk;
}direct_reconnect_param_t;

extern direct_reconnect_param_t direct_param;

extern sm_persistent_t sm_persistent;

void sm_user_msg_handler(uint32_t msg_id, void *data, uint16_t size);
void clear_pairing_data(void);
int is_already_paired(void);

void pair_bond_connected(const le_meta_event_enh_create_conn_complete_t *conn_complete);
void pair_bond_event_disconnect(const event_disconn_complete_t *cmpl);
void pair_bond_init(const bd_addr_t addr);

void update_ir(void);

void Reload_Ir(void);

void generate_rpa(uint8_t *addr, const uint8_t *irk);

#if defined __cplusplus
    }
#endif

#endif

