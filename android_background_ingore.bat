rem 版本V0.1 
rem https://zhuanlan.zhihu.com/p/23372646
rem https://github.com/Jiangyiqun/android_background_ignore
adb devices
@pause
@adb shell pm list packages -3 > apps_list.txt
@for /f "tokens=2 delims=:" %%i in (apps_list.txt) do adb shell cmd appops set  %%i RUN_IN_BACKGROUND ignore
@pause
