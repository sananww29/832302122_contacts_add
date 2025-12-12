# 通讯录系统手动配置指南

## 1. 修复MySQL认证问题

**问题**：MySQL出现 `caching_sha2_ password` 插件无法加载的错误

**手动解决步骤**：

1. 打开命令提示符（CMD）
2. 以root用户登录MySQL（不使用密码）：
   ```
   mysql -u root
   ```
   *如果需要密码，输入你的MySQL root密码*

3. 在MySQL命令行中执行以下命令：
   ```sql
   -- 修改root用户认证方式为mysql_native_password
   ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'lby66666';
   
   -- 刷新权限
   FLUSH PRIVILEGES;
   
   -- 创建数据库
   CREATE DATABASE contacts_db;
   
   -- 退出MySQL
   EXIT;
   ```

## 2. 确认后端服务配置

### 检查后端配置文件
路径：`832302122_contacts_backend\src\main\resources\application.properties`

确保配置正确：
```properties
# 端口配置
server.port=8081

# 数据库配置
spring.datasource.url=jdbc:mysql://localhost:3306/contacts_db?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=lby66666
```

### 检查前端API配置
路径：`832302122_contacts_frontend\src\config.js`

已修复为：
```javascript
window.API_BASE = 'http://localhost:8081/api';
```

## 3. 启动后端服务

### 使用IntelliJ IDEA启动

1. 打开IntelliJ IDEA
2. 点击"Open"，选择后端项目目录 `832302122_contacts_backend`
3. 等待项目导入完成

### 解决Maven窗口不显示项目问题
1. 打开Maven窗口（右侧边栏或 `View` > `Tool Windows` > `Maven`）
2. 点击Maven窗口左上角的 `+` 按钮（Add Maven Projects）
3. 在文件选择对话框中导航到项目目录下的 `pom.xml` 文件
4. 选中pom.xml文件，点击 `OK`
5. 等待IDEA识别并加载Maven项目
6. 点击Maven窗口左上角的刷新按钮（🔄）确保项目刷新完成

### 配置JDK和Maven
1. 点击 `File` > `Project Structure`
2. 在 `Project` 选项卡中，确保 `Project SDK` 设置为JDK 1.8
3. 点击 `File` > `Settings` > `Build, Execution, Deployment` > `Build Tools` > `Maven`
4. 确保 `Maven home directory` 配置正确

### 运行后端应用
1. 在Maven窗口中，展开 `Plugins` > `spring-boot`
2. 双击 `spring-boot:run` 命令启动应用
3. 或找到 `src/main/java/com/example/contacts/ContactsApplication.java` 文件，右键点击选择 `Run ContactsApplication.main()`
4. 查看控制台输出，确认服务启动成功：
   ```
   Tomcat started on port(s): 8081 (http)
   Started ContactsApplication in X seconds
   ```

### 使用Maven命令启动

如果已安装Maven：
1. 打开CMD
2. 进入后端项目目录：
   ```
   cd D:\桌面\STUDY\大三上课件23\软件工程\通讯录\832302122_contacts_backend
   ```
3. 执行启动命令：
   ```
   mvn spring-boot:run
   ```

## 4. 测试API连接

1. 确保后端服务已启动
2. 打开浏览器，访问：
   ```
   http://localhost:8081/api/contacts
   ```

3. 如果看到类似以下输出，说明API连接成功：
   ```json
   []
   ```
   *（初始为空数组，表示没有联系人数据）*

## 5. 启动前端页面

### 方法1：直接在浏览器中打开（推荐）
1. 找到前端目录下的 `通讯录.html` 文件
2. 直接在浏览器中打开该文件
3. 页面将自动连接到后端服务 `http://localhost:8080/api`

### 方法2：使用VS Code的Live Server插件
1. 打开前端项目目录 `832302122_contacts_frontend-main\832302122_contacts_frontend`
2. 右键点击 `通讯录.html`，选择"Open with Live Server"
3. 浏览器会自动打开前端页面，页面将连接到后端服务 `http://localhost:8080/api`

### 方法3：在IDEA中打开前端页面

#### 方式1：在IDEA中使用内置浏览器预览
1. 在IDEA中打开项目结构
2. 导航到前端项目目录 `832302122_contacts_frontend-main\832302122_contacts_frontend`
3. 找到并双击打开 `通讯录.html` 文件
4. 在编辑器右上角点击浏览器图标（如Chrome、Firefox等）
5. IDEA将在内置浏览器或外部浏览器中打开页面

#### 方式2：在IDEA中配置前端项目
1. 点击 `File` > `Open`
2. 选择前端项目目录 `832302122_contacts_frontend-main\832302122_contacts_frontend`
3. 点击 `OK` 导入项目
4. 在项目结构中找到 `通讯录.html` 文件
5. 右键点击该文件，选择 `Open in Browser` > 选择您的浏览器

