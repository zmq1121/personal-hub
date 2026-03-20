@echo off
chcp 65001 >nul
title 个人效率中心
echo.
echo ========================================
echo    个人效率中心 - 本地服务器
echo ========================================
echo.
echo 正在启动...
echo.

cd /d "%~dp0www"
node server.js

pause
