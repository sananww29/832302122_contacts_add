# 作业博客模板（可直接拷贝到你博客平台并完善）

目录（示例，可生成可跳转 TOC）
- [前置说明](#前置说明)
- [代码仓库链接与代码规范链接](#代码仓库链接与代码规范链接)
- [PSP 表格](#psp-表格)
- [成品效果展示](#成品效果展示)
- [设计与实现流程](#设计与实现流程)
- [代码解析](#代码解析)
- [个人总结与收获](#个人总结与收获)

## 前置说明
- 本次作业所属课程：XXXX
- 作业要求：通讯录系统（前后端分离），实现新增/修改/删除
- 作业目标：完成基础功能与可部署版本
- 参考资料：Spring Boot 文档、MySQL 文档、Airbnb/Google 代码规范

## 代码仓库链接与代码规范链接
- 前端仓库：<你的 GitHub 前端仓库地址>
- 后端仓库：<你的 GitHub 后端仓库地址>
- 代码规范：
  - 后端（Google Java Style）：https://google.github.io/styleguide/javaguide.html
  - 前端（Airbnb JavaScript）：https://github.com/airbnb/javascript

## PSP 表格
| PSP 阶段 | 预估时间(h) | 实际时间(h) |
| --- | ---: | ---: |
| 需求分析 |  |  |
| 设计（架构/数据库/接口） |  |  |
| 编码（后端） |  |  |
| 编码（前端） |  |  |
| 联调与自测 |  |  |
| 部署上线 |  |  |
| 文档与博客撰写 |  |  |
| 合计 |  |  |

## 成品效果展示
- 建议提供 10+ 截图或 GIF/视频，包含：
  - 列表页
  - 新增成功
  - 修改成功（数据库值变化对比）
  - 删除成功
  - 错误校验提示
  - 接口 Postman/HTTP 调用截图
  - 云服务器访问链接与页面

## 设计与实现流程
- 架构：前后端分离，REST API
- 数据库结构：
  - 表：`contacts(id, name, phone, email, created_at, updated_at)`
- 接口设计：
  - GET `/api/contacts`；GET `/api/contacts/{id}`；POST `/api/contacts`；PUT `/api/contacts/{id}`；DELETE `/api/contacts/{id}`
- 前端流程：加载列表 → 表单新增 → 行内编辑 → 删除 → 刷新
- 后端流程：Controller → Service → Repository → MySQL

## 代码解析
- 核心后端代码与说明（Controller/Service/Repository/DTO/Entity）
- 前端调用后端的关键代码与异常处理

## 个人总结与收获
- 难点与解决方案
- 对前后端分离与工程化的理解
- 后续扩展计划（搜索、分页、导入导出、登录鉴权等）


