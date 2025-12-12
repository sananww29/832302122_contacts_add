# IDEA中解决端口冲突的方法

当您在IDEA中启动通讯录应用时遇到端口冲突问题（如8080端口被占用），可以尝试以下解决方案：

## 方法1：修改应用配置文件

直接修改项目的配置文件，更改应用使用的端口：

1. 打开文件：`832302122_contacts_backend-main\832302122_contacts_backend\src\main\resources\application.properties`
2. 找到并修改以下行：
   ```properties
   server.port=8080  # 将8080改为其他可用端口，如8081、8888等
   ```
3. 保存文件后重新启动应用

## 方法2：在IDEA运行配置中指定端口

通过IDEA的运行配置临时覆盖默认端口：

1. 点击IDEA顶部菜单栏的「Run」→「Edit Configurations...」
2. 在左侧列表中找到您的Spring Boot应用配置
3. 切换到「Configuration」标签页
4. 在「Program arguments」或「VM options」中添加端口参数：
   - 方式A（Program arguments）：`--server.port=8081`
   - 方式B（VM options）：`-Dserver.port=8081`
5. 点击「Apply」→「OK」保存配置
6. 使用此配置重新启动应用

## 方法3：终止占用端口的进程

找到并终止占用目标端口的进程：

1. 在IDEA中打开终端（Terminal）
2. 执行命令查找占用8080端口的进程：
   ```powershell
   netstat -ano | findstr :8080
   ```
3. 记录输出中的PID（进程ID）
4. 执行命令终止该进程：
   ```powershell
   taskkill /PID <进程ID> /F
   ```
   例如：`taskkill /PID 12345 /F`
5. 重新启动应用

## 方法4：使用随机端口

让Spring Boot自动分配可用端口：

1. 打开application.properties文件
2. 修改端口配置：
   ```properties
   server.port=0
   ```
3. 保存文件后重新启动应用
4. 在控制台日志中查找应用实际使用的端口：
   ```
   Tomcat started on port(s): 56789 (http) with context path ''
   ```

## 针对当前通讯录项目的建议

1. **快速测试**：如果只是临时测试，可以使用方法2在运行配置中指定不同端口
2. **长期使用**：如果需要长期避免冲突，建议修改application.properties文件中的端口
3. **开发环境**：在开发环境中，可以考虑使用随机端口避免冲突

## 注意事项

- 更改端口后，前端页面的API地址也需要相应更新
- 确保所选端口未被其他应用占用
- 如果使用防火墙，需要确保新端口已开放