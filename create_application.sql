prompt --application/create_application
begin
--   Manifest
--     FLOW: 279282
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.3'
,p_default_workspace_id=>27113392755738339338
,p_default_application_id=>279282
,p_default_id_offset=>64256246651040572411
,p_default_owner=>'WKSP_MATEUSZTEST1984'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'WKSP_MATEUSZTEST1984')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'HOTEL')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'HOTEL248688279282')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'460F458298AD1243FBB6B2A64FEBF081A2C17DC410A41BB38D27FDD2346DBBA8'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'21.2'
,p_flow_language=>'pl'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DD-MM-YYYY'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(233753452683928543008)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'HOTEL'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'1.2'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'HOTEL'
,p_last_updated_by=>'PIOTREK.LIZAK@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20230912190901'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>31
,p_print_server_type=>'INSTANCE'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
,p_pwa_is_push_enabled=>'N'
);
wwv_flow_imp.component_end;
end;
/
