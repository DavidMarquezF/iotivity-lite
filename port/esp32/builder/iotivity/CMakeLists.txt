set(IOTIVITY_ESP_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/../../main" )


set(includes
    ${IOTIVITY_ESP_SOURCE}
	${IOTIVITY_ESP_SOURCE}/../adapter/include
	${IOTIVITY_ESP_SOURCE}/../../..
	${IOTIVITY_ESP_SOURCE}/../../../include
	${IOTIVITY_ESP_SOURCE}/../../../messaging/coap
	${IOTIVITY_ESP_SOURCE}/../../../port
	${IOTIVITY_ESP_SOURCE}/../../../util
	${IOTIVITY_ESP_SOURCE}/../../../util/pt
	${IOTIVITY_ESP_SOURCE}/../../../deps/tinycbor/src
)

set(sources
	${IOTIVITY_ESP_SOURCE}/../../../deps/tinycbor/src/cborencoder.c
	${IOTIVITY_ESP_SOURCE}/../../../deps/tinycbor/src/cborencoder_close_container_checked.c
	${IOTIVITY_ESP_SOURCE}/../../../deps/tinycbor/src/cborparser.c

	${IOTIVITY_ESP_SOURCE}/../adapter/src/random.c
	${IOTIVITY_ESP_SOURCE}/../adapter/src/storage.c
	${IOTIVITY_ESP_SOURCE}/../adapter/src/clock.c
	${IOTIVITY_ESP_SOURCE}/../adapter/src/ipadapter.c
	${IOTIVITY_ESP_SOURCE}/../adapter/src/abort.c
	${IOTIVITY_ESP_SOURCE}/../adapter/src/debug_print.c
	${IOTIVITY_ESP_SOURCE}/../adapter/src/vfs_pipe.c
	${IOTIVITY_ESP_SOURCE}/../adapter/src/tcpadapter.c

	${IOTIVITY_ESP_SOURCE}/../../../util/oc_etimer.c
	${IOTIVITY_ESP_SOURCE}/../../../util/oc_list.c
	${IOTIVITY_ESP_SOURCE}/../../../util/oc_memb.c
	${IOTIVITY_ESP_SOURCE}/../../../util/oc_mmem.c
	${IOTIVITY_ESP_SOURCE}/../../../util/oc_process.c
	${IOTIVITY_ESP_SOURCE}/../../../util/oc_timer.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_base64.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_blockwise.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_buffer.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_client_api.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_core_res.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_discovery.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_endpoint.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_helpers.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_introspection.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_main.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_network_events.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_rep.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_ri.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_server_api.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_uuid.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_enums.c
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_session_events.c
	${IOTIVITY_ESP_SOURCE}/../../../messaging/coap/coap.c
	${IOTIVITY_ESP_SOURCE}/../../../messaging/coap/engine.c
	${IOTIVITY_ESP_SOURCE}/../../../messaging/coap/observe.c
	${IOTIVITY_ESP_SOURCE}/../../../messaging/coap/separate.c
	${IOTIVITY_ESP_SOURCE}/../../../messaging/coap/transactions.c
)

if (CONFIG_OC_DEBUG)
  add_definitions(-DOC_DEBUG)
endif()

if (CONFIG_IPV4)
  add_definitions(-DOC_IPV4)
endif()

if (CONFIG_TCP)
  add_definitions(-DOC_TCP)
  list(APPEND sources
  	${IOTIVITY_ESP_SOURCE}/../adapter/src/tcpadapter.c
	${IOTIVITY_ESP_SOURCE}/../../../messaging/coap/coap_signal.c
  )
endif()

if (CONFIG_CLOUD)
  add_definitions(-DOC_CLOUD -DOC_DYNAMIC_ALLOCATION -DOC_TCP -DOC_IPV4)
  list(APPEND sources
  	${IOTIVITY_ESP_SOURCE}/../../../api/cloud/oc_cloud_apis.c
	${IOTIVITY_ESP_SOURCE}/../../../api/cloud/oc_cloud_manager.c
	${IOTIVITY_ESP_SOURCE}/../../../api/cloud/oc_cloud_rd.c
	${IOTIVITY_ESP_SOURCE}/../../../api/cloud/oc_cloud_resource.c
	${IOTIVITY_ESP_SOURCE}/../../../api/cloud/oc_cloud_store.c
	${IOTIVITY_ESP_SOURCE}/../../../api/cloud/oc_cloud.c
	${IOTIVITY_ESP_SOURCE}/../../../api/cloud/rd_client.c
  )
endif()

if (CONFIG_DYNAMIC)
	add_definitions(-DOC_DYNAMIC_ALLOCATION)
	list(APPEND sources
	${IOTIVITY_ESP_SOURCE}/../../../api/oc_collection.c
	)
endif()

if (CONFIG_SECURE)
	add_definitions(-DOC_SECURITY -DOC_PKI -DAPP_DEBUG)
	list(APPEND sources
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_acl.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_ael.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_audit.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_certs.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_cred.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_csr.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_doxm.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_keypair.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_obt.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_obt_certs.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_obt_otm_cert.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_obt_otm_justworks.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_obt_otm_randompin.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_pki.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_pstat.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_roles.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_sdi.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_sp.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_store.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_svr.c
		${IOTIVITY_ESP_SOURCE}/../../../security/oc_tls.c
		${IOTIVITY_ESP_SOURCE}/../../../api/oc_clock.c
		${IOTIVITY_ESP_SOURCE}/../../../api/c-timestamp/timestamp_format.c
		${IOTIVITY_ESP_SOURCE}/../../../api/c-timestamp/timestamp_tm.c
		${IOTIVITY_ESP_SOURCE}/../../../api/c-timestamp/timestamp_valid.c
		${IOTIVITY_ESP_SOURCE}/../../../api/c-timestamp/timestamp_parse.c
		${IOTIVITY_ESP_SOURCE}/../../../api/c-timestamp/timestamp_compare.c
	)
endif()

#add_definitions(-DOC_CLIENT)
#add_definitions(-DOC_SERVER)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-format-truncation")

idf_component_register(
	SRCS
		${sources}
	INCLUDE_DIRS
		${includes}
	REQUIRES mbedtls
	PRIV_REQUIRES nvs_flash
)

set_source_files_properties(${sources}
   PROPERTIES COMPILE_FLAGS
    "-DOC_SERVER -DOC_CLIENT"
)
