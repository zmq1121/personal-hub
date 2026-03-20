@echo off
cd /d "%~dp0www"
start http://localhost:8080
python -m http.server 8080
