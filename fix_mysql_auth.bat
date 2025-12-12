@echo off
echo 修复MySQL认证插件问题...

echo 1. 以root用户登录MySQL（不使用密码）...
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'lby66666'; FLUSH PRIVILEGES; CREATE DATABASE IF NOT EXISTS contacts_db;" >nul 2>&1

if %errorlevel% equ 0 (
    echo MySQL认证方式已修改为mysql_native_password
    echo contacts_db数据库已创建或已存在
    echo 数据库配置已完成！
) else (
    echo 尝试使用旧密码修改...
    mysql -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'lby66666'; FLUSH PRIVILEGES; CREATE DATABASE IF NOT EXISTS contacts_db;"
    if %errorlevel% equ 0 (
        echo MySQL认证方式已修改为mysql_native_password
        echo contacts_db数据库已创建或已存在
        echo 数据库配置已完成！
    ) else (
        echo 修复失败，请手动执行以下SQL命令：
        echo 1. 登录MySQL: mysql -u root
        echo 2. 修改认证方式: ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'lby66666';
        echo 3. 刷新权限: FLUSH PRIVILEGES;
        echo 4. 创建数据库: CREATE DATABASE IF NOT EXISTS contacts_db;
        pause
        exit /b 1
    )
)

echo 现在可以重新启动后端服务了！
pause