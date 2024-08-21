/*
 Navicat Premium Data Transfer

 Source Server         : 322
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : 192.168.3.22:3306
 Source Schema         : jiron-cloud-config

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 20/08/2024 16:05:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8mb3_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8mb3_bin,
  `encrypted_data_key` text COLLATE utf8mb3_bin COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` VALUES (1, 'application-dev.yml', 'DEFAULT_GROUP', 'spring:\n  autoconfigure:\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n      min-request-size: 8192\n    response:\n      enabled: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n', '58dde4e3760499d3bac2d77a3a1e9018', '2020-05-20 12:00:00', '2023-12-04 08:08:23', 'nacos', '0:0:0:0:0:0:0:1', '', '', '通用配置', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (2, 'jiron-gateway-dev.yml', 'DEFAULT_GROUP', 'spring:\n  redis:\n    host: 192.168.3.22\n    port: 6379\n    password: jiron@2023\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: jiron-auth\n          uri: lb://jiron-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: jiron-gen\n          uri: lb://jiron-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: jiron-job\n          uri: lb://jiron-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: jiron-system\n          uri: lb://jiron-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: jiron-file\n          uri: lb://jiron-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n        # 实时计算\n        - id: jiron-dinky\n          uri: lb://jiron-dinky\n          predicates:\n            - Path=/dinky/**\n          filters:\n            - StripPrefix=1\n        # dolphinscheduler\n        - id: jiron-dolphinscheduler\n          uri: lb://jiron-dolphinscheduler\n          predicates:\n            - Path=/dolphinscheduler/**\n        # datavines\n        - id: jiron-datavines\n          uri: lb://jiron-datavines\n          predicates:\n            - Path=/datavines/**\n          filters:\n            - StripPrefix=1\n        # linkis-ps-publicservice\n        - id: linkis-ps-publicservice\n          uri: lb://linkis-ps-publicservice\n          predicates:\n            - Path=/api/rest_j/v1/microservice/**,/api/rest_j/v1/udf/**,/api/rest_j/v1/errorcode/**,/api/rest_j/v1/contextservice/**,/api/rest_j/v1/bml/**,/api/rest_j/v1/jobhistory/**\n        # linkis-cg-entrance\n        - id: linkis-cg-entrance\n          uri: lb://linkis-cg-entrance\n          predicates:\n            - Path=/api/rest_j/v1/user/**,/ws/**\n        # linkis-linkisManager\n        - id: linkis-linkisManager\n          uri: lb://linkis-linkisManager\n          predicates:\n            - Path=/api/rest_j/v1/linkisManager            \n        # metadata\n        - id: jiron-metadata\n          uri: lb://jiron-metadata\n          predicates:\n            - Path=/metadata/**\n          filters:\n            - StripPrefix=1\n\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: false\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n      - /metadata/api/v1/system/config/jwks\n      - /metadata/api/v1/system/config/authorizer\n      - /metadata/api/v1/system/config/customUiThemePreference\n      - /metadata/api/v1/system/version\n      - /metadata/api/v1/system/config/auth\n\n  source:\n    inners:\n      - inner\n      - BML-AUTH', '8d2cb4111c99d20a06390ffd164606ca', '2020-05-14 14:17:55', '2024-08-20 02:31:54', NULL, '192.168.3.6', '', '', '网关模块', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (3, 'jiron-auth-dev.yml', 'DEFAULT_GROUP', 'spring:\n  redis:\n    host: 192.168.3.22\n    port: 6379\n    password: jiron@2023\n', 'c825b8260fccb52d9792794494c3bd35', '2020-11-20 00:00:00', '2024-07-18 05:46:35', NULL, '192.168.3.6', '', '', '认证中心', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (4, 'jiron-monitor-dev.yml', 'DEFAULT_GROUP', '# spring\nspring:\n  security:\n    user:\n      name: jiron\n      password: 123456\n  boot:\n    admin:\n      ui:\n        title: 若依服务状态监控\n', '6f122fd2bfb8d45f858e7d6529a9cd44', '2020-11-20 00:00:00', '2022-09-29 02:48:54', 'nacos', '0:0:0:0:0:0:0:1', '', '', '监控中心', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (5, 'jiron-system-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring:\n  redis:\n    host: 192.168.3.22\n    port: 6379\n    password: jiron@2023\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        connectTimeout: 30000\n        socketTimeout: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.3.22:3306/jiron-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: jiron@2023\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.jiron.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By jiron\n  licenseUrl: https://jiron.vip', 'c3ee7d6e7cd8577e29b93df51aef7c94', '2020-11-20 00:00:00', '2024-07-18 05:47:27', NULL, '192.168.3.6', '', '', '系统模块', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (6, 'jiron-gen-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/jiron-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: password\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.jiron.gen.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 代码生成接口文档\n  license: Powered By jiron\n  licenseUrl: https://jiron.vip\n\n# 代码生成\ngen:\n  # 作者\n  author: jiron\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\n  packageName: com.jiron.system\n  # 自动去除表前缀，默认是false\n  autoRemovePre: false\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\n  tablePrefix: sys_\n', 'eb592420b3fceae1402881887b8a6a0d', '2020-11-20 00:00:00', '2022-09-29 02:49:42', 'nacos', '0:0:0:0:0:0:0:1', '', '', '代码生成', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (7, 'jiron-job-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: password\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.jiron.job.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By jiron\n  licenseUrl: https://jiron.vip\n', 'edcf0e3fe13fea07b4ec08b1088f30b3', '2020-11-20 00:00:00', '2022-09-29 02:50:50', 'nacos', '0:0:0:0:0:0:0:1', '', '', '定时任务', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (8, 'jiron-file-dev.yml', 'DEFAULT_GROUP', '# 本地文件上传    \nfile:\n    domain: http://127.0.0.1:9300\n    path: D:/jiron/uploadPath\n    prefix: /statics\n\n# FastDFS配置\nfdfs:\n  domain: http://8.129.231.12\n  soTimeout: 3000\n  connectTimeout: 2000\n  trackerList: 8.129.231.12:22122\n\n# Minio配置\nminio:\n  url: http://192.168.3.22:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucketName: test', 'bbf3ace1cf0bf7b5d0c328c6fdd67406', '2020-11-20 00:00:00', '2024-07-18 05:48:04', NULL, '192.168.3.6', '', '', '文件服务', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (9, 'sentinel-jiron-gateway', 'DEFAULT_GROUP', '[\r\n    {\r\n        \"resource\": \"jiron-auth\",\r\n        \"count\": 500,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"jiron-system\",\r\n        \"count\": 1000,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"jiron-gen\",\r\n        \"count\": 200,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"jiron-job\",\r\n        \"count\": 300,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    }\r\n]', '9f3a3069261598f74220bc47958ec252', '2020-11-20 00:00:00', '2020-11-20 00:00:00', NULL, '0:0:0:0:0:0:0:1', '', '', '限流策略', 'null', 'null', 'json', NULL, '');
INSERT INTO `config_info` VALUES (10, 'jiron-dinky-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring:\n  mvc:\n    pathmatch:\n      # Path matching strategy, default ant_path_matcher, support ant_path_matcher and path_pattern_parser\n      matching-strategy: ant_path_matcher\n    format:\n      date: yyyy-MM-dd HH:mm:ss # date format\n      time: HH:mm:ss # time format\n      date-time: yyyy-MM-dd HH:mm:ss # date-time format\n  jackson:\n    time-zone: GMT+8 # Time zone, default is GMT+8\n    date-format: yyyy-MM-dd HH:mm:ss # Date format, the default is yyyy-MM-dd HH:mm:ss\n\n  # circular references allowed\n  main:\n    allow-circular-references: true\n\n  # file upload config of servlet , the default is 500MB\n  servlet:\n    multipart:\n      enabled: true\n      max-file-size: 524288000\n      max-request-size: 524288000\n\n  redis:\n    host: 192.168.3.22\n    port: 6379\n    password: jiron@2023\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        connectTimeout: 30000\n        socketTimeout: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.3.22:3306/dinky?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: jiron@2023\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  # Entity scanning, multiple packages are separated by commas or semicolons\n  typeAliasesPackage: org.dinky.model\n  global-config:\n    db-config:\n      id-type: auto\n      # Logic delete configuration : 0: false(Not deleted), 1: true(deleted)\n      logic-delete-field: is_delete\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n    banner: false\n  configuration:\n    ##### mybatis-plus prints complete sql (only for development environment)\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    #log-impl: org.apache.ibatis.logging.nologging.NoLoggingImpl\n  type-handlers-package: org.dinky.data.typehandler\n\nsms:\n  is-print: false\n\nknife4j:\n  enable: true\n  setting:\n    language: en\n\ncrypto:\n  enabled: false\n  encryption-password:', 'cd5732fb03b4e724511c7a5068d804be', '2024-05-09 02:26:07', '2024-07-17 13:12:08', NULL, '192.168.3.6', '', '', '系统模块', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (12, 'jiron-dolphinscheduler-mysql.yml', 'DEFAULT_GROUP', '#\n# Licensed to the Apache Software Foundation (ASF) under one or more\n# contributor license agreements.  See the NOTICE file distributed with\n# this work for additional information regarding copyright ownership.\n# The ASF licenses this file to You under the Apache License, Version 2.0\n# (the \"License\"); you may not use this file except in compliance with\n# the License.  You may obtain a copy of the License at\n#\n#     http://www.apache.org/licenses/LICENSE-2.0\n#\n# Unless required by applicable law or agreed to in writing, software\n# distributed under the License is distributed on an \"AS IS\" BASIS,\n# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n# See the License for the specific language governing permissions and\n# limitations under the License.\n#\n\nserver:\n  port: 12345\n  servlet:\n    session:\n      timeout: 120m\n    context-path: /dolphinscheduler/\n  compression:\n    enabled: true\n    mime-types: text/html,text/xml,text/plain,text/css,text/javascript,application/javascript,application/json,application/xml\n  jetty:\n    max-http-form-post-size: 5000000\n    accesslog:\n      enabled: true\n      custom-format: \'%{client}a - %u %t \"%r\" %s %O %{ms}Tms\'\n\nspring:\n  banner:\n    charset: UTF-8\n  jackson:\n    time-zone: UTC\n    date-format: \"yyyy-MM-dd HH:mm:ss\"\n  servlet:\n    multipart:\n      max-file-size: 1024MB\n      max-request-size: 1024MB\n  messages:\n    basename: i18n/messages\n  datasource:\n    hikari:\n      connection-test-query: select 1\n      minimum-idle: 5\n      auto-commit: true\n      validation-timeout: 3000\n      pool-name: DolphinScheduler\n      maximum-pool-size: 50\n      connection-timeout: 30000\n      idle-timeout: 600000\n      leak-detection-threshold: 0\n      initialization-fail-timeout: 1\n    dynamic:\n      hikari:\n        connection-test-query: select 1\n        minimum-idle: 5\n        auto-commit: true\n        validation-timeout: 3000\n        pool-name: DolphinScheduler\n        maximum-pool-size: 50\n        connection-timeout: 30000\n        idle-timeout: 600000\n        leak-detection-threshold: 0\n        initialization-fail-timeout: 1\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.3.22:3306/dolphinscheduler\n            username: root\n            password: jiron@2023\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name:\n  quartz:\n    auto-startup: false\n    job-store-type: jdbc\n    jdbc:\n      initialize-schema: never\n    properties:\n      org.quartz.jobStore.isClustered: true\n      org.quartz.jobStore.class: org.springframework.scheduling.quartz.LocalDataSourceJobStore\n      org.quartz.scheduler.instanceId: AUTO\n      org.quartz.jobStore.tablePrefix: QRTZ_\n      org.quartz.jobStore.acquireTriggersWithinLock: true\n      org.quartz.scheduler.instanceName: DolphinScheduler\n      org.quartz.threadPool.class: org.apache.dolphinscheduler.scheduler.quartz.QuartzZeroSizeThreadPool\n      org.quartz.jobStore.useProperties: false\n      org.quartz.jobStore.misfireThreshold: 60000\n      org.quartz.scheduler.makeSchedulerThreadDaemon: true\n      org.quartz.jobStore.driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate\n      org.quartz.jobStore.clusterCheckinInterval: 5000\n      org.quartz.scheduler.batchTriggerAcquisitionMaxCount: 1\n  mvc:\n    pathmatch:\n      matching-strategy: ANT_PATH_MATCHER\n    static-path-pattern: /static/**\n  redis:\n    host: 192.168.3.22\n    port: 6379\n    password: jiron@2023\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html\n  packages-to-scan: org.apache.dolphinscheduler.api\n\n# Mybatis-plus configuration, you don\'t need to change it\nmybatis-plus:\n  mapper-locations: classpath:org/apache/dolphinscheduler/dao/mapper/*Mapper.xml\n  type-aliases-package: org.apache.dolphinscheduler.dao.entity\n  configuration:\n    cache-enabled: false\n    call-setters-on-nulls: true\n    map-underscore-to-camel-case: true\n    jdbc-type-for-null: NULL\n  global-config:\n    db-config:\n      id-type: auto\n    banner: false\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: health,metrics,prometheus\n  endpoint:\n    health:\n      enabled: true\n      show-details: always\n  health:\n    db:\n      enabled: true\n    defaults:\n      enabled: false\n  metrics:\n    tags:\n      application: ${spring.application.name}\n\nregistry:\n  type: zookeeper\n  zookeeper:\n    namespace: dolphinscheduler\n    connect-string: 192.168.3.22:2181\n    retry-policy:\n      base-sleep-time: 60ms\n      max-sleep: 300ms\n      max-retries: 5\n    session-timeout: 60s\n    connection-timeout: 15s\n    block-until-connected: 15s\n    digest: ~\n\napi:\n  audit-enable: false\n  # Traffic control, if you turn on this config, the maximum number of request/s will be limited.\n  # global max request number per second\n  # default tenant-level max request number\n  traffic-control:\n      global-switch: false\n      max-global-qps-rate: 300\n      tenant-switch: false\n      default-tenant-qps-rate: 10\n        #customize-tenant-qps-rate:\n        # eg.\n      #tenant1: 11\n      #tenant2: 20\n  python-gateway:\n    # Weather enable python gateway server or not. The default value is true.\n    enabled: true\n    # Authentication token for connection from python api to python gateway server. Should be changed the default value\n    # when you deploy in public network.\n    auth-token: jwUDzpLsNKEFER4*a8gruBH_GsAurNxU7A@Xc\n    # The address of Python gateway server start. Set its value to `0.0.0.0` if your Python API run in different\n    # between Python gateway server. It could be be specific to other address like `127.0.0.1` or `localhost`\n    gateway-server-address: 0.0.0.0\n    # The port of Python gateway server start. Define which port you could connect to Python gateway server from\n    # Python API side.\n    gateway-server-port: 25333\n    # The address of Python callback client.\n    python-address: 127.0.0.1\n    # The port of Python callback client.\n    python-port: 25334\n    # Close connection of socket server if no other request accept after x milliseconds. Define value is (0 = infinite),\n    # and socket server would never close even though no requests accept\n    connect-timeout: 0\n    # Close each active connection of socket server if python program not active after x milliseconds. Define value is\n    # (0 = infinite), and socket server would never close even though no requests accept\n    read-timeout: 0\n  permission-check: false\n\nmetrics:\n  enabled: true\n\nsecurity:\n  authentication:\n    # Authentication types (supported types: PASSWORD,LDAP,CASDOOR_SSO)\n    type: PASSWORD\n    # IF you set type `LDAP`, below config will be effective\n    ldap:\n      # ldap server config\n      urls: ldap://ldap.forumsys.com:389/\n      base-dn: dc=example,dc=com\n      username: cn=read-only-admin,dc=example,dc=com\n      password: password\n      user:\n        # admin userId when you use LDAP login\n        admin: read-only-admin\n        identity-attribute: uid\n        email-attribute: mail\n        # action when ldap user is not exist (supported types: CREATE,DENY)\n        not-exist-action: CREATE\n      ssl:\n        enable: false\n        # jks file absolute path && password\n        trust-store: \"/ldapkeystore.jks\"\n        trust-store-password: \"password\"\n    casdoor:\n      user:\n        admin: \"\"\n    oauth2:\n      enable: false\n      provider:\n        github:\n          authorizationUri: \"\"\n          redirectUri: \"\"\n          clientId: \"\"\n          clientSecret: \"\"\n          tokenUri: \"\"\n          userInfoUri: \"\"\n          callbackUrl: \"\"\n          iconUri: \"\"\n          provider: github\n        google:\n          authorizationUri: \"\"\n          redirectUri: \"\"\n          clientId: \"\"\n          clientSecret: \"\"\n          tokenUri: \"\"\n          userInfoUri: \"\"\n          callbackUrl: \"\"\n          iconUri: \"\"\n          provider: google\ncasdoor:\n  # Your Casdoor server url\n  endpoint: \"\"\n  client-id: \"\"\n  client-secret: \"\"\n  # The certificate may be multi-line, you can use `|-` for ease\n  certificate: \"\"\n  # Your organization name added in Casdoor\n  organization-name: \"\"\n  # Your application name added in Casdoor\n  application-name: \"\"\n  # Doplhinscheduler login url\n  redirect-url: \"\"\n\n', '385a11fea084c042120e25e4a16ace3f', '2024-05-10 14:53:37', '2024-07-24 09:51:10', NULL, '192.168.3.6', '', '', '系统模块', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (13, 'jiron-datavines-mysql.yml', 'DEFAULT_GROUP', '#\n# Licensed to the Apache Software Foundation (ASF) under one or more\n# contributor license agreements.  See the NOTICE file distributed with\n# this work for additional information regarding copyright ownership.\n# The ASF licenses this file to You under the Apache License, Version 2.0\n# (the \"License\"); you may not use this file except in compliance with\n# the License.  You may obtain a copy of the License at\n#\n#     http://www.apache.org/licenses/LICENSE-2.0\n#\n# Unless required by applicable law or agreed to in writing, software\n# distributed under the License is distributed on an \"AS IS\" BASIS,\n# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n# See the License for the specific language governing permissions and\n# limitations under the License.\n#\nspring:\n  main:\n    banner-mode: off\n    allow-circular-references: true\n  redis:\n    host: 192.168.3.22\n    port: 6379\n    password: jiron@2023\n  datasource:\n    driver-class-name: org.postgresql.Driver\n    url: jdbc:postgresql://127.0.0.1:5432/datavines\n    username: postgres\n    password: 123456\n    hikari:\n      connection-test-query: select 1\n      minimum-idle: 5\n      auto-commit: true\n      validation-timeout: 3000\n      pool-name: datavines\n      maximum-pool-size: 50\n      connection-timeout: 30000\n      idle-timeout: 600000\n      leak-detection-threshold: 0\n      initialization-fail-timeout: 1\n  quartz:\n    job-store-type: jdbc\n    jdbc:\n      initialize-schema: never\n    properties:\n      org.quartz.threadPool.threadPriority: 5\n      org.quartz.jobStore.isClustered: true\n      org.quartz.jobStore.class: org.springframework.scheduling.quartz.LocalDataSourceJobStore\n      org.quartz.scheduler.instanceId: AUTO\n      org.quartz.jobStore.tablePrefix: QRTZ_\n      org.quartz.jobStore.acquireTriggersWithinLock: true\n      org.quartz.scheduler.instanceName: datavines\n      org.quartz.threadPool.class: org.quartz.simpl.SimpleThreadPool\n      org.quartz.jobStore.useProperties: false\n      org.quartz.threadPool.makeThreadsDaemons: true\n      org.quartz.threadPool.threadCount: 25\n      org.quartz.jobStore.misfireThreshold: 60000\n      org.quartz.scheduler.batchTriggerAcquisitionMaxCount: 1\n      org.quartz.scheduler.makeSchedulerThreadDaemon: true\n      org.quartz.jobStore.driverDelegateClass: org.quartz.impl.jdbcjobstore.PostgreSQLDelegate\n      org.quartz.jobStore.clusterCheckinInterval: 5000\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n\nmybatis-plus:\n  type-enums-package: io.datavines.*.enums\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\nserver:\n  port: 5600\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  metrics:\n    tags:\n      application: ${spring.application.name}\n\nlogging:\n  config: classpath:server-logback.xml\n---\nspring:\n  config:\n    activate:\n      on-profile: mysql\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.3.22:3306/datavines?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\n    username: root\n    password: jiron@2023\n  quartz:\n    properties:\n      org.quartz.jobStore.driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate', 'd691d92e2eb5649f2cdd6ca3b136e459', '2024-06-04 08:51:22', '2024-07-18 05:50:36', NULL, '192.168.3.6', '', '', '系统模块', '', '', 'yaml', '', '');
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='增加租户字段';

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8mb3_bin COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info_beta';

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info_tag';

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Records of group_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL,
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8mb3_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8mb3_bin,
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8mb3_bin COMMENT '秘钥',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
INSERT INTO `his_config_info` VALUES (11, 54, 'jiron-dolphinscheduler-dev.yml', 'DEFAULT_GROUP', '', '#\n# Licensed to the Apache Software Foundation (ASF) under one or more\n# contributor license agreements.  See the NOTICE file distributed with\n# this work for additional information regarding copyright ownership.\n# The ASF licenses this file to You under the Apache License, Version 2.0\n# (the \"License\"); you may not use this file except in compliance with\n# the License.  You may obtain a copy of the License at\n#\n#     http://www.apache.org/licenses/LICENSE-2.0\n#\n# Unless required by applicable law or agreed to in writing, software\n# distributed under the License is distributed on an \"AS IS\" BASIS,\n# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n# See the License for the specific language governing permissions and\n# limitations under the License.\n#\n\nserver:\n  port: 12345\n  servlet:\n    session:\n      timeout: 120m\n    context-path: /dolphinscheduler/\n  compression:\n    enabled: true\n    mime-types: text/html,text/xml,text/plain,text/css,text/javascript,application/javascript,application/json,application/xml\n  jetty:\n    max-http-form-post-size: 5000000\n    accesslog:\n      enabled: true\n      custom-format: \'%{client}a - %u %t \"%r\" %s %O %{ms}Tms\'\n\nspring:\n  banner:\n    charset: UTF-8\n  jackson:\n    time-zone: UTC\n    date-format: \"yyyy-MM-dd HH:mm:ss\"\n  servlet:\n    multipart:\n      max-file-size: 1024MB\n      max-request-size: 1024MB\n  messages:\n    basename: i18n/messages\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.3.22:3306/dolphinscheduler\n    username: root\n    password: hadooptansun\n    hikari:\n      connection-test-query: select 1\n      minimum-idle: 5\n      auto-commit: true\n      validation-timeout: 3000\n      pool-name: DolphinScheduler\n      maximum-pool-size: 50\n      connection-timeout: 30000\n      idle-timeout: 600000\n      leak-detection-threshold: 0\n      initialization-fail-timeout: 1\n  quartz:\n    auto-startup: false\n    job-store-type: jdbc\n    jdbc:\n      initialize-schema: never\n    properties:\n      org.quartz.jobStore.isClustered: true\n      org.quartz.jobStore.class: org.springframework.scheduling.quartz.LocalDataSourceJobStore\n      org.quartz.scheduler.instanceId: AUTO\n      org.quartz.jobStore.tablePrefix: QRTZ_\n      org.quartz.jobStore.acquireTriggersWithinLock: true\n      org.quartz.scheduler.instanceName: DolphinScheduler\n      org.quartz.threadPool.class: org.apache.dolphinscheduler.scheduler.quartz.QuartzZeroSizeThreadPool\n      org.quartz.jobStore.useProperties: false\n      org.quartz.jobStore.misfireThreshold: 60000\n      org.quartz.scheduler.makeSchedulerThreadDaemon: true\n      org.quartz.jobStore.driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate\n      org.quartz.jobStore.clusterCheckinInterval: 5000\n      org.quartz.scheduler.batchTriggerAcquisitionMaxCount: 1\n  mvc:\n    pathmatch:\n      matching-strategy: ANT_PATH_MATCHER\n    static-path-pattern: /static/**\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html\n  packages-to-scan: org.apache.dolphinscheduler.api\n\n# Mybatis-plus configuration, you don\'t need to change it\nmybatis-plus:\n  mapper-locations: classpath:org/apache/dolphinscheduler/dao/mapper/*Mapper.xml\n  type-aliases-package: org.apache.dolphinscheduler.dao.entity\n  configuration:\n    cache-enabled: false\n    call-setters-on-nulls: true\n    map-underscore-to-camel-case: true\n    jdbc-type-for-null: NULL\n  global-config:\n    db-config:\n      id-type: auto\n    banner: false\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: health,metrics,prometheus\n  endpoint:\n    health:\n      enabled: true\n      show-details: always\n  health:\n    db:\n      enabled: true\n    defaults:\n      enabled: false\n  metrics:\n    tags:\n      application: ${spring.application.name}\n\nregistry:\n  type: zookeeper\n  zookeeper:\n    namespace: dolphinscheduler\n    connect-string: 192.168.3.22:2181\n    retry-policy:\n      base-sleep-time: 60ms\n      max-sleep: 300ms\n      max-retries: 5\n    session-timeout: 60s\n    connection-timeout: 15s\n    block-until-connected: 15s\n    digest: ~\n\napi:\n  audit-enable: false\n  # Traffic control, if you turn on this config, the maximum number of request/s will be limited.\n  # global max request number per second\n  # default tenant-level max request number\n  traffic-control:\n      global-switch: false\n      max-global-qps-rate: 300\n      tenant-switch: false\n      default-tenant-qps-rate: 10\n        #customize-tenant-qps-rate:\n        # eg.\n      #tenant1: 11\n      #tenant2: 20\n  python-gateway:\n    # Weather enable python gateway server or not. The default value is true.\n    enabled: true\n    # Authentication token for connection from python api to python gateway server. Should be changed the default value\n    # when you deploy in public network.\n    auth-token: jwUDzpLsNKEFER4*a8gruBH_GsAurNxU7A@Xc\n    # The address of Python gateway server start. Set its value to `0.0.0.0` if your Python API run in different\n    # between Python gateway server. It could be be specific to other address like `127.0.0.1` or `localhost`\n    gateway-server-address: 0.0.0.0\n    # The port of Python gateway server start. Define which port you could connect to Python gateway server from\n    # Python API side.\n    gateway-server-port: 25333\n    # The address of Python callback client.\n    python-address: 127.0.0.1\n    # The port of Python callback client.\n    python-port: 25334\n    # Close connection of socket server if no other request accept after x milliseconds. Define value is (0 = infinite),\n    # and socket server would never close even though no requests accept\n    connect-timeout: 0\n    # Close each active connection of socket server if python program not active after x milliseconds. Define value is\n    # (0 = infinite), and socket server would never close even though no requests accept\n    read-timeout: 0\n\nmetrics:\n  enabled: true\n\nsecurity:\n  authentication:\n    # Authentication types (supported types: PASSWORD,LDAP,CASDOOR_SSO)\n    type: PASSWORD\n    # IF you set type `LDAP`, below config will be effective\n    ldap:\n      # ldap server config\n      urls: ldap://ldap.forumsys.com:389/\n      base-dn: dc=example,dc=com\n      username: cn=read-only-admin,dc=example,dc=com\n      password: password\n      user:\n        # admin userId when you use LDAP login\n        admin: read-only-admin\n        identity-attribute: uid\n        email-attribute: mail\n        # action when ldap user is not exist (supported types: CREATE,DENY)\n        not-exist-action: CREATE\n      ssl:\n        enable: false\n        # jks file absolute path && password\n        trust-store: \"/ldapkeystore.jks\"\n        trust-store-password: \"password\"\n    casdoor:\n      user:\n        admin: \"\"\n    oauth2:\n      enable: false\n      provider:\n        github:\n          authorizationUri: \"\"\n          redirectUri: \"\"\n          clientId: \"\"\n          clientSecret: \"\"\n          tokenUri: \"\"\n          userInfoUri: \"\"\n          callbackUrl: \"\"\n          iconUri: \"\"\n          provider: github\n        google:\n          authorizationUri: \"\"\n          redirectUri: \"\"\n          clientId: \"\"\n          clientSecret: \"\"\n          tokenUri: \"\"\n          userInfoUri: \"\"\n          callbackUrl: \"\"\n          iconUri: \"\"\n          provider: google\ncasdoor:\n  # Your Casdoor server url\n  endpoint: \"\"\n  client-id: \"\"\n  client-secret: \"\"\n  # The certificate may be multi-line, you can use `|-` for ease\n  certificate: \"\"\n  # Your organization name added in Casdoor\n  organization-name: \"\"\n  # Your application name added in Casdoor\n  application-name: \"\"\n  # Doplhinscheduler login url\n  redirect-url: \"\"', '68b32f7009a5a995f77ec8045bbdd123', '2024-07-23 22:22:31', '2024-07-23 14:22:32', NULL, '192.168.3.6', 'D', '', '');
INSERT INTO `his_config_info` VALUES (12, 55, 'jiron-dolphinscheduler-mysql.yml', 'DEFAULT_GROUP', '', '#\n# Licensed to the Apache Software Foundation (ASF) under one or more\n# contributor license agreements.  See the NOTICE file distributed with\n# this work for additional information regarding copyright ownership.\n# The ASF licenses this file to You under the Apache License, Version 2.0\n# (the \"License\"); you may not use this file except in compliance with\n# the License.  You may obtain a copy of the License at\n#\n#     http://www.apache.org/licenses/LICENSE-2.0\n#\n# Unless required by applicable law or agreed to in writing, software\n# distributed under the License is distributed on an \"AS IS\" BASIS,\n# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n# See the License for the specific language governing permissions and\n# limitations under the License.\n#\n\nserver:\n  port: 12345\n  servlet:\n    session:\n      timeout: 120m\n    context-path: /dolphinscheduler/\n  compression:\n    enabled: true\n    mime-types: text/html,text/xml,text/plain,text/css,text/javascript,application/javascript,application/json,application/xml\n  jetty:\n    max-http-form-post-size: 5000000\n    accesslog:\n      enabled: true\n      custom-format: \'%{client}a - %u %t \"%r\" %s %O %{ms}Tms\'\n\nspring:\n  banner:\n    charset: UTF-8\n  jackson:\n    time-zone: UTC\n    date-format: \"yyyy-MM-dd HH:mm:ss\"\n  servlet:\n    multipart:\n      max-file-size: 1024MB\n      max-request-size: 1024MB\n  messages:\n    basename: i18n/messages\n  datasource:\n    hikari:\n      connection-test-query: select 1\n      minimum-idle: 5\n      auto-commit: true\n      validation-timeout: 3000\n      pool-name: DolphinScheduler\n      maximum-pool-size: 50\n      connection-timeout: 30000\n      idle-timeout: 600000\n      leak-detection-threshold: 0\n      initialization-fail-timeout: 1\n    dynamic:\n      hikari:\n        connection-test-query: select 1\n        minimum-idle: 5\n        auto-commit: true\n        validation-timeout: 3000\n        pool-name: DolphinScheduler\n        maximum-pool-size: 50\n        connection-timeout: 30000\n        idle-timeout: 600000\n        leak-detection-threshold: 0\n        initialization-fail-timeout: 1\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.3.22:3306/dolphinscheduler\n            username: root\n            password: jiron@2023\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name:\n  quartz:\n    auto-startup: false\n    job-store-type: jdbc\n    jdbc:\n      initialize-schema: never\n    properties:\n      org.quartz.jobStore.isClustered: true\n      org.quartz.jobStore.class: org.springframework.scheduling.quartz.LocalDataSourceJobStore\n      org.quartz.scheduler.instanceId: AUTO\n      org.quartz.jobStore.tablePrefix: QRTZ_\n      org.quartz.jobStore.acquireTriggersWithinLock: true\n      org.quartz.scheduler.instanceName: DolphinScheduler\n      org.quartz.threadPool.class: org.apache.dolphinscheduler.scheduler.quartz.QuartzZeroSizeThreadPool\n      org.quartz.jobStore.useProperties: false\n      org.quartz.jobStore.misfireThreshold: 60000\n      org.quartz.scheduler.makeSchedulerThreadDaemon: true\n      org.quartz.jobStore.driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate\n      org.quartz.jobStore.clusterCheckinInterval: 5000\n      org.quartz.scheduler.batchTriggerAcquisitionMaxCount: 1\n  mvc:\n    pathmatch:\n      matching-strategy: ANT_PATH_MATCHER\n    static-path-pattern: /static/**\n  redis:\n    host: 192.168.3.22\n    port: 6379\n    password: jiron@2023\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html\n  packages-to-scan: org.apache.dolphinscheduler.api\n\n# Mybatis-plus configuration, you don\'t need to change it\nmybatis-plus:\n  mapper-locations: classpath:org/apache/dolphinscheduler/dao/mapper/*Mapper.xml\n  type-aliases-package: org.apache.dolphinscheduler.dao.entity\n  configuration:\n    cache-enabled: false\n    call-setters-on-nulls: true\n    map-underscore-to-camel-case: true\n    jdbc-type-for-null: NULL\n  global-config:\n    db-config:\n      id-type: auto\n    banner: false\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: health,metrics,prometheus\n  endpoint:\n    health:\n      enabled: true\n      show-details: always\n  health:\n    db:\n      enabled: true\n    defaults:\n      enabled: false\n  metrics:\n    tags:\n      application: ${spring.application.name}\n\nregistry:\n  type: zookeeper\n  zookeeper:\n    namespace: dolphinscheduler\n    connect-string: 192.168.3.22:2181\n    retry-policy:\n      base-sleep-time: 60ms\n      max-sleep: 300ms\n      max-retries: 5\n    session-timeout: 60s\n    connection-timeout: 15s\n    block-until-connected: 15s\n    digest: ~\n\napi:\n  audit-enable: false\n  # Traffic control, if you turn on this config, the maximum number of request/s will be limited.\n  # global max request number per second\n  # default tenant-level max request number\n  traffic-control:\n      global-switch: false\n      max-global-qps-rate: 300\n      tenant-switch: false\n      default-tenant-qps-rate: 10\n        #customize-tenant-qps-rate:\n        # eg.\n      #tenant1: 11\n      #tenant2: 20\n  python-gateway:\n    # Weather enable python gateway server or not. The default value is true.\n    enabled: true\n    # Authentication token for connection from python api to python gateway server. Should be changed the default value\n    # when you deploy in public network.\n    auth-token: jwUDzpLsNKEFER4*a8gruBH_GsAurNxU7A@Xc\n    # The address of Python gateway server start. Set its value to `0.0.0.0` if your Python API run in different\n    # between Python gateway server. It could be be specific to other address like `127.0.0.1` or `localhost`\n    gateway-server-address: 0.0.0.0\n    # The port of Python gateway server start. Define which port you could connect to Python gateway server from\n    # Python API side.\n    gateway-server-port: 25333\n    # The address of Python callback client.\n    python-address: 127.0.0.1\n    # The port of Python callback client.\n    python-port: 25334\n    # Close connection of socket server if no other request accept after x milliseconds. Define value is (0 = infinite),\n    # and socket server would never close even though no requests accept\n    connect-timeout: 0\n    # Close each active connection of socket server if python program not active after x milliseconds. Define value is\n    # (0 = infinite), and socket server would never close even though no requests accept\n    read-timeout: 0\n\nmetrics:\n  enabled: true\n\nsecurity:\n  authentication:\n    # Authentication types (supported types: PASSWORD,LDAP,CASDOOR_SSO)\n    type: PASSWORD\n    # IF you set type `LDAP`, below config will be effective\n    ldap:\n      # ldap server config\n      urls: ldap://ldap.forumsys.com:389/\n      base-dn: dc=example,dc=com\n      username: cn=read-only-admin,dc=example,dc=com\n      password: password\n      user:\n        # admin userId when you use LDAP login\n        admin: read-only-admin\n        identity-attribute: uid\n        email-attribute: mail\n        # action when ldap user is not exist (supported types: CREATE,DENY)\n        not-exist-action: CREATE\n      ssl:\n        enable: false\n        # jks file absolute path && password\n        trust-store: \"/ldapkeystore.jks\"\n        trust-store-password: \"password\"\n    casdoor:\n      user:\n        admin: \"\"\n    oauth2:\n      enable: false\n      provider:\n        github:\n          authorizationUri: \"\"\n          redirectUri: \"\"\n          clientId: \"\"\n          clientSecret: \"\"\n          tokenUri: \"\"\n          userInfoUri: \"\"\n          callbackUrl: \"\"\n          iconUri: \"\"\n          provider: github\n        google:\n          authorizationUri: \"\"\n          redirectUri: \"\"\n          clientId: \"\"\n          clientSecret: \"\"\n          tokenUri: \"\"\n          userInfoUri: \"\"\n          callbackUrl: \"\"\n          iconUri: \"\"\n          provider: google\ncasdoor:\n  # Your Casdoor server url\n  endpoint: \"\"\n  client-id: \"\"\n  client-secret: \"\"\n  # The certificate may be multi-line, you can use `|-` for ease\n  certificate: \"\"\n  # Your organization name added in Casdoor\n  organization-name: \"\"\n  # Your application name added in Casdoor\n  application-name: \"\"\n  # Doplhinscheduler login url\n  redirect-url: \"\"', 'ad5c5e7a9048d05eda548dca04f8bf06', '2024-07-24 17:51:10', '2024-07-24 09:51:10', NULL, '192.168.3.6', 'U', '', '');
INSERT INTO `his_config_info` VALUES (2, 56, 'jiron-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: 192.168.3.22\n    port: 6379\n    password: jiron@2023\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: jiron-auth\n          uri: lb://jiron-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: jiron-gen\n          uri: lb://jiron-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: jiron-job\n          uri: lb://jiron-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: jiron-system\n          uri: lb://jiron-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: jiron-file\n          uri: lb://jiron-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n        # 实时计算\n        - id: jiron-dinky\n          uri: lb://jiron-dinky\n          predicates:\n            - Path=/dinky/**\n          filters:\n            - StripPrefix=1\n        # dolphinscheduler\n        - id: jiron-dolphinscheduler\n          uri: lb://jiron-dolphinscheduler\n          predicates:\n            - Path=/dolphinscheduler/**\n        # datavines\n        - id: jiron-datavines\n          uri: lb://jiron-datavines\n          predicates:\n            - Path=/datavines/**\n          filters:\n            - StripPrefix=1\n        # linkis-ps-publicservice\n        - id: linkis-ps-publicservice\n          uri: lb://linkis-ps-publicservice\n          predicates:\n            - Path=/api/rest_j/v1/microservice/**,/api/rest_j/v1/udf/**,/api/rest_j/v1/errorcode/**,/api/rest_j/v1/contextservice/**,/api/rest_j/v1/bml/**,/api/rest_j/v1/jobhistory/**\n        # linkis-cg-entrance\n        - id: linkis-cg-entrance\n          uri: lb://linkis-cg-entrance\n          predicates:\n            - Path=/api/rest_j/v1/user/**,/ws/**\n        # linkis-linkisManager\n        - id: linkis-linkisManager\n          uri: lb://linkis-linkisManager\n          predicates:\n            - Path=/api/rest_j/v1/linkisManager            \n        # metadata\n        - id: jiron-metadata\n          uri: lb://jiron-metadata\n          predicates:\n            - Path=/metadata/**\n          filters:\n            - StripPrefix=1\n\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n      - /metadata/api/v1/system/config/jwks\n      - /metadata/api/v1/system/config/authorizer\n      - /metadata/api/v1/system/config/customUiThemePreference\n      - /metadata/api/v1/system/version\n      - /metadata/api/v1/system/config/auth\n\n  source:\n    inners:\n      - inner\n      - BML-AUTH', 'a53fc9256605680d058adffd7ca98307', '2024-08-20 10:31:54', '2024-08-20 02:31:54', NULL, '192.168.3.6', 'U', '', '');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
