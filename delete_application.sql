prompt --application/delete_application
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.3'
,p_default_workspace_id=>27113392755738339338
,p_default_application_id=>279282
,p_default_id_offset=>64256246651040572411
,p_default_owner=>'WKSP_MATEUSZTEST1984'
);
wwv_flow_imp.remove_flow(wwv_flow.g_flow_id);
wwv_flow_imp.component_end;
end;
/
