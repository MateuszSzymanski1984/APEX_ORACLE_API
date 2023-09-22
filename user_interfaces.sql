prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 279282
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.3'
,p_default_workspace_id=>27113392755738339338
,p_default_application_id=>279282
,p_default_id_offset=>64256246651040572411
,p_default_owner=>'WKSP_MATEUSZTEST1984'
);
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(279282)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(233749278233403447141)
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_imp.id(233749447457121447211)
,p_nav_list_template_options=>'#DEFAULT#:js-tabLike'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(233749562030145447266)
,p_nav_bar_list_template_id=>wwv_flow_imp.id(233749441639423447208)
,p_nav_bar_template_options=>'#DEFAULT#'
);
wwv_flow_imp.component_end;
end;
/
