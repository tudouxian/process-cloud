# process-cloud
后端基于flowable、前端基于bpmn.js二次开发，微服务化流程引擎管理功能，提供流程模型编辑到部署监控一站式解决方案，扩展了众多官方API，提供项目微服务化集成方案。
## 引擎简介

如果你是新手，那么这绝对是你拿来学习flowable流程引擎最佳的项目；如果你对流程引擎熟悉，并且着手用流程引擎来辅助项目，那么这绝对是你最好的流程引擎微服务管理端。


* 本项目用户体系测试环境依赖若依，开发者可以切换集成自己公司的。
* 本项目技术采用Spring Boot、Spring Cloud & Alibaba。
* 注册中心、配置中心选型Nacos。
* 流量控制框架选型Sentinel，分布式事务选型Seata。
* RPC实现有Dubbo版本和OpenFeign版本。
* 文件存储Minio

## 友情链接
- BPMN.js封装不错的模型设计器项目[process-designer](https://miyuesc.github.io/process-designer/）
- 单体架构集成版本 [workflow](https://github.com/tudouxian/workflow.git)
- 大多数时候我们仅仅想学习、练手流程引擎，甚至用来快速处理项目中的问题。微服务化明显部署太过复杂了。因此，过后会实现单体架构，并且拥有对应功能的项目，这样实用性更强，甚至能方便的用来接项目。

## 系统模块

~~~
process-cloud     
├── process-bussiness              // 流程引擎对接示例 [9208]
├── process-bussiness-front         // 流程引擎对接示例前端 [80]
├── process-center            // 流程引擎核心 [9206]
├── process-cloud-front            // 流程引擎核心前端  [80]
├── process-center-api             // 对外提供服务接口模块
├── process-form-center         // 自定义表单核心 [9207]
├── process-common          // 通用模块
│       └── process-common-pojo                         // 核心模块
│       └── process-idm-pojo                    // 
│       └── process-center-pojo                    // 
├── process-idm-api         // 用户体系对接依赖
├── process-gateway          // 流程引擎网关  [8080]
├── process-idm          // 若依开源项目
│       └── ruoyi-api                      
│       └── ruoyi-auth                         // 认证中心  [9200]
│       └── ruoyi-common                       
│       └── ruoyi-modules   
│                   └── ruoyi-file    
│                   └── ruoyi-gen                        
│                   └── ruoyi-job                        
│                   └── ruoyi-system       // 用户体系  [9201]                                                             
├──pom.xml                // 公共依赖
~~~

## 系统部署
* 安装nacos、redis、mysql、minio
* 执行sql脚本
* 更改相应配置
* 启动项目-其中必须启动的 system、auth、gateway、processCenter，运行前端，其他服务按需要启动

## 架构图
![](http://image.zmxblog92.com/%E5%B7%A5%E4%BD%9C%E6%B5%81%E5%BC%95%E6%93%8E%E6%9E%B6%E6%9E%84%E5%9B%BE.png)
## 特色功能
![](http://image.zmxblog92.com/%E6%B5%81%E7%A8%8B%E8%B5%B0%E5%90%91%E5%9B%BE.png)

1.  辅助模型设计：将流程分类、流程表达式、流程监听器、流程审核按钮外置表单化，便于设计阶段选择。
2.  模型设计器：重新设计用户任务、服务任务、分支条件、表单挂载。
3.  流程服务管理：便于流程发布及版本管理。
4.  流程运行时管理：分为个人工作台和管理工作台，个人工作台仅仅展示当前登录用户相关任务，管理工作台展示所有人员相关任务，便于运行时干预。
5.  通用审核操作：审核同意、指定驳回、转办、委派、协同、前加签、后加签、归还任务、流程升级迁移等作了统一封装。
6.  跟踪监控：用BPMN.js重绘跟踪监控图，能动态展示各节点运行时状态。
## 在线体验
- admin/admin123
- 新的更新第一时间会在体验服务上出现

演示地址：http://47.96.74.120  
## 演示图
![](http://image.zmxblog92.com/%E6%A8%A1%E5%9E%8B%E8%AE%BE%E8%AE%A1%E5%99%A8.png)
![](http://image.zmxblog92.com/%E7%AE%A1%E7%90%86%E5%88%97%E8%A1%A8.png)
![](http://image.zmxblog92.com/%E8%B7%9F%E8%B8%AA%E7%9B%91%E6%8E%A7.png)


## 流程引擎交流群&公众号
微信搜索 土豆仙
后续会更新流程引擎学习文章 

公众号
![公众号](http://image.zmxblog92.com/%E5%85%AC%E4%BC%97%E5%8F%B7.jpg)


QQ群
![QQ群](http://image.zmxblog92.com/qq%E7%BE%A4.jpg)