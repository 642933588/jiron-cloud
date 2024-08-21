## 请各位朋友点个 ★star★ 支持一下，非常感谢~

[【 Github地址：https://github.com/642933588/jiron-cloud 】](https://github.com/642933588/jiron-cloud)

[【 Gitee 地址：https://gitee.com/642933588/jiron-cloud 】](https://gitee.com/642933588/jiron-cloud)

[【 推荐实时数仓（数据湖）项目：https://github.com/Mrkuhuo/data-warehouse-learning 】](https://github.com/Mrkuhuo/data-warehouse-learning)


这是一款功能全面的数据开发平台。平台提供了强大的数据集成、数据开发、数据查询、数据服务、数据质量管理、工作流调度和元数据管理功能。dinky ，dolphinscheduler ，datavines ，flinkcdc ，openmetadata ，flink ，数据开发 ，数据平台 ，数据开发平台 ，大数据
## 目录

- [功能](#功能)
    - [数据质量管理 (Datavines)](#数据质量管理-datavines)
    - [工作流调度 (DolphinScheduler)](#工作流调度-dolphinscheduler)
    - [元数据管理 (OpenMetadata)](#元数据管理-openmetadata)
    - [实时数据处理 (Dinky)](#实时数据处理-dinky)
    - [数据集成（FlinkCDC）](#数据集成)
    - [数据查询（Dataq）](#数据查询)
    - [数据分析（DataAnalysis）](#数据分析)
    - [数据服务（Dataservice）](#数据服务)
- [架构](#架构)
- [安装](#安装)
- [演示](#演示)
- [实践](#实践)
- [贡献](#贡献)
- [许可](#许可)
- [联系方式](#联系方式)

## 功能

### 数据质量管理 (Datavines)

- **数据质量监控**：定义和执行数据质量规则，如空值检测、重复值检测、范围检查等，确保数据的准确性和完整性。
- **告警和通知**：当数据质量出现问题时，Datavines 通过电子邮件、短信等方式发送告警通知，确保相关人员能够及时响应和处理问题。
- **数据治理**：支持数据分类、标签和权限管理，确保数据的合规性和安全性。
- **数据质量报告**：生成详细的数据质量报告，帮助用户了解和改进数据质量。

### 工作流调度 (DolphinScheduler)

- **分布式架构**：处理大规模的数据处理任务，确保系统的高可用性和扩展性。
- **任务依赖管理**：定义复杂的任务依赖关系，确保任务按照预定的顺序执行。
- **丰富的任务类型**：支持多种类型的任务，包括 Shell、Python 脚本、SQL、MapReduce、Spark、Flink 等。
- **可视化工作流设计**：提供直观的图形化用户界面，通过拖拽方式设计和配置工作流。
- **任务调度**：支持灵活的调度策略，包括定时调度、依赖触发、手动触发等。
- **任务监控与告警**：实时监控任务的执行状态，并提供告警通知功能，确保问题及时处理。
- **资源管理**：管理任务所需的资源，确保资源合理分配和使用。

### 元数据管理 (OpenMetadata)

- **元数据管理**：捕获和存储各种数据资产的元数据，包括表、列、数据集、仪表板、机器学习模型等。
- **数据发现**：提供强大的数据发现工具，帮助用户搜索和发现企业内的数据资源。
- **数据血缘分析**：支持详细的数据血缘分析，显示数据的来源和流向，提高数据透明度。
- **数据治理**：定义和执行数据治理策略，包括数据分类、标签、访问控制、合规性检查等。
- **数据质量管理**：与 Datavines 集成，监控和管理数据质量，检测数据中的错误和异常。
- **集成与互操作性**：支持与多种数据源和数据工具的集成，适应多样化的数据环境。
- **API 和 SDK**：提供丰富的 API 和 SDK，支持开发者扩展和定制功能。
- **可视化界面**：提供用户友好的可视化界面，便于浏览和管理元数据，查看数据血缘关系图，配置数据治理策略等。

### 实时数据处理 (Dinky)

- **实时数据处理**：Dinky 提供了强大的实时数据处理能力，支持 Flink 等流处理框架。
- **实时计算任务**：用户可以定义和执行实时计算任务，处理实时数据流。
- **数据集成**：支持多种数据源和目标，能够将实时数据流集成到不同的数据系统中。
- **可视化开发**：提供直观的图形化界面，用户可以通过拖拽方式设计和配置实时计算任务。
- **监控与告警**：实时监控数据流处理状态，并在出现异常时提供告警通知。
- **高可用性**：设计了高可用性和容错机制，确保实时数据处理的稳定性和可靠性。

### 数据集成

- **多数据源支持**：支持多种数据源的集成，包括数据库、API、文件系统等，能够灵活应对不同的数据来源。
- **多执行引擎支持**：支持多种执行引擎，包括 DataX、Sqoop、Flink CDC，满足不同场景的数据同步需求。
- **全库同步**：支持整个数据库的同步，方便全面的数据迁移和复制。
- **多表同步**：支持多表同步，简化复杂的数据集成任务。
- **全量和增量同步**：提供全量和增量同步功能，实现数据的一体化同步。
- **断点续传**：支持断点续传机制，确保数据集成过程的可靠性和稳定性。

### 数据查询

- **灵活高效的数据查询**：基于 Kyuubi 提供灵活高效的数据查询功能，支持 SQL 和非 SQL 查询，满足各种数据检索需求。
- **多数据源支持**：支持多种数据源的数据查询，适用于不同的数据存储系统。
- **高性能**：优化的查询引擎，确保数据查询的高性能和低延迟。

### 数据分析

- **集成多种数据分析工具**：集成多种数据分析和可视化工具，帮助用户快速获取洞见。
- **可视化分析**：提供丰富的可视化组件，用户可以通过图表、仪表板等方式展示分析结果。
- **高级分析功能**：支持机器学习模型、统计分析等高级分析功能，满足复杂数据分析需求。

### 数据服务

- **数据服务接口**：提供数据服务接口，支持 RESTful API 和 GraphQL，方便数据的对外提供和集成。
- **灵活的数据访问**：通过 API 提供灵活的数据访问方式，满足不同应用和系统的集成需求。
- **高可用性和安全性**：设计了高可用性和安全性机制，确保数据服务的可靠性和数据的安全性。

## 架构
![架构图](https://github.com/642933588/dataworks/assets/10755257/c2f6a740-dc79-4e5c-8c3b-1a6f499c784b)


## 安装
目前演示环境还在筹备中，知识星球有完整部署文件，可以先本地环境部署体验（二维码在最下面）

知识星球有什么：
1 部署资料搭建环境
2 平台及数据开发常见问题分析
3 平台二次开发教程
4 实时数仓（数据糊）实战教程
5 问题解答

## 演示

#### 首页
![0](https://github.com/642933588/dataworks/assets/10755257/6681dcb9-3720-4762-9a77-76ee755689f9)

#### 系统管理
![0-0](https://github.com/642933588/dataworks/assets/10755257/bb4b7688-a026-4904-8459-59479ea5aa78)

#### 数据开发
![0-0](https://github.com/user-attachments/assets/d084ff22-c593-4a5d-98d2-faba4f266f86)
![0-2](https://github.com/user-attachments/assets/9c74e761-b92f-4399-9bbf-4f6c070ff88c)
![0-3](https://github.com/user-attachments/assets/41324e91-d6e1-4207-8e5d-01717797f10a)
![0-4](https://github.com/user-attachments/assets/15860241-8cef-4448-8079-372d1776fdb9)
![0-5](https://github.com/user-attachments/assets/db70c35a-11c4-4a9f-951c-3c8925d39ae6)
![1-0](https://github.com/642933588/dataworks/assets/10755257/7027cc32-868a-4231-a8fc-9ef9b525e13e)
![1-1](https://github.com/642933588/dataworks/assets/10755257/aa9cf079-8f5a-43cd-9f06-a9780e98d8e6)
![1-2](https://github.com/642933588/dataworks/assets/10755257/a1d6a53a-6300-4025-9b83-89e5069acf8b)
![2-0](https://github.com/642933588/dataworks/assets/10755257/4fef8c5c-0497-4b95-b654-bae1b574fda6)
![3-0](https://github.com/642933588/dataworks/assets/10755257/f245e4de-ffae-4b1f-afd1-e7a279bb7c9e)
![4-0](https://github.com/642933588/dataworks/assets/10755257/0e81d358-265a-4dab-b668-46462abbe1fc)
![5-0](https://github.com/642933588/dataworks/assets/10755257/12000edc-8ab1-4303-a03a-8e71fd8b0b67)
![5-1](https://github.com/642933588/dataworks/assets/10755257/7c0c6c87-dd13-44a0-a82b-b50123dfb14f)
![5-2](https://github.com/642933588/dataworks/assets/10755257/7e09eb69-eb29-4983-86a6-3cb49642862b)
![6-0](https://github.com/user-attachments/assets/6f32873e-bb86-43ee-9bcd-d974326cffd4)
![6-1](https://github.com/user-attachments/assets/6721fa04-24a3-4f99-b47c-4df766f2c8b0)
![6-2](https://github.com/user-attachments/assets/40a45190-d1d9-4b38-b3ba-cc10590d5f00)
![6-3](https://github.com/642933588/dataworks/assets/10755257/2544a246-b1ed-4c5a-be87-3532e20e564c)
![6-4](https://github.com/user-attachments/assets/662f814d-f6e0-429a-a2eb-e596d853141e)
![6-5](https://github.com/user-attachments/assets/21747168-dbb4-4cd6-80dd-a8455c6406eb)
![6-6](https://github.com/user-attachments/assets/72a80dcf-8841-4b47-bec9-c36f2b179777)


#### 工作流开发
![0-0](https://github.com/user-attachments/assets/b11562c9-5302-4507-8f89-70cfe6baa6fe)
![0-1](https://github.com/user-attachments/assets/f3da75f1-90c0-4c68-a4ef-703209b0dddb)
![0-2](https://github.com/user-attachments/assets/b272acd3-ee98-4566-8a08-6f7e6745117d)
![0-3](https://github.com/user-attachments/assets/487adff9-8677-4e95-8684-275483787cdb)
![0-4](https://github.com/user-attachments/assets/750084d3-0d99-4beb-9db4-84ad23640bee)
![0-5](https://github.com/user-attachments/assets/7e9a54b3-047c-4de8-b742-73b3383599da)
![0-6](https://github.com/user-attachments/assets/5687b29f-aa9e-4da8-97a5-31e41b866a60)
![1-0](https://github.com/642933588/dataworks/assets/10755257/203c88e5-8dbc-406c-a554-373942ef267b)
![2-0](https://github.com/642933588/dataworks/assets/10755257/fc5b6ac7-21f9-4fee-83e7-a1572e141281)
![3-0](https://github.com/642933588/dataworks/assets/10755257/bdedd0b9-3f05-43e5-8252-15f3745e40ab)
![4-0](https://github.com/user-attachments/assets/16401705-cc77-453c-8ac8-b69418fd7d3d)
![4-1](https://github.com/user-attachments/assets/fe529eee-ffe6-4310-9cda-2f022a329b25)
![4-2](https://github.com/user-attachments/assets/cb4b93e6-fbbd-4788-88ed-cd9629e02da7)
![4-3](https://github.com/user-attachments/assets/15a4adb2-e28a-40e1-b508-8617660868ee)

#### 数据质量
![0](https://github.com/642933588/dataworks/assets/10755257/965a1a85-abad-4caf-b754-3792c2a00d72)
![1](https://github.com/642933588/dataworks/assets/10755257/557e5ac9-d641-4eb8-a304-476cdc68be3e)
![2](https://github.com/642933588/dataworks/assets/10755257/6150be5b-1930-4609-8e28-553417c6e7b8)
![3-1](https://github.com/642933588/dataworks/assets/10755257/24cb8837-77a3-4e96-97dd-05689f834d9f)
![3](https://github.com/642933588/dataworks/assets/10755257/3fc98712-492d-49ba-bdcf-7c54c621460c)
![4](https://github.com/642933588/dataworks/assets/10755257/705e090a-69af-4082-b389-18424b57a45e)
![5](https://github.com/642933588/dataworks/assets/10755257/50040d4d-c2da-4db9-8a8e-41f8fa4e9765)
![6](https://github.com/642933588/dataworks/assets/10755257/bf35a1e5-142c-4897-b389-4dc91b2cd9df)
![7](https://github.com/642933588/dataworks/assets/10755257/e818dab4-379b-4c03-83c5-059026b253cb)
![8](https://github.com/642933588/dataworks/assets/10755257/442d9993-ff2f-485c-9cc6-9b171ac5dd90)

#### 数据资产
![0-1](https://github.com/642933588/dataworks/assets/10755257/5bac1d76-ef6f-45c0-9e79-be0f3ff38bec)
![0-2](https://github.com/642933588/dataworks/assets/10755257/78343571-750b-45c9-90bd-e76eedd1dcc3)
![1-1](https://github.com/642933588/dataworks/assets/10755257/6eef3f96-c7b3-4496-8f38-50c2e019ede4)

![1-2](https://github.com/642933588/dataworks/assets/10755257/bb736cf5-f1b8-4afc-8e2a-0efe19309761)
![1-3](https://github.com/642933588/dataworks/assets/10755257/8fb5614a-5807-4726-b674-ea10567ca6fc)
![1-4](https://github.com/642933588/dataworks/assets/10755257/53155fb6-6273-414e-bbc2-8503bd79c88d)
![1-5](https://github.com/642933588/dataworks/assets/10755257/7f605596-242b-4c8d-a08c-50edf5ce75ae)
![1-6](https://github.com/642933588/dataworks/assets/10755257/9dfecbda-7d9c-40e9-b8b7-2340a58db2e4)
![1-8](https://github.com/642933588/dataworks/assets/10755257/f6520567-1da5-4f7b-b12b-ac9e59c8a29b)
![1-9](https://github.com/642933588/dataworks/assets/10755257/f08ea68e-a1b6-48d7-8516-71a8c72cad06)
![1-10](https://github.com/642933588/dataworks/assets/10755257/2ba81950-b09e-4400-84a6-299cdd477c7a)
![1-7](https://github.com/642933588/dataworks/assets/10755257/b5d268de-fb09-4c54-9e49-146540cf1b5a)
![2-1](https://github.com/642933588/dataworks/assets/10755257/6bf835c8-d5fc-4907-bebe-1e27a5917118)
![2-2](https://github.com/642933588/dataworks/assets/10755257/ac553d7f-820a-420a-bed1-b4cbf7dbcaab)
![2-3](https://github.com/642933588/dataworks/assets/10755257/a7c0541e-cc16-419a-83ab-852de94a9b3e)
![3-1](https://github.com/642933588/dataworks/assets/10755257/544b7a0c-b0e1-43ce-9d0e-619ba6dc9967)
![4-1](https://github.com/642933588/dataworks/assets/10755257/4861963d-bbff-4a9e-a332-d5efebebf87d)
![5-1](https://github.com/642933588/dataworks/assets/10755257/45ecc8c5-3170-4fd0-b4e0-e807350cbb41)
![6-1](https://github.com/642933588/dataworks/assets/10755257/15cfa63a-730a-4c1e-80bd-3f27a78a643f)
![9-1](https://github.com/642933588/dataworks/assets/10755257/81f52c8a-0793-49a7-a935-388dd467f19c)
![9-2](https://github.com/642933588/dataworks/assets/10755257/375e8ab1-0748-4e8f-b015-cf2e83a8abc9)

## 实践
《实时数仓（数据湖）实战》是一个以电商系统为基础，围绕电商业务指标统计需求而构建的实时数仓（数据湖）项目，涉及组件flink、paimon、doris、seatunnel、dolphinscheduler、datart、dinky、hudi、iceberg。通过该项目，可以快速掌握实时数仓（数据湖）基本概念、数仓分层构建步骤及所涉及各类大数据组件实战用法。代码地址：https://github.com/Mrkuhuo/data-warehouse-learning

## 贡献指南

我们欢迎任何形式的贡献！如果你有好的建议或发现了问题，请提交一个 Issue 或 Pull Request。
提供或赞助云服务器资源搭建云学习环境。


## 许可

本项目采用 MIT 许可证。详情请参阅 [LICENSE](LICENSE)。

## 联系我们

- 邮箱: 642933588@qq.com（qq同号）
- 加V请注明来意：smallfortheuniverse

![WechatIMG182](https://github.com/user-attachments/assets/db0fa36a-9478-49e4-8e15-07b22a8ae376)

![image](https://github.com/642933588/jiron-cloud/assets/10755257/146fa604-986a-4202-ba27-fa7842eb9a20)

## 

