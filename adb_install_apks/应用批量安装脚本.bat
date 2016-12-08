@echo off 
title ADB Install Apks[By LongLuo]
goto BEGIN


:COMMENT
echo ##############################################
rem 	adb_install_apks.bat
rem			By Long.Luo @2013/03/20
rem		
rem 	Description:
rem 		Used to install all the apks in a PATH including 
rem 	the subdirs.
rem 
rem 	Version: 2.5
rem
echo ##############################################
pause


:BEGIN
echo.
echo ################   开始...    ################ 


:HELP
rem 无文件拖至bat时 
if "%~1"=="" echo 请将apk直接拖放至bat文件！&goto END 
 
echo 注意事项:
echo 支持多apk文件安装,即选中所有你要安装的apk拖动至此bat上！ 


:MAIN
setlocal enabledelayedexpansion 
if not "%~1"=="" ( 
  echo. 
  rem 文件后缀名判断 
  if /i "%~x1"==".apk" ( 
    echo 安装"%~1"... 
	adb install -r "%~1"
  ) else ( 
    echo 文件类型错误：不支持%~x1！ 
  ) 
 
  shift /1 
  goto MAIN 
) 


:END
echo.
echo ################  全部apk文件已安装!   ################
pause
