# 1 概述
## 1.1 产品概述及目标
用户中心是企业做数字化转型的重要一环，其承载了面向用户以及组织结构的全生命周期管理。同时基于用户中心扩展的会员管理也是企业做会员运营的重要部分；通过统一的用户管理给用户一个线上线下统一的品牌感知。同时基于会员进行画像，进行精准的会员营销；

用户中心，致力于拉通线上线下的用户体系，提供统一的用户生命周期管理服务。包括用户注册、登陆、信息查询、会员等级、会员积分、会员权益、会员标签（画像）等；基于用户中心提供的服务能力，应用开发商（ISV）可以快速构建业务系统（CRM、B2C等）；其中涉及会员的积分、等级、权益等信息放在第二阶段实现；

## 1.2 名词说明

| CRM | 客户关系管理系统 |
| --- | --- |
| DDD | 领域驱动设计|
|     |     |


 
## 1.3文档阅读对象
主要包括服务中心需求、设计、以及开发测试人员，同时包括服务中心的使用者；
 
 
# 2概要设计
## 2.1业务模型
### 2.1.1模型需求说明
* 账户全生命周期管理，支持线上线下账户注册机制，提供面向会员的基本、扩展信息的采集、维护和查询，通过会员的忠诚度管理机制，更好的运营会员体系。最终达到会员的可识别、可跟踪、可运营、可分析等目的；
* 统一的会员注册、认证、信息更新和查询机制；
* 会员账号可以与第三方社会化会员体系打通；
* 建立会员成长周期模型（等级体系、积分模型）；
* 企业组织机构的管理，拉通企业内部组织机构和员工信息；
* 自定义动态标签能力；
 
### 2.1.2典型场景分析
1. __电商场景下，涉及用户信息主要包括几个部分：__
* 前台网站，主要涵盖个人和企业用户的注册、用户的登陆、用户信息的查询、用户信息的更新、会员积分、等级等查询；
* 后台运营，主要负责后台用户（不同角色授权）的管理，同时用户运营人员会对用户创建、查询、状态变更、打标去标、会员积分等级等进行管理；

