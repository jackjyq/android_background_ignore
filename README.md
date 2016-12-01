# 功能简介：
限制非ROOT手机APP的自动唤醒

# 适用情况：
- 该方法仅适用于Android N，特别推荐原生Android使用
- 该方法并不完美，若手机已ROOT，推荐使用其它更彻底的方案
- 内置后台限制功能的安卓（如MIUI、EMUI），无需使用本方法

# 使用步骤：

1. 下载[android_background_ingore.bat](https://raw.githubusercontent.com/Jiangyiqun/android_background_ignore/master/android_background_ingore.bat)与[whitelist.txt](https://raw.githubusercontent.com/Jiangyiqun/android_background_ignore/master/white_list.txt)(编码必须是ANSI,即记事本默认编码)
2. 电脑安装 [ADB](http://forum.xda-developers.com/showthread.php?p=48915118#post48915118)与[Universal Android USB driver](http://dl.google.com/android/repository/usb_driver_r11-windows.zip)
3. 手机开启 USB 调试 
4. 运行 android_background_ingore.bat  ([乱码?闪退?](https://github.com/Jiangyiqun/android_background_ignore/wiki))

# 技术说明：
Android N 新增一个AppOps项 RUN_IN_BACKGROUND，可限制指定APP自动唤醒，如下：

> For this implementation, we now keep track of how long a uid has
been in the background, and after a certain amount of time
(currently 1 minute) we mark it as "idle".  Any packages associated
with that uid are then no longer allowed to run in the background.
This means, until the app next goes in the foreground:

> - No manifest broadcast receivers in the app will execute.
> - No services can be started (binding services is still okay,
>   as this is outside dependencies on the app that should still
  be represented).
> - All alarms for the app are cancelled and no more can be set.
> - All jobs for the app are cancelled and no more can be scheduled.
> - All syncs for the app are cancelled and no more can be requested.

- 参考：[Android 7的新AppOps项：RUN_IN_BACKGROUND到底做了什么](https://zhuanlan.zhihu.com/p/22162719)
- 参考：[Google documents: Background Optimizations](https://developer.android.com/topic/performance/background-optimization.html)

本项目即给所有**第三方APP**执行如下命令：
> adb shell cmd appops set <package_name> RUN_IN_BACKGROUND ignore

# 已知问题：

## 问题1：部分APP工作异常

限制后台行为会影响部分APP正常工作，主要包括：
- 消息推送无法及时送达，如微信及滴答清单的提醒功能
- 依赖广播的APP无法自动唤醒，如：来电提醒、短信验证码复制

问题1对策:
- 使用[白名单](https://github.com/Jiangyiqun/android_background_ignore/blob/master/white_list.txt)，排除指定 APP。

## 问提2：部分APP仍会唤醒

1. 无法阻止JobScheduler自动唤醒APP，例如大众点评、Bilibili; 这种唤醒频率较低，[听说](https://www.zhihu.com/question/24360587)较为省电
2. 无法阻止添加系统账号导致的互相唤醒，阿里系多使用此方法
3. 无法阻止ShareServie导致的互相唤醒，百度系多使用此方法

问题2对策：
- 使用[绿色守护](http://www.coolapk.com/apk/com.oasisfeng.greenify)的非ROOT自动休眠（[参见](https://zhuanlan.zhihu.com/p/23372646)）