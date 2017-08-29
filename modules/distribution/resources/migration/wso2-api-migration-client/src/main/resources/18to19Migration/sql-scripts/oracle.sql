ALTER TABLE AM_APPLICATION_KEY_MAPPING ADD CREATE_MODE VARCHAR2(30) DEFAULT 'CREATED'
/
ALTER TABLE AM_API_LC_EVENT MODIFY USER_ID VARCHAR2(255)
/
ALTER TABLE AM_APPLICATION_REGISTRATION ADD TOKEN_SCOPE VARCHAR2(256) DEFAULT 'default'
/
ALTER TABLE AM_APPLICATION_REGISTRATION ADD INPUTS VARCHAR2(256)
/
ALTER TABLE AM_APPLICATION ADD GROUP_ID VARCHAR2(100)
/
ALTER TABLE AM_APPLICATION MODIFY NAME VARCHAR2(100)
/
ALTER TABLE AM_SUBSCRIBER MODIFY USER_ID VARCHAR2(255)
/
ALTER TABLE AM_API ADD CONTEXT_TEMPLATE VARCHAR2(256)
/
UPDATE AM_API SET CONTEXT_TEMPLATE = CONTEXT WHERE CONTEXT_TEMPLATE IS NULL
/
UPDATE AM_API SET CONTEXT = concat(CONTEXT,concat('/',API_VERSION)) WHERE CONTEXT NOT LIKE concat('%', API_VERSION)
/
UPDATE IDN_OAUTH2_ACCESS_TOKEN SET TOKEN_SCOPE = concat(TOKEN_SCOPE, concat(' ', 'am_application_scope')) WHERE USER_TYPE = 'APPLICATION' AND TOKEN_SCOPE NOT LIKE '%am_application_scope%'
/
UPDATE IDN_OAUTH2_ACCESS_TOKEN SET VALIDITY_PERIOD = -2000 WHERE VALIDITY_PERIOD = 9223372036854775807
/
ALTER TABLE AM_API ADD (CREATED_BY VARCHAR2(100), CREATED_TIME DATE, UPDATED_BY VARCHAR2(100), UPDATED_TIME DATE)
/
ALTER TABLE AM_SUBSCRIBER ADD (CREATED_BY VARCHAR2(100), CREATED_TIME DATE, UPDATED_BY VARCHAR2(100), UPDATED_TIME DATE)
/
ALTER TABLE AM_SUBSCRIPTION ADD (CREATED_BY VARCHAR2(100), CREATED_TIME DATE, UPDATED_BY VARCHAR2(100), UPDATED_TIME DATE)
/
ALTER TABLE AM_APPLICATION ADD (CREATED_BY VARCHAR2(100), CREATED_TIME DATE, UPDATED_BY VARCHAR2(100), UPDATED_TIME DATE)
/