![image.png | center | 721x294](https://cdn.nlark.com/lark/0/2018/png/78364/1534082412987-fe2818bd-6f36-48ce-8428-9ac323ddb542.png "")


1. __企业管理应用场景下，涉及用户信息主要包括几个部分：__
* 组织机构管理，主要涵盖组织机构树的管理、员工的管理、组织结构和员工的关联关系、工作组的管理、以及工作组和员工的关系，员工和用户的关联关系；
* 权限的管理，根据组织结构参与者通过角色对资源进行访问授权（不在用户中心范围）；
   

![image.png | center | 721x294](https://cdn.nlark.com/lark/0/2018/png/78364/1534082599806-d729bc58-f8dd-477e-9275-d5ac15850831.png "")

 
### 2.1.3模型概念说明
根据以上的典型场景，主要抽象的业务模型分为两大类，包括用户全生命周期管理和组织结构的管理：
1. __用户全生命周期的管理，主要包括用户注册和注销，冻结和解冻，信息的变更、用户治理、用户运营和第三方链接等内容；__


![image.png | left | 747x318](https://cdn.nlark.com/lark/0/2018/png/78364/1534082700443-2e01369f-a7f6-41ab-92bd-4ee975e3e7c4.png "")


1. __ 组织机构的管理，主要包括企业信息的管理，组织结构的管理、工作组的管理、员工的管理等内容；__



![image.png | left | 747x335](https://cdn.nlark.com/lark/0/2018/png/78364/1534082718517-4dce831b-e08a-4ab7-862c-685c1a45c3a6.png "")


## 2.2领域模型


![image.png | left](https://cdn.nlark.com/lark/0/2018/png/78364/1534082740314-76a549c5-06f6-4eea-9361-8ace872d5430.png "")

实体以及实体关系描述：
* 账号：主要作为系统管理和认证的基本单元，包括名称、密码、手机、邮箱等基本信息；
* 用户：扩展自账号，分为个人用户和企业用户；个人用户主要包括，用户姓名、性别、国籍、地址等信息。企业用户主要包括，企业名称、纳税人识别号、营业执照号码等等；
* 会员：和用户是一对一的关系，根据用户交易等其他规则，进行会员积分、等级、权益、打标等运营；
* 员工：扩展自账号，和账号是一对一的关系，主要描述员工的信息，包括员工姓名、工号、入职日期、职位等信息；
* 机构：机构能够下面再挂机构，形成组织机构树。机构可以加入员工；
* 工作组：可以建立工作组，工作组可以加入员工；工作组主要包括，名称，群主等；
* 企业：企业关联用户中的企业信息，一个企业下面可以包含多个组织机构和工作组；企业中可以加入员工；

## 2.3分层架构


![image.png | left | 747x512](https://cdn.nlark.com/lark/0/2018/png/78364/1534082789207-bf0d114a-e76a-4405-b711-903feb421fdf.png "")

架构主要分为几个层次：分别是App层，Domain层和Infrastructure层。
* App层：主要负责获取输入，组装上下文，做输入校验，发送消息给领域层做业务处理，这层内容不在服务中心中体现，但服务中心会提供一个SDK给App层使用；
* Domain层：主要是通过领域服务（Domain Service），领域对象（Domain Object）的交互，对上层提供业务逻辑的处理，然后调用下层Repository做持久化处理；DomainService作为服务中心对外服务提供的主体。
* Infrastructure层：主要包含Repository，Config，Common和message，Repository负责数据的CRUD操作； Config负责应用的配置；Common是一些工具类； Message通信的也应该放在这一层。服务中心的数据库操作、配置和消息通讯主要在这一层。

## 2.4数据模型


![image.png | left | 747x944](https://cdn.nlark.com/lark/0/2018/png/78364/1534082827123-1645d5ab-81d5-42dd-af80-711f042c0b2a.png "")

 
用户中心包含的数据：
* 账号基本信息，比如ID，手机号码、email、登录名、密码等；
* 用户基本信息，比如姓名、性别、身份信息等；
* 用户扩展信息，可以根据需要进行信息的扩展；
* 企业基本信息，比如企业名称、地址、账户等信息；
* 用户标签信息，主要记录账号对应的标签信息；
* 第三方关联账号信息等；
* 员工基本信息，包括员工工号，职位，工作描述等；
* 组织机构信息，包括组织机构上下级关系，组织机构描述等；组织结构人员关联关系等；
* 工作组信息，包括工作组编号，管理员，工作组包含的员工信息等；
 
# 3数据库设计
## 3.1数据库表设计
1)user\_account

| 字段 | 类型 | 说明 | 非空 | 主键 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | bigint |   | 是 | 是 | AI |
| gmt_create | datetime | 创建时间 | 是 |   |   |
| gmt_modified | datetime | 更新时间 | 是 |   |   |
| tenant\_id | varchar(128) | 租户id |   |   |   |
| appid | varchar(128) | 应用id | 是 |   |   |
| user\_id | bigint(20) | 用户id | 是 |  |   |
| user\_name | varchar(128) | 登陆名 | 是 |  |   |
| password | varchar(128) | 密码 | 是 |   |   |
| pwinvaldate | datetime | 密码失效日期 |   |   |   |
| authmode | varchar(11) | 认证模式（本地、第三方等） |   |   |   |
| status| varchar(11) | 未激活、正常、冻结、注销等 |   |   |   |
| type | varchar(11) | 账号类型：个人、企业 | 是 |   |   |
| phone| varchar(11) | 手机号码 |   |   | UQ |
| email | varchar(128) | 邮箱 |   |   | UQ |
| lastlogin | datetime | 最后登陆时间 |   |   |   |
| errcount | int(11) | 密码错误次数 |   |   |   |
| validtime | varchar(128) | 定义一个规则表达式，表示允许操作的有效时间范围 |   |   |   |
| createtime | datetime | 创建时间 |   |   |   |
| createuser | varchar(64) | 创建人 |   |   |    |

2)user\_user

| 字段 | 类型 | 说明 | 非空 | 主键 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | bigint(20) |   | 是 | 是 | 自增 |
| gmt_create | datetime | 创建时间 | 是 |   |   |
| gmt_modified | datetime | 更新时间 | 是 |   |   |
| tenant\_id | varchar(128) | 租户id |   |   |   |
| app\_id | varchar(128) | 应用id | 是 |   |   |
| user\_id | bigint(20) | 分表字段 | 是 |  |   |
| realname | varchar(64) | 姓名 |   |   |   |
| sex | int(2) | 性别，男：0 女：1 |   |   |   |
| nationality | varchar(64) | 国籍 |   |   |   |
| birthday | datetime | 出生日期 |   |   |   |
| address | varchar(11) | 地址 |   |   |   |
| idtype | varchar(11) | 证件类型：身份证、护照 |   |   |   |
| idnumber | varchar(64) | 身份证号码 |   |   |   |
| occupation | varchar(128) | 职业 |   |   |   |
| hobby | varchar(128) | 爱好 |   |   |   |

 
3)user\_ext

| 字段 | 类型 | 说明 | 非空 | 主键 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | bigint(20) |   | 是 | 是 | 自增 |
| gmt_create | datetime | 创建时间 | 是 |   |   |
| gmt_modified | datetime | 更新时间 | 是 |   |   |
| tenant\_id | varchar(128) | 租户id |   |   |   |
| appid | varchar(128) | 应用id | 是 |   |   |
| user\_id | bigint(20) | 分表字段 | 是 | 是 |   |
| key | varchar(128) | 自定义属性 |   |   |   |
| value | varchar(128) | 自定义属性值 |   |   |    |

4)user\_tag

| 字段 | 类型 | 说明 | 非空 | 主键 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | bigint(20) |   | 是 | 是 | 自增 |
| gmt_create | datetime | 创建时间 | 是 |   |   |
| gmt_modified | datetime | 更新时间 | 是 |   |   |
| tenant\_id | varchar(128) | 租户id |   |   |   |
| appid | varchar(128) | 应用id | 是 |   |   |
| user\_id | bigint(20) | 用户标示 | 是 |  |   |
| tag | varchar(128) | 自定义标签 |   |   |   |

5)user\_thirdpartaccount

| 字段 | 类型 | 说明 | 非空 | 主键 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | bigint(20) |   | 是 | 是 | 自增 |
| gmt_create | datetime | 创建时间 | 是 |   |   |
| gmt_modified | datetime | 更新时间 | 是 |   |   |
| tenant\_id | varchar(128) | 租户id |   |   |   |
| appid | varchar(128) | 应用id | 是 |   |   |
| user\_id | bigint(20) | 分表字段 | 是 | 是 |   |
| thirdpart\_sign | varchar(128) | 第三方标示：微博、微信 |   |   |   |
| thirdpart\_id | varchar(128) | 账号名称 |   |   |   |
| thirdpart\_auth | varchar(128) | 认证方式：OAuth |   |   |   |

6)user\_employee

| 字段 | 类型 | 说明 | 非空 | 主键 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | bigint(20) |   | 是 | 是 | 自增 |
| gmt_create | datetime | 创建时间 | 是 |   |   |
| gmt_modified | datetime | 更新时间 | 是 |   |   |
| tenant\_id | varchar(128) | 租户id | 是 |  |   |
| appid | varchar(128) | 应用id | 是 |   |   |
| user\_id | bigint(20) | 分表字段 | 是 |  |   |
| emp\_id | varchar(128) | 员工编号 | 是 |  |   |
| emp\_code | varchar(128) | 员工代码 |   |   |   |
| emp\_name | varchar(128) | 员工姓名 |   |   |   |
| emp\_ename | varchar(128) | 员工英文全名 |   |   |   |
| emp\_sex | int(2) | 性别，男：0 女：1 |   |   |   |
| emp\_birthday | datetime | 员工出生日期 |   |   |   |
| position | varchar(64) | 员工岗位 |   |   |   |
| emp\_status | varchar(64) | 员工状态（在职、离职） |   |   |   |
| emp\_idtype | varchar(11) | 证件类型：身份证、护照 |   |   |   |
| emp\_idnumber | varchar(64) | 身份证号码 |   |   |   |
| joindate | datetime | 入职时间 |   |   |   |
| exitdate | datetime | 离职时间 |   |   |   |
| office\_tel | varchar(11) | 办公电话 |   |   |   |
| office\_address | varchar(128) | 办公地址 |   |   |   |
| office\_code | varchar(128) | 办公邮编 |   |   |   |
| office\_email | varchar(128) | 办公邮箱 |   |   |   |
| fax | varchar(128) | 传真号码 |   |   |   |
| emp\_phone | varchar(11) | 手机号 |   |   |   |
| socialact | varchar(128) | 社交账号 |   |   |   |
| home\_tel | varchar(11) | 家庭电话 |   |   |   |
| home\_address | varchar(128) | 家庭地址 |   |   |   |
| home\_zipcode | varchar(128) | 家庭邮编 |   |   |   |
| party | varchar(128) | 政治面貌 |   |   |   |
| degress | varchar(64) | 职级 |   |   |   |
| major | varchar(128) | 直接主管 |   |   |   |
| workexp | varchar(128) | 工作描述 |   |   |   |
| regdate | datetine | 注册日期 |   |   |   |
| emp\_remark | varchar(128) | 备注 |   |   |   |

7)user\_organization

