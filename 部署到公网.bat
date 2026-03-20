@echo off
chcp 65001 >nul
title 部署到 Firebase Hosting

echo.
echo ========================================
echo    部署应用到 Firebase Hosting
echo ========================================
echo.

cd /d "%~dp0"

echo 检查 Firebase CLI...
where firebase >nul 2>nul
if %errorlevel% neq 0 (
    echo 正在安装 Firebase CLI...
    call npm install -g firebase-tools
)

echo.
echo ========================================
echo 重要提示：Firebase 部署步骤
echo ========================================
echo.
echo 1. 首先需要登录 Firebase（会打开浏览器）
echo 2. 选择项目 tool-77737
echo 3. 部署完成后会显示网址
echo.
echo 按任意键开始登录...
pause >nul

call firebase login

echo.
echo 开始部署...
call firebase deploy --only hosting

echo.
echo ========================================
if %errorlevel% equ 0 (
    echo 部署成功！
    echo.
    echo 访问地址：
    echo https://tool-77737.web.app
    echo 或
    echo https://tool-77737.firebaseapp.com
) else (
    echo 部署失败，请检查错误信息
)
echo ========================================
echo.

pause
