::名称 android_background_ignore
::作者 白兔Jack
::版本 V0.2
::项目地址 https://github.com/Jiangyiqun/android_background_ignore
echo off
cls
if not exist white_list.txt (
	echo.
	echo 没有找到 white_list.txt 文件,请从如下地址下载
	echo https://github.com/Jiangyiqun/android_background_ignore
	echo 并拷贝至与 android_background_ignore.bat 相同路径下
	echo.
	pause
)

echo. 
echo 功能说明：
echo 1、可限制第三方APP的自动唤醒
echo 2、不需要 ROOT
echo 3、必须是 Android 7.0 +
echo.
echo 准备步骤：
echo 1、电脑安装 ADB
echo 2、电脑安装 Universal Android USB driver
echo 3、手机开启 USB 调试
echo.
echo 详见 https://zhuanlan.zhihu.com/p/23372646
echo.
pause
adb devices
echo 屏幕应当显示类似 "CVH7N0000000000        device" 的字串
echo 确认正确请继续，否则请重新检查准备步骤
echo.
pause

echo.
echo 功能菜单：
echo 1、限制自动唤醒
echo 2、恢复默认模式
set /p choice=请选择：
if "%choice%"=="1" goto plan_1
if "%choice%"=="2" goto plan_2

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
echo 已经完成，请关闭USB调试
echo.
pause