| 字段 | 类型 | 说明 | 非空 | 主键 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | bigint(20) |   | 是 | 是 | 自增 |
| gmt_create | datetime | 创建时间 | 是 |   |   |
| gmt_modified | datetime | 更新时间 | 是 |   |   |
| tenant\_id | varchar(128) | 租户id | 是 |  |   |
| appid | varchar(128) | 应用id | 是 |   |   |
| org\_id | bigint(20) | 机构编号 | 是 |  |   |
| org\_code | varchar(64) | 机构代码 |   |   |   |
| org\_name | varchar(128) | 账号名称 |   |   |   |
| org\_level | varchar(128) | 机构级别 |   |   |   |
| org\_degree | varchar(128) | 机构等级 |   |   |   |
| parentorg\_id | varchar(128) | 上级机构编号 |   |   |   |
| org\_seq | varchar(64) | 序列号 |   |   |   |
| org\_type | varchar(64) | 机构类型 |   |   |   |
| org\_address | varchar(128) | 机构地址 |   |   |   |
| org\_linkman | varchar(64) | 机构联系人 |   |   |   |
| org\_linktel | varchar(64) | 联系电话 |   |   |   |
| org\_email | varchar(64) | 联系邮箱 |   |   |   |
| org\_weburl | varchar(64) | 机构网站 |   |   |   |
| org\_startdate | datetime | 生效日期 |   |   |   |
| org\_enddate | datetime | 失效日期 |   |   |   |
| org\_status | varchar(64) | 机构状态，正常、失效。 |   |   |   |
| org\_area | varchar(64) | 所属区域 |   |   |   |
| is\_leaf | int（1） | 是否是叶子结点 |   |   |   |
| org\_remark | varchar(128) | 备注 |   |   |   |

 
8)user\_workgroup

