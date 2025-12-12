@echo off
echo 测试MySQL数据库连接和contacts_db是否存在...

echo 1. 检查MySQL是否运行...
netstat -ano | findstr :3306 >nul
if %errorlevel% neq 0 (
    echo MySQL服务未在端口3306运行，请启动MySQL服务
    pause
    exit /b 1
)

echo 2. 测试数据库连接和contacts_db是否存在...
mysql -u root -plby66666 -e "SHOW DATABASES LIKE 'contacts_db';" >nul 2>&1

if %errorlevel% equ 0 (
    echo contacts_db数据库已存在！
) else (
    echo contacts_db数据库不存在，正在创建...
    mysql -u root -plby66666 -e "CREATE DATABASE contacts_db;" >nul 2>&1
    if %errorlevel% equ 0 (
        echo contacts_db数据库创建成功！
    ) else (
        echo 创建数据库失败，请检查MySQL密码和权限
        pause
        exit /b 1
    )
)

echo 数据库检查完成！现在可以重新启动后端服务了。
pause