#### 方式3：使用IDEA的Live Edit功能（推荐开发时使用）
1. 确保已安装并启用 `Live Edit` 插件
2. 打开 `通讯录.html` 文件
3. 点击右上角的 `Debug` 按钮（小虫子图标）
4. IDEA将启动一个本地服务器并在浏览器中打开页面
5. 修改前端代码后，页面将自动刷新（需要浏览器支持）

## 6. 测试应用功能

### 准备工作
1. 确保后端服务已成功启动（端口8080）
2. 已打开前端页面（通讯录.html）
3. 页面右上角的API连接状态显示正常

### 功能测试步骤

#### 1. 新增联系人
1. 在"姓名"输入框中输入联系人姓名（必填）
2. 在"手机号"输入框中输入联系电话（必填）
3. 在"邮箱"输入框中输入邮箱地址（可选）
4. 在"分类"下拉菜单中选择联系人分类（可选）
5. 点击"新增"按钮
6. 验证：联系人列表中应显示刚添加的联系人信息

#### 2. 查看联系人列表
1. 点击"刷新"按钮
2. 验证：页面应显示所有已添加的联系人
3. 检查列表列：序号、姓名、手机号、邮箱、分类、操作

#### 3. 编辑联系人
1. 找到要编辑的联系人，点击操作列中的"编辑"按钮
2. 联系人信息将填充到上方的输入框中
3. 修改需要更新的信息（如手机号、邮箱、分类等）
4. 点击"保存"按钮
5. 验证：联系人列表中该联系人的信息已更新

#### 4. 删除联系人
1. 找到要删除的联系人，点击操作列中的"删除"按钮
2. 系统会弹出确认对话框
3. 点击"确定"确认删除
4. 验证：该联系人已从列表中移除

#### 5. 分类功能测试
1. 添加多个不同分类的联系人（如家人、同学、老师）
2. 验证：列表中正确显示各联系人的分类信息

### 数据验证
1. 姓名和手机号为必填项，尝试不填写这些字段点击"新增"，应显示错误提示
2. 邮箱格式验证：输入无效邮箱格式，应显示错误提示
3. 手机号格式验证：输入无效手机号，应显示错误提示

## 7. 切换数据库配置（可选）

### 从H2内存数据库切换到MySQL

**注意：** 本项目默认已配置为H2内存数据库，如需切换到MySQL，请按照以下步骤操作：

1. **修改pom.xml**
   - 将MySQL驱动的scope从"provided"改为"runtime"
   - 注释或删除H2数据库依赖

   ```xml
   <!-- MySQL驱动 -->
   <dependency>
       <groupId>mysql</groupId>
       <artifactId>mysql-connector-java</artifactId>
       <version>8.0.33</version>
       <scope>runtime</scope> <!-- 改为runtime -->
   </dependency>
   <!-- 注释或删除H2依赖 -->
   <!-- <dependency>
       <groupId>com.h2database</groupId>
       <artifactId>h2</artifactId>
       <scope>runtime</scope>
   </dependency> -->
   ```

2. **修改application.properties**
   - 恢复MySQL数据库配置
   - 注释或删除H2数据库配置

   ```properties
   # 恢复MySQL配置
   spring.datasource.url=jdbc:mysql://localhost:3306/contacts_db?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC
   spring.datasource.username=root
   spring.datasource.password=lby66666
   spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
   spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL5InnoDBDialect
   spring.jpa.hibernate.ddl-auto=update
   
   # 注释或删除H2配置
   # spring.datasource.url=jdbc:h2:mem:contacts_db;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE
   # spring.datasource.username=sa
   # spring.datasource.password=password
   # spring.datasource.driver-class-name=org.h2.Driver
   # spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.H2Dialect
   # spring.jpa.hibernate.ddl-auto=create-drop
   # spring.h2.console.enabled=true
   # spring.h2.console.path=/h2-console
   ```

3. **启动MySQL服务**
   - 确保MySQL服务正在运行
   - 创建名为`contacts_db`的数据库

4. **重新启动后端服务**

## 常见问题排查

### Q: 后端启动失败，提示数据库连接错误
**A**: 检查数据库服务是否运行，以及数据库是否已创建

### Q: 前端显示"链接失败"
**A**: 确保后端服务已启动，且前端API_BASE配置正确（应为http://localhost:8080/api）

### Q: MySQL无法登录
**A**: 尝试重启MySQL服务，或使用本指南中的方法修复MySQL认证问题

### Q: 8080端口被占用
**A**: 执行以下命令杀死占用端口的进程：
```
netstat -ano | findstr :8080  # 查找占用端口的PID
taskkill /F /PID <PID>        # 替换<PID>为实际进程ID
```

### Q: 新增联系人失败
**A**: 检查必填字段是否已填写，确保网络连接正常