| 字段 | 类型 | 说明 | 非空 | 主键 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | bigint(20) |   | 是 | 是 | 自增 |
| gmt_create | datetime | 创建时间 | 是 |   |   |
| gmt_modified | datetime | 更新时间 | 是 |   |   |
| tenant\_id | varchar(128) | 租户id |   |   |   |
| appid | varchar(128) | 应用id | 是 |   |   |
| wg\_id | bigint(20) | 工作组编号 | 是 |  |   |
| wg\_code | varchar(64) | 工作组代码 |   |   |   |
| wg\_name | varchar(64) | 工作组名称 |   |   |   |
| wg\_desc | varchar(128) | 工作组描述 |   |   |   |
| wg\_owner | varchar(64) | 工作组负责人 |   |   |   |
| wg\_email | varchar(64) | 工作组邮箱 |   |   |   |
| wg\_tel | varchar(64) | 工作组电话 |   |   |   |
| wg\_type | varchar(64) | 工作组类型，内部群、合作群 |   |   |   |
| wg\_status | varchar(64) | 工作组状态，正常、解散 |   |   |   |
| wg\_remark | varchar(128) | 备注 |   |   |   |

 
9)user\_corporation
 

| 字段 | 类型 | 说明 | 非空 | 主键 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | bigint(20) |   | 是 | 是 | 自增 |
| gmt_create | datetime | 创建时间 | 是 |   |   |
| gmt_modified | datetime | 更新时间 | 是 |   |   |
| tenant\_id | varchar(128) | 租户id |   |   |   |
| appid | varchar(128) | 应用id | 是 |   |   |
| user\_id | bigint(20) | 分表字段 | 是 |  |   |
| corp\_id | bigint(20) | 公司编号 | 是 |  |   |
| corp\_code | varchar(64) | 公司代码 |   |   |   |
| corp\_name | varchar(128) | 公司名称 |   |   |   |
| corp\_licensecode | varchar(128) | 营业执照号 |   |   |   |
| corp\_license | varchar(128) | 营业执照 |   |   |   |
| certificationtype | varchar(128) | 认证类型:1:三证合一2:三证合一(一照一码)3:三证分离 |   |   |   |
| corp\_type | varchar(64) | 企业类型 |   |   |   |
| corp\_address | varchar(128) | 企业地址 |   |   |   |
| corp\_linkman | varchar(64) | 企业联系人 |   |   |   |
| corp\_linktel | varchar(64) | 联系电话 |   |   |   |
| corp\_email | varchar(64) | 联系邮箱 |   |   |   |
| corp\_weburl | varchar(64) | 企业网站 |   |   |   |
| corp\_credential | varchar(128) | 企业法人证件 |   |   |   |
| corp\_creator | varchar(128) | 创建者 |   |   |   |
| corp\_startdate | datetime | 生效日期 |   |   |   |
| corp\_enddate | datetime | 失效日期 |   |   |   |
| corp\_status | varchar(64) | 机构状态，正常、失效。 |   |   |   |
| corp\_area | varchar(64) | 所属城市 |   |   |   |
| corp\_industry | varchar(64) | 所属行业 |   |   |   |

 
10)user\_org\_employee

