@echo off

setlocal enabledelayedexpansion

REM 设置同步仓库路径
set sync_dir=%~dp0DesktopMirror

REM 配置restic相关环境变量
REM 弱密码是故意设计
set RESTIC_PASSWORD=password
REM 设置同步仓库
set RESTIC_REPOSITORY=%sync_dir%
REM 恢复目录
set RESTORE_TARGET=%~dp0LatestDesktop

REM 恢复最近一次备份
restic --verbose=2 restore latest --target %RESTORE_TARGET%

REM pause