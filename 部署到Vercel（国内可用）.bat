@echo off
chcp 65001 >nul
title 部署到 Vercel（国内可访问）

echo.
echo ========================================
echo    部署应用到 Vercel（国内可直接访问）
echo ========================================
echo.

cd /d "%~dp0"

echo 检查 Vercel CLI...
where vercel >nul 2>nul
if %errorlevel% neq 0 (
    echo 正在安装 Vercel CLI...
    call npm install -g vercel
)

echo.
echo ========================================
echo 重要提示：Vercel 部署步骤
echo ========================================
echo.
echo 1. 首次使用需要登录 Vercel（会打开浏览器）
echo 2. 可以用 GitHub/GitLab/Email 登录
echo 3. 部署完成后会显示网址
echo.
echo 按任意键开始部署...
pause >nul

echo.
echo 开始部署...
call vercel --prod

echo.
echo ========================================
echo 部署完成！
echo.
echo 提示：
echo - Vercel 在中国可以直接访问
echo - 数据保存在浏览器本地
echo - 使用导出/导入功能可在不同设备间迁移数据
echo ========================================
echo.

pause