| 字段 | 类型 | 说明 | 非空 | 主键 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | bigint(20) |   | 是 | 是 | 自增 |
| gmt_create | datetime | 创建时间 | 是 |   |   |
| gmt_modified | datetime | 更新时间 | 是 |   |   |
| tenant\_id | varchar(128) | 租户id |   |   |   |
| appid | varchar(128) | 应用id | 是 |   |   |
| org\_id | bigint(20) | 机构编号 |   |   |   |
| user\_id | bigint(20) | 分表字段 |   |   |   |
| emp\_id | varchar(128) | 员工编号 |   |   |   |

 
11)user\_wg\_employee

| 字段 | 类型 | 说明 | 非空 | 主键 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | bigint(20) |   | 是 | 是 | 自增 |
| gmt_create | datetime | 创建时间 | 是 |   |   |
| gmt_modified | datetime | 更新时间 | 是 |   |   |
| tenant\_id | varchar(128) | 租户id |   |   |   |
| appid | varchar(128) | 应用id | 是 |   |   |
| wg\_id | bigint(20) | 工作组编号 |   |   |   |
| user\_id | bigint(20) | 分表字段 |   |   |   |
| emp\_id | varchar(128) | 员工编号 |   |   |   |

 
12)user\_corp\_employee

| 字段 | 类型 | 说明 | 非空 | 主键 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| id | bigint(20) |   | 是 | 是 | 自增 |
| gmt_create | datetime | 创建时间 | 是 |   |   |
| gmt_modified | datetime | 更新时间 | 是 |   |   |
| tenant\_id | varchar(128) | 租户id |   |   |   |
| appid | varchar(128) | 应用id | 是 |   |   |
| corp\_id | bigint(20) | 企业编号 |   |   |   |
| user\_id | bigint(20) | 分表字段 |   |   |   |
| emp\_id | varchar(128) | 员工编号 |   |   |   |

 
## 3.2优化设计
## 3.3迁移设计
__ __

 
# 4关键模块设计
## 4.1业务模块
### 4.1.1概要描述
 
### 4.1.2流程图
 
### 4.1.3方案设计

