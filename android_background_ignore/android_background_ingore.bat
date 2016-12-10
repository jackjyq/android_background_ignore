::名称 android_background_ignore
::作者 白兔Jack
::版本 V0.5
::项目地址 https://github.com/Jiangyiqun/android_background_ignore
::注意 本文件必须以 ANSI 编码保存

@echo off
cls

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



::初次使用生成白名单
if exist white_list.txt (
	goto plan_menu
)

echo # 这是一份白名单，及其自身的撰写说明 > white_list.txt
echo # 收录在此的应用，后台行为不会被限制 >> white_list.txt
echo # >> white_list.txt
echo # 撰写说明： >> white_list.txt
echo # 一、依赖推送的应用，酌情添加至白名单 >> white_list.txt
echo # 原因：被限制后台的应用，长时间不用后台服务会被关掉，无法接收推送 >> white_list.txt
echo # 影响：即时通讯工具，如微信(无论是否使用GCM)；定时提醒工具，如滴答清单 >> white_list.txt
echo # 建议：只添加依赖其推送的应用，不添加手动查看消息的应用 >> white_list.txt
echo # >> white_list.txt
echo # 二、依赖广播的应用，必须添加至白名单 >> white_list.txt
echo # 原因：被限制后台的应用，无法接受系统广播，即无法随特定事件启动 >> white_list.txt
echo # 影响：第三方来电提醒，短信验证码自动拾取，悬浮按钮，剪切板增强，手势增强 >> white_list.txt
echo # 建议：通常应当添加至白名单 >> white_list.txt
echo # >> white_list.txt
echo # 三、以下应用，无需添加至白名单 >> white_list.txt
echo # 系统内置应用，输入法，启动器（Launcher），由辅助功能启动的应用（如绿色守护） >> white_list.txt
echo # >> white_list.txt
echo # 请参考以上说明，删除多余的行，仅保留需要添加至白名单的应用 >> white_list.txt
echo # >> white_list.txt
echo # 白名单: >> white_list.txt
echo. >> white_list.txt
adb shell pm list packages -3 > apps_list.txt
for /f "tokens=2 delims=:" %%i in (apps_list.txt) do (
	echo %%i >> white_list.txt
	)
echo. >> white_list.txt
echo # 请保存文件，关闭文本编辑器以继续... >> white_list.txt
del apps_list.txt
echo 请阅读并编辑 white_list.txt 文件
call white_list.txt



::用户菜单
:plan_menu
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
echo 正在处理白名单：
echo.
for /f "eol=#" %%i in (white_list.txt) do (
echo 正在恢复 %%i 为默认状态
adb shell cmd appops set %%i RUN_IN_BACKGROUND allow
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


::结束，提醒关闭USB调试
:plan_end
echo.
echo 已经完成，请关闭USB调试后，按任意键退出
pause
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