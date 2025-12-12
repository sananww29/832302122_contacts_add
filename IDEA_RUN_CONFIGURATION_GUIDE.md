# IDEA运行配置指南

## 问题分析

您在IDEA中运行后端项目时遇到了"端口被占用"的错误，但实际端口并未被占用。这是由于IDEA的工作区配置文件(`.idea/workspace.xml`)中引用了不存在的项目目录(`2020123456_contacts_backend`)，导致配置混乱。

## 解决方案

### 方案一：使用Maven命令直接运行(推荐)

这是最可靠的运行方式，不受IDEA配置影响：

1. 打开终端(在IDEA中或系统终端)
2. 进入后端项目目录：
   ```bash
   cd d:\桌面\通讯录最新\832302122_contacts_backend-main\832302122_contacts_backend
   ```
3. 运行项目：
   ```bash
   mvn spring-boot:run
   ```

### 方案二：重新配置IDEA运行设置

如果您希望在IDEA中运行，请按照以下步骤重新配置：

1. **删除旧的运行配置**
   - 点击IDEA右上角的运行配置下拉菜单
   - 选择"Edit Configurations..."
   - 删除所有与"ContactsApplication"相关的旧配置

2. **创建新的Maven运行配置**
   - 点击"+"按钮，选择"Maven"
   - **Name**: 输入"ContactsApplication"
   - **Working directory**: 选择后端项目目录 `d:\桌面\通讯录最新\832302122_contacts_backend-main\832302122_contacts_backend`
   - **Command line**: 输入`spring-boot:run`
   - 点击"OK"

3. **或者创建新的Spring Boot运行配置**
   - 点击"+"按钮，选择"Spring Boot"
   - **Name**: 输入"ContactsApplication"
   - **Module**: 选择"contacts-backend"
   - **Main class**: 选择`com.example.contacts.ContactsApplication`
   - **Working directory**: 选择后端项目目录 `d:\桌面\通讯录最新\832302122_contacts_backend-main\832302122_contacts_backend`
   - 点击"OK"

4. **运行新配置**
   - 选择新创建的配置
   - 点击运行按钮

### 方案三：使用Java命令运行JAR文件

1. 确保项目已成功构建(我们已经完成了这一步)
2. 运行JAR文件：
   ```bash
   java -jar "d:\桌面\通讯录最新\832302122_contacts_backend-main\832302122_contacts_backend\target\contacts-backend-0.0.1-SNAPSHOT.jar"
   ```

## 验证运行状态

成功运行后，您应该能看到类似以下输出：
```
2025-12-12 00:46:57.123  INFO 12345 --- [main] c.e.contacts.ContactsApplication         : Started ContactsApplication in 3.456 seconds (JVM running for 4.123)
```

## 前端配置

前端已经正确配置了API地址：
```javascript
// 文件：d:\桌面\通讯录最新\832302122_contacts_frontend-main\832302122_contacts_frontend\src\config.js
window.API_BASE = 'http://localhost:8888/api';
```

## 注意事项

1. 如果仍然遇到端口冲突问题，请尝试使用其他端口(如9999)：
   - 修改`application.properties`中的`server.port=9999`
   - 同时更新前端`config.js`中的端口

2. 确保没有旧的Java进程在运行：
   ```bash
   Get-Process -Name java | Select-Object Id, ProcessName, Path
   ```
   如果有旧进程，使用以下命令停止：
   ```bash
   Stop-Process -Id [PID] -Force
   ```

3. 重新打开IDEA可能会自动创建正确的工作区配置。