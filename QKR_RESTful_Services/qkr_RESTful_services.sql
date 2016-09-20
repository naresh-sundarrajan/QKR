set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_default_workspace_id=>39220442407499341435
);
end;
/
begin
wwv_flow_api.remove_restful_service(
 p_id=>wwv_flow_api.id(39845198190011563947)
,p_name=>'qkr.qmdr'
);
 
end;
/
prompt --application/restful_services/qkr_qmdr
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(39845198190011563947)
,p_name=>'qkr.qmdr'
,p_uri_prefix=>'qmdr/'
,p_parsing_schema=>'QMDR'
,p_items_per_page=>25
,p_status=>'PUBLISHED'
,p_row_version_number=>39
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(39892734592624876247)
,p_module_id=>wwv_flow_api.id(39845198190011563947)
,p_uri_template=>'csvdqm/{id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(39892833893207880702)
,p_template_id=>wwv_flow_api.id(39892734592624876247)
,p_source_type=>'QUERY'
,p_format=>'CSV'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- For Naresh, Nicole, Wang, Almutiry models ONLY all together now:',
'SELECT AAV.LS_NAMESPACE_ASSET_ID,',
'        AAV.LS_NAMESPACE_LABEL,',
'        LEVEL AS TREE_LEVEL,',
'        SYS_CONNECT_BY_PATH(RS_ASSET_LABEL || ''->'' || LS_ASSET_LABEL, ''^'') AS PATH,',
'        AV.ASSET_DSC AS MEASURE_ASSET_DESCRIPTION',
'   FROM ASSET_ASSOC_V AAV JOIN ASSET_V AV',
'     ON AAV.LS_ASSET_ID = AV.ASSET_ID',
'  WHERE AAV.LS_NAMESPACE_ASSET_ID = :id',
'    AND AAV.RS_NAMESPACE_ASSET_ID = :id',
'    AND AAV.ASSOC_ASSET_ID = 10014',
'CONNECT BY NOCYCLE PRIOR RS_ASSET_ID = LS_ASSET_ID',
'  ORDER BY LS_NAMESPACE_LABEL, PATH'))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(39892833926620882939)
,p_handler_id=>wwv_flow_api.id(39892833893207880702)
,p_name=>'ID'
,p_bind_variable_name=>'ID'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(39892858112769265367)
,p_module_id=>wwv_flow_api.id(39845198190011563947)
,p_uri_template=>'csvdqms/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(39892836812725893324)
,p_template_id=>wwv_flow_api.id(39892858112769265367)
,p_source_type=>'QUERY'
,p_format=>'CSV'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Select ASSET_ID,ASSET_LABEL,ASSET_DSC,ASSET_NAMESPACE_ASSET_ID,ASSET_ACTIVATE_DT  ',
'From ASSET',
'WHERE ASSET_TYPE_ASSET_ID=10001'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(39892877627586280511)
,p_module_id=>wwv_flow_api.id(39845198190011563947)
,p_uri_template=>'csvjdqo/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(39892888994248283128)
,p_template_id=>wwv_flow_api.id(39892877627586280511)
,p_source_type=>'QUERY'
,p_format=>'CSV'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- For Johnson Data Quality Ontology Only --',
'SELECT AAV.LS_NAMESPACE_ASSET_ID,',
'        AAV.LS_NAMESPACE_LABEL,',
'        LEVEL AS TREE_LEVEL,',
'        SYS_CONNECT_BY_PATH(RS_ASSET_LABEL || ''->'' || LS_ASSET_LABEL, ''^'') AS PATH',
'        --AV.ASSET_DSC AS MEASURE_ASSET_DESCRIPTION',
'   FROM ASSET_ASSOC_V AAV JOIN ASSET_V AV',
'     ON AAV.LS_ASSET_ID = AV.ASSET_ID',
'  WHERE AAV.LS_NAMESPACE_ASSET_ID = 10000008',
'    AND AAV.RS_NAMESPACE_ASSET_ID = 10000008',
'    AND AAV.ASSOC_ASSET_ID = 10014',
'    AND LEVEL > 1',
'CONNECT BY NOCYCLE PRIOR LS_ASSET_ID = RS_ASSET_ID',
'  ORDER BY LS_NAMESPACE_LABEL, PATH'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(39892946689829286765)
,p_module_id=>wwv_flow_api.id(39845198190011563947)
,p_uri_template=>'csvkdqm/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(39892954110887294025)
,p_template_id=>wwv_flow_api.id(39892946689829286765)
,p_source_type=>'QUERY'
,p_format=>'CSV'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- For Kahn''s Data Quality Model -- ',
'SELECT  ASSET_NAMESPACE_LABEL, ',
'        ASSET_LABEL,',
'        ASSET_TYPE_LABEL,',
'        LEVEL AS TREE_LEVEL,',
'        SYS_CONNECT_BY_PATH(ASSET_LABEL,''^'') AS PATH',
'  FROM ASSET_V',
'  WHERE LEVEL > 1',
'  AND ASSET_NAMESPACE_ASSET_ID=10000021',
'CONNECT BY NOCYCLE PRIOR ASSET_ID = ASSET_TYPE_ASSET_ID',
'  ORDER BY ASSET_NAMESPACE_LABEL, PATH'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(39845861695923735990)
,p_module_id=>wwv_flow_api.id(39845198190011563947)
,p_uri_template=>'dqm/{id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(39846029348232758383)
,p_template_id=>wwv_flow_api.id(39845861695923735990)
,p_source_type=>'QUERY'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- For Naresh, Nicole, Wang, Almutiry models ONLY all together now:',
'SELECT AAV.LS_NAMESPACE_ASSET_ID,',
'        AAV.LS_NAMESPACE_LABEL,',
'        LEVEL AS TREE_LEVEL,',
'        SYS_CONNECT_BY_PATH(RS_ASSET_LABEL || ''->'' || LS_ASSET_LABEL, ''^'') AS PATH,',
'        AV.ASSET_DSC AS MEASURE_ASSET_DESCRIPTION',
'   FROM ASSET_ASSOC_V AAV JOIN ASSET_V AV',
'     ON AAV.LS_ASSET_ID = AV.ASSET_ID',
'  WHERE AAV.LS_NAMESPACE_ASSET_ID = :id',
'    AND AAV.RS_NAMESPACE_ASSET_ID = :id',
'    AND AAV.ASSOC_ASSET_ID = 10014',
'CONNECT BY NOCYCLE PRIOR RS_ASSET_ID = LS_ASSET_ID',
'  ORDER BY LS_NAMESPACE_LABEL, PATH'))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(39846021660647387577)
,p_handler_id=>wwv_flow_api.id(39846029348232758383)
,p_name=>'ID'
,p_bind_variable_name=>'ID'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(39845198231967563947)
,p_module_id=>wwv_flow_api.id(39845198190011563947)
,p_uri_template=>'dqms/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(39845198326580563948)
,p_template_id=>wwv_flow_api.id(39845198231967563947)
,p_source_type=>'QUERY'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Select ASSET_ID,ASSET_LABEL,ASSET_DSC,ASSET_NAMESPACE_ASSET_ID,ASSET_ACTIVATE_DT  ',
'From ASSET',
'WHERE ASSET_TYPE_ASSET_ID=10001'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(39846268519699804386)
,p_module_id=>wwv_flow_api.id(39845198190011563947)
,p_uri_template=>'jdqo/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(39846343666940822537)
,p_template_id=>wwv_flow_api.id(39846268519699804386)
,p_source_type=>'QUERY'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- For Johnson Data Quality Ontology Only --',
'SELECT AAV.LS_NAMESPACE_ASSET_ID,',
'        AAV.LS_NAMESPACE_LABEL,',
'        LEVEL AS TREE_LEVEL,',
'        SYS_CONNECT_BY_PATH(RS_ASSET_LABEL || ''->'' || LS_ASSET_LABEL, ''^'') AS PATH',
'        --AV.ASSET_DSC AS MEASURE_ASSET_DESCRIPTION',
'   FROM ASSET_ASSOC_V AAV JOIN ASSET_V AV',
'     ON AAV.LS_ASSET_ID = AV.ASSET_ID',
'  WHERE AAV.LS_NAMESPACE_ASSET_ID = 10000008',
'    AND AAV.RS_NAMESPACE_ASSET_ID = 10000008',
'    AND AAV.ASSOC_ASSET_ID = 10014',
'    AND LEVEL > 1',
'CONNECT BY NOCYCLE PRIOR LS_ASSET_ID = RS_ASSET_ID',
'  ORDER BY LS_NAMESPACE_LABEL, PATH'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(39846701792080487815)
,p_module_id=>wwv_flow_api.id(39845198190011563947)
,p_uri_template=>'kdqm/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(39846747955227493503)
,p_template_id=>wwv_flow_api.id(39846701792080487815)
,p_source_type=>'QUERY'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- For Kahn''s Data Quality Model -- ',
'SELECT  ASSET_NAMESPACE_LABEL, ',
'        ASSET_LABEL,',
'        ASSET_TYPE_LABEL,',
'        LEVEL AS TREE_LEVEL,',
'        SYS_CONNECT_BY_PATH(ASSET_LABEL,''^'') AS PATH',
'  FROM ASSET_V',
'  WHERE LEVEL > 1',
'  AND ASSET_NAMESPACE_ASSET_ID=10000021',
'CONNECT BY NOCYCLE PRIOR ASSET_ID = ASSET_TYPE_ASSET_ID',
'  ORDER BY ASSET_NAMESPACE_LABEL, PATH',
''))
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
