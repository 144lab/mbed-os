/*
 * Copyright (c) 2018-2019, Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

/*******************************************************************************
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 * THIS FILE IS AN AUTO-GENERATED FILE - DO NOT MODIFY IT.
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 * Template Version 1.0
 * Generated by tools/psa/generate_partition_code.py Version {{script_ver}}
 ******************************************************************************/

#ifndef __TFM_SPM_SIGNAL_DEFS_H__
#define __TFM_SPM_SIGNAL_DEFS_H__

/*************************** Service Partitions *******************************/
{% for partition in service_partitions %}
/* -----------------------------------------------------------------------------
 * {{partition.name|upper}} Signals
 * -------------------------------------------------------------------------- */
{% for rot_srv in partition.rot_services %}
#define {{rot_srv.signal|upper}}_POS ({{loop.index + 3}}UL)
#define {{rot_srv.signal|upper}} (1UL << {{rot_srv.signal|upper}}_POS)
{% endfor %}

{% endfor %}
/*************************** Test Partitions **********************************/
#ifdef USE_PSA_TEST_PARTITIONS

{% for partition in test_partitions %}
#ifdef USE_{{partition.name|upper}}
/* -----------------------------------------------------------------------------
 * {{partition.name|upper}} Signals
 * -------------------------------------------------------------------------- */
{% for rot_srv in partition.rot_services %}
#define {{rot_srv.signal|upper}}_POS ({{loop.index + 3}}UL)
#define {{rot_srv.signal|upper}} (1UL << {{rot_srv.signal|upper}}_POS)
{% endfor %}
#endif // USE_{{partition.name|upper}}

{% endfor %}
#endif // USE_PSA_TEST_PARTITIONS

#endif // __TFM_SPM_SIGNAL_DEFS_H__
{# End of file #}
