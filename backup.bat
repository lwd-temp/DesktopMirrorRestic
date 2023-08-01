@echo off

setlocal enabledelayedexpansion

REM 获取当前用户桌面路径
set desktop=%userprofile%\Desktop

REM 设置同步仓库路径
set sync_dir=%~dp0DesktopMirror

REM 配置restic相关环境变量
REM 弱密码是故意设计
set RESTIC_PASSWORD=password
REM 设置同步仓库
set RESTIC_REPOSITORY=%sync_dir%

REM 如果同步仓库不存在，则初始化它
if not exist %sync_dir% restic init

REM 同步桌面到仓库
restic --verbose=2 backup %desktop%

REM pause