@echo off
chcp 65001 >nul
echo 测试MySQL连接...

echo 1. 尝试连接MySQL服务器...
mysql -u root -plby66666 -e "SELECT VERSION();" 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo 连接失败，正在修复认证问题...
    mysql -u root -plby66666 --default-auth=mysql_native_password -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'lby66666'; FLUSH PRIVILEGES;" 2>nul
    if %ERRORLEVEL% NEQ 0 (
        echo 修复失败，请确保MySQL服务已启动，并且密码正确
        pause
        exit 1
    )
    echo 认证问题已修复！
)

echo 2. 检查contacts_db数据库是否存在...
mysql -u root -plby66666 --default-auth=mysql_native_password -e "SHOW DATABASES LIKE 'contacts_db';" 2>nul | findstr "contacts_db"
if %ERRORLEVEL% NEQ 0 (
    echo 数据库不存在，正在创建...
    mysql -u root -plby66666 --default-auth=mysql_native_password -e "CREATE DATABASE IF NOT EXISTS contacts_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" 2>nul
    if %ERRORLEVEL% NEQ 0 (
        echo 创建数据库失败
        pause
        exit 1
    )
    echo 数据库创建成功！
)

echo 3. 测试应用配置的数据库连接...
mysql -u root -plby66666 --default-auth=mysql_native_password -e "USE contacts_db; SELECT 1;" 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo 数据库连接测试失败
    pause
    exit 1
)

echo 所有测试通过！应用应该可以正常启动了。
pause