/*
 Navicat Premium Data Transfer

 Source Server         : RDS-PG10
 Source Server Type    : PostgreSQL
 Source Server Version : 100100
 Source Host           : pgm-bp1fxq2367q5a8m5to.pg.rds.aliyuncs.com
 Source Database       : usercenter
 Source Schema         : uc

 Target Server Type    : PostgreSQL
 Target Server Version : 100100
 File Encoding         : utf-8

 Date: 11/07/2018 21:24:04 PM
*/

-- ----------------------------
--  Table structure for user_corp_employee
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_corp_employee";
CREATE TABLE "uc"."user_corp_employee" (
  "id"           SERIAL8,
  "gmt_create"   TIMESTAMP(6) NOT NULL,
  "gmt_modified" TIMESTAMP(6) NOT NULL,
  "tenant_id"    VARCHAR(45) COLLATE "default",
  "app_id"       VARCHAR(128) NOT NULL COLLATE "default",
  "corp_id"      INT4         NOT NULL,
  "user_id"      INT4         NOT NULL,
  "emp_id"       VARCHAR(45)  NOT NULL COLLATE "default"
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_corp_employee"
  OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_corp_org
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_corp_org";
CREATE TABLE "uc"."user_corp_org" (
  "id"           SERIAL8,
  "gmt_create"   TIMESTAMP(6) NOT NULL,
  "gmt_modified" TIMESTAMP(6) NOT NULL,
  "tenant_id"    VARCHAR(45) COLLATE "default",
  "app_id"       VARCHAR(128) NOT NULL COLLATE "default",
  "corp_id"      INT4         NOT NULL,
  "org_id"       INT4         NOT NULL
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_corp_org"
  OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_corp_wg
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_corp_wg";
CREATE TABLE "uc"."user_corp_wg" (
  "id"           SERIAL8,
  "gmt_create"   TIMESTAMP(6) NOT NULL,
  "gmt_modified" TIMESTAMP(6) NOT NULL,
  "tenant_id"    VARCHAR(45) COLLATE "default",
  "app_id"       VARCHAR(128) NOT NULL COLLATE "default",
  "corp_id"      INT4         NOT NULL,
  "wg_id"        INT4         NOT NULL
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_corp_wg"
  OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_corporation
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_corporation";
CREATE TABLE "uc"."user_corporation" (
  "id"                SERIAL8,
  "gmt_create"        TIMESTAMP(6) NOT NULL,
  "gmt_modified"      TIMESTAMP(6) NOT NULL,
  "tenant_id"         VARCHAR(45) COLLATE "default",
  "app_id"            VARCHAR(128) NOT NULL COLLATE "default",
  "user_id"           INT4         NOT NULL,
  "corp_id"           INT4         NOT NULL,
  "corp_name"         VARCHAR(45) COLLATE "default",
  "corp_licensecode"  VARCHAR(45) COLLATE "default",
  "corp_licese"       VARCHAR(45) COLLATE "default",
  "certificationtype" VARCHAR(45) COLLATE "default",
  "corp_type"         VARCHAR(45) COLLATE "default",
  "corp_addressid"    INT4,
  "corp_linkman"      VARCHAR(45) COLLATE "default",
  "corp_linktel"      VARCHAR(45) COLLATE "default",
  "corp_email"        VARCHAR(45) COLLATE "default",
  "corp_weburl"       VARCHAR(45) COLLATE "default",
  "corp_credential"   VARCHAR(45) COLLATE "default",
  "corp_creator"      VARCHAR(45) COLLATE "default",
  "corp_startdate"    TIMESTAMP(6) NULL,
  "corp_enddate"      VARCHAR(45) COLLATE "default",
  "corp_status"       VARCHAR(45) COLLATE "default",
  "corp_area"         VARCHAR(45) COLLATE "default",
  "corp_industry"     VARCHAR(45) COLLATE "default",
  "corp_extention"    JSON
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_corporation"
  OWNER TO "postgres";

COMMENT ON COLUMN "uc"."user_corporation"."certificationtype" IS '认证类型:1:三证合一2:三证合一(一照一码)3:三证分离';

-- ----------------------------
--  Table structure for user_employee
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_employee";
CREATE TABLE "uc"."user_employee" (
  "id"                SERIAL8,
  "gmt_create"        TIMESTAMP(6) NOT NULL,
  "gmt_modified"      TIMESTAMP(6) NOT NULL,
  "tenant_id"         VARCHAR(45) COLLATE "default",
  "app_id"            VARCHAR(128) NOT NULL COLLATE "default",
  "user_id"           INT4         NULL,
  "account_id"        INT8         NOT NULL,
  "emp_id"            INT4         NOT NULL,
  "emp_code"          VARCHAR(128) COLLATE "default",
  "emp_name"          VARCHAR(128) COLLATE "default",
  "emp_ename"         VARCHAR(128) COLLATE "default",
  "emp_sex"           INT4,
  "emp_birthday"      TIMESTAMP(6) NULL,
  "position"          VARCHAR(45) COLLATE "default",
  "emp_status"        VARCHAR(45) COLLATE "default",
  "emp_idtype"        VARCHAR(45) COLLATE "default",
  "emp_idnumber"      VARCHAR(45) COLLATE "default",
  "joindate"          TIMESTAMP(6) NULL,
  "exitdate"          TIMESTAMP(6) NULL,
  "office_tel"        VARCHAR(45) COLLATE "default",
  "office_address_id" INT4,
  "office_code"       VARCHAR(45) COLLATE "default",
  "office_email"      VARCHAR(128) COLLATE "default",
  "fax"               VARCHAR(45) COLLATE "default",
  "emp_phone"         VARCHAR(45) COLLATE "default",
  "socialact"         VARCHAR(45) COLLATE "default",
  "home_tel"          VARCHAR(45) COLLATE "default",
  "home_address_id"   INT4,
  "home_zipcode"      VARCHAR(45) COLLATE "default",
  "party"             VARCHAR(45) COLLATE "default",
  "degress"           VARCHAR(45) COLLATE "default",
  "major"             VARCHAR(45) COLLATE "default",
  "workexp"           VARCHAR(128) COLLATE "default",
  "regdate"           TIMESTAMP(6) NULL,
  "emp_remark"        VARCHAR(45) COLLATE "default",
  "emp_extension"     JSON
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_employee"
  OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_ext
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_ext";
CREATE TABLE "uc"."user_ext" (
  "id"           SERIAL8,
  "gmt_create"   TIMESTAMP(6) NOT NULL,
  "gmt_modified" TIMESTAMP(6) NOT NULL,
  "tenant_id"    VARCHAR(45) COLLATE "default",
  "app_id"       VARCHAR(128) NOT NULL COLLATE "default",
  "user_id"      INT4         NOT NULL,
  "key"          VARCHAR(45) COLLATE "default",
  "value"        VARCHAR(128) COLLATE "default"
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_ext"
  OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_org_employee
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_org_employee";
CREATE TABLE "uc"."user_org_employee" (
  "id"           SERIAL8,
  "gmt_create"   TIMESTAMP(6) NOT NULL,
  "gmt_modified" TIMESTAMP(6) NOT NULL,
  "tenant_id"    VARCHAR(45) COLLATE "default",
  "app_id"       VARCHAR(128) NOT NULL COLLATE "default",
  "org_id"       INT4         NOT NULL,
  "emp_id"       INT4         NOT NULL
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_org_employee"
  OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_organization
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_organization";
CREATE TABLE "uc"."user_organization" (
  "id"            SERIAL8,
  "gmt_create"    TIMESTAMP(6) NOT NULL,
  "gmt_modified"  TIMESTAMP(6) NOT NULL,
  "tenant_id"     VARCHAR(45) COLLATE "default",
  "app_id"        VARCHAR(128) NOT NULL COLLATE "default",
  "account_id"    INT4         NULL,
  "org_id"        INT4         NOT NULL,
  "org_code"      VARCHAR(45) COLLATE "default",
  "org_name"      VARCHAR(45) COLLATE "default",
  "org_level"     VARCHAR(45) COLLATE "default",
  "org_degree"    VARCHAR(45) COLLATE "default",
  "parentorg_id"  INT4,
  "org_seq"       VARCHAR(45) COLLATE "default",
  "org_type"      VARCHAR(45) COLLATE "default",
  "org_addressid" INT4,
  "org_linkman"   VARCHAR(45) COLLATE "default",
  "org_linktel"   VARCHAR(45) COLLATE "default",
  "org_email"     VARCHAR(45) COLLATE "default",
  "org_weburl"    VARCHAR(45) COLLATE "default",
  "org_startdate" TIMESTAMP(6) NULL,
  "org_enddate"   TIMESTAMP(6) NULL,
  "org_status"    VARCHAR(45) COLLATE "default",
  "org_area"      VARCHAR(45) COLLATE "default",
  "is_leaf"       VARCHAR(45) COLLATE "default",
  "org_remark"    VARCHAR(45) COLLATE "default"
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_organization"
  OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_payinfo
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_payinfo";
CREATE TABLE "uc"."user_payinfo" (
  "id"           SERIAL8,
  "gmt_create"   TIMESTAMP(6) NOT NULL,
  "gmt_modified" TIMESTAMP(6) NOT NULL,
  "tenant_id"    VARCHAR(45) COLLATE "default",
  "app_id"       VARCHAR(128) NOT NULL COLLATE "default",
  "user_id"      INT4         NOT NULL,
  "payaccount"   VARCHAR(128) COLLATE "default",
  "accounttype"  VARCHAR(45) COLLATE "default",
  "accountinfo"  VARCHAR(45) COLLATE "default"
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_payinfo"
  OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_tag
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_tag";
CREATE TABLE "uc"."user_tag" (
  "id"           SERIAL8,
  "gmt_create"   TIMESTAMP(6) NOT NULL,
  "gmt_modified" TIMESTAMP(6) NOT NULL,
  "tenant_id"    VARCHAR(45) COLLATE "default",
  "app_id"       VARCHAR(128) NOT NULL COLLATE "default",
  "user_id"      INT4         NOT NULL,
  "tag"          VARCHAR(128) COLLATE "default"
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_tag"
  OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_thirdpartaccount
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_thirdpartaccount";
CREATE TABLE "uc"."user_thirdpartaccount" (
  "id"                       SERIAL8,
  "gmt_create"               TIMESTAMP(6) NOT NULL,
  "gmt_modified"             TIMESTAMP(6) NOT NULL,
  "tenant_id"                VARCHAR(45) COLLATE "default",
  "app_id"                   VARCHAR(128) NOT NULL COLLATE "default",
  "user_id"                  INT8         NOT NULL,
  "thirdpart_sign"           VARCHAR(45) COLLATE "default",
  "thirdpart_id"             VARCHAR(45) COLLATE "default",
  "thirdpart_auth"           VARCHAR(45) COLLATE "default",
  "user_thirdpartaccountcol" VARCHAR(45) COLLATE "default"
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_thirdpartaccount"
  OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_user
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_user";
CREATE TABLE "uc"."user_user" (
  "id"             SERIAL8,
  "gmt_create"     TIMESTAMP(6) NOT NULL,
  "gmt_modified"   TIMESTAMP(6) NOT NULL,
  "tenant_id"      VARCHAR(45) COLLATE "default",
  "app_id"         VARCHAR(128) NOT NULL COLLATE "default",
  "user_id"        INT4         NOT NULL,
  "realname"       VARCHAR(45) COLLATE "default",
  "sex"            INT4,
  "nationality"    VARCHAR(45) COLLATE "default",
  "birthday"       TIMESTAMP(6) NULL,
  "address_id"     VARCHAR(45) COLLATE "default",
  "idtype"         VARCHAR(45) COLLATE "default",
  "idnumber"       VARCHAR(45) COLLATE "default",
  "occupation"     VARCHAR(128) COLLATE "default",
  "hobby"          VARCHAR(128) COLLATE "default",
  "user_extention" JSON
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_user"
  OWNER TO "postgres";


COMMENT ON COLUMN "uc"."user_user"."address_id" IS '家庭住址';
COMMENT ON COLUMN "uc"."user_user"."idtype" IS '证件类型';
COMMENT ON COLUMN "uc"."user_user"."idnumber" IS '证件号码';
COMMENT ON COLUMN "uc"."user_user"."occupation" IS '职业';
COMMENT ON COLUMN "uc"."user_user"."hobby" IS '爱好';
COMMENT ON COLUMN "uc"."user_user"."user_extention" IS '用户扩展字段';

-- ----------------------------
--  Table structure for user_wg_employee
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_wg_employee";
CREATE TABLE "uc"."user_wg_employee" (
  "id"           SERIAL8,
  "gmt_create"   TIMESTAMP(6) NOT NULL,
  "gmt_modified" TIMESTAMP(6) NOT NULL,
  "tenant_id"    VARCHAR(45) COLLATE "default",
  "app_id"       VARCHAR(128) NOT NULL COLLATE "default",
  "wg_id"        INT4         NOT NULL,
  "user_id"      INT4         NOT NULL,
  "emp_id"       VARCHAR(45)  NOT NULL COLLATE "default"
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_wg_employee"
  OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_workgroup
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_workgroup";
CREATE TABLE "uc"."user_workgroup" (
  "id"           SERIAL8,
  "gmt_create"   TIMESTAMP(6) NOT NULL,
  "gmt_modified" TIMESTAMP(6) NOT NULL,
  "tenant_id"    VARCHAR(45) COLLATE "default",
  "app_id"       VARCHAR(128) NOT NULL COLLATE "default",
  "wg_id"        INT4         NOT NULL,
  "wg_code"      VARCHAR(45) COLLATE "default",
  "wg_name"      VARCHAR(45) COLLATE "default",
  "wg_desc"      VARCHAR(128) COLLATE "default",
  "wg_owner"     VARCHAR(45) COLLATE "default",
  "wg_email"     VARCHAR(45) COLLATE "default",
  "wg_tel"       VARCHAR(45) COLLATE "default",
  "wg_type"      VARCHAR(45) COLLATE "default",
  "wg_status"    VARCHAR(45) COLLATE "default",
  "wg_remark"    VARCHAR(128) COLLATE "default"
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_workgroup"
  OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_account";
CREATE TABLE "uc"."user_account" (
  "id"           SERIAL8,
  "gmt_create"   TIMESTAMP(6) NOT NULL,
  "gmt_modified" TIMESTAMP(6) NOT NULL,
  "tenant_id"    VARCHAR(128) COLLATE "default",
  "app_id"       VARCHAR(128) NOT NULL COLLATE "default",
  "user_id"      INT4         NULL,
  "username"     VARCHAR(128) NOT NULL COLLATE "default",
  "password"     VARCHAR(128) NOT NULL COLLATE "default",
  "nickname"     VARCHAR(45) COLLATE "default",
  "photo"        VARCHAR(45) COLLATE "default",
  "pwinvaldate"  TIMESTAMP(6) NULL,
  "authmode"     VARCHAR(45) COLLATE "default",
  "status"       INT4 DEFAULT 0,
  "type"         VARCHAR(45) COLLATE "default",
  "phone"        VARCHAR(45) COLLATE "default",
  "email"        VARCHAR(128) COLLATE "default",
  "lastlogin"    TIMESTAMP(6) NULL,
  "errcount"     INT4,
  "validtime"    VARCHAR(128) COLLATE "default",
  "createtime"   TIMESTAMP(6) NULL,
  "createuser"   VARCHAR(64) COLLATE "default",
  "extention"    JSON
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_account"
  OWNER TO "postgres";
ALTER TABLE uc.user_account
  ADD id_card_num CHARACTER VARYING(32) NULL;
ALTER TABLE uc.user_account
  ADD channel_id CHARACTER VARYING(8) NULL;
ALTER TABLE uc.user_account
  ADD COLUMN pwd_alg CHARACTER VARYING(16);
ALTER TABLE uc.user_account
  ADD COLUMN business_id INT8 DEFAULT 0;
CREATE INDEX username_idx
  ON uc.user_account (username);

create unique index idx_unq_username on uc.user_account using btree (username);

COMMENT ON COLUMN "uc"."user_account"."status" IS '正常、锁定、注销';
COMMENT ON COLUMN "uc"."user_account"."type" IS '个人账号和企业账号';

-- ----------------------------
--  Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_address";
CREATE TABLE "uc"."user_address" (
  "id"           SERIAL8,
  "gmt_create"   TIMESTAMP(6) NOT NULL,
  "gmt_modified" TIMESTAMP(6) NOT NULL,
  "tenant_id"    VARCHAR(45) COLLATE "default",
  "app_id"       VARCHAR(128) NOT NULL COLLATE "default",
  "user_id"      INT4         NOT NULL,
  "address_id"   INT4         NOT NULL,
  "type"         VARCHAR(45) COLLATE "default",
  "state"        VARCHAR(45) COLLATE "default",
  "province"     VARCHAR(45) COLLATE "default",
  "city"         VARCHAR(45) COLLATE "default",
  "district"     VARCHAR(45) COLLATE "default",
  "street"       VARCHAR(45) COLLATE "default",
  "detail"       VARCHAR(256) COLLATE "default",
  "zipcode"      VARCHAR(45) COLLATE "default",
  "consignee"    VARCHAR(45) COLLATE "default",
  "phone"        VARCHAR(45) COLLATE "default",
  "telephone"    VARCHAR(45) COLLATE "default"
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_address"
  OWNER TO "postgres";


COMMENT ON COLUMN "uc"."user_address"."type" IS '住址0收货地址1默认收货2';
COMMENT ON COLUMN "uc"."user_address"."consignee" IS '收货人';

-- ----------------------------
--  Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS "uc"."user_authorization";
CREATE TABLE "uc"."user_authorization" (
  "id"                 SERIAL8,
  "gmt_create"         TIMESTAMP(6) NOT NULL,
  "gmt_modified"       TIMESTAMP(6) NOT NULL,
  "tenant_id"          VARCHAR(45) COLLATE "default",
  "app_id"             VARCHAR(128) NOT NULL COLLATE "default",
  "org_id"             INT8         NULL,
  "account_id"         INT8         NULL,
  "type"               VARCHAR(45) COLLATE "default",
  "authorization_info" JSON
)
WITH (OIDS = FALSE
);
ALTER TABLE "uc"."user_authorization"
  OWNER TO "postgres";


COMMENT ON COLUMN "uc"."user_authorization"."type" IS '权限类型，00，组织，01，用户';
