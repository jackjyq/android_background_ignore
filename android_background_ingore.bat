::名称 android_background_ignore
::作者 白兔Jack
::版本 V0.4
::项目地址 https://github.com/Jiangyiqun/android_background_ignore
::注意 批处理必须用ANSI编码才能运行，否则会闪退

::程序完整性检测
@echo off
cls
if not exist white_list.txt (
	echo.
	echo 没有找到 white_list.txt 文件,请从如下地址下载
	echo https://github.com/Jiangyiqun/android_background_ignore
	echo 并拷贝至与 android_background_ignore.bat 相同路径下
	echo 如果你不需要白名单，请按回车键跳过该步骤
	pause
)

::运行环境检测
echo. 
echo 本程序可限制第三方APP的自动唤醒，系统必须是 Android 7.0 +，需要开启USB调试。
:plan_start
echo. 
adb devices | findstr "device$"
if errorlevel 1 (
	echo 出错了！详情如下：
	adb devices
	echo.
	echo 请检查以下步骤：
	echo 1、电脑安装 ADB
	echo 2、电脑安装 Universal Android USB driver
	echo 3、手机开启 USB 调试
	echo.
	pause
	goto plan_start
)
echo.

::用户菜单
echo.
echo 功能菜单：
echo 1、限制自动唤醒
echo 2、恢复默认模式
set /p choice=请选择：
if "%choice%"=="1" goto plan_1
if "%choice%"=="2" goto plan_2

::限制自动唤醒
:plan_1
echo.
echo 正在限制自动唤醒：
adb shell pm list packages -3 > apps_list.txt
for /f "tokens=2 delims=:" %%i in (apps_list.txt) do (
	echo 正在限制 %%i 的自动唤醒
	adb shell cmd appops set %%i RUN_IN_BACKGROUND ignore
)
del apps_list.txt

echo.
echo 正在处理白名单(请忽略该步骤中的报错）：

if exist white_list.txt (
	echo.
	for /f "eol=#" %%i in (white_list.txt) do (
	echo 正在恢复 %%i 为默认状态
	adb shell cmd appops set %%i RUN_IN_BACKGROUND allow
	)
)
	
if not exist white_list.txt (
	echo.
	echo 没有找到white_list.txt文件,跳过处理白名单
	goto plan_end
)
goto plan_end

::恢复默认模式
:plan_2
echo.
echo 正在恢复默认模式：
adb shell pm list packages -3 > apps_list.txt
for /f "tokens=2 delims=:" %%i in (apps_list.txt) do (
	echo 正在恢复 %%i 为默认状态
	adb shell cmd appops set %%i RUN_IN_BACKGROUND allow
)
del apps_list.txt
goto plan_end

:plan_end
echo.
echo 已经完成，请关闭USB调试后，按任意键退出
pause

::提醒关闭USB调试
:plan_USB
adb devices | findstr "device$"
echo.
if errorlevel 1 (
	exit
)
if errorlevel 0 (
	echo USB调试未关闭！
	echo.
	echo 请关闭USB调试后，按任意键退出
	pause
	goto plan_USB
)
