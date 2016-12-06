# 项目简介：
本页面提供限制 APP 自动唤醒的方法，仅适用于 Android N，推荐用于未 Root 的原生Android。更多省电方法，请参见 [Wifi页面](https://github.com/Jiangyiqun/android_background_ignore/wiki)。

### 讨论：

- https://zhuanlan.zhihu.com/p/23372646
- http://bbs.gfan.com/android-8411134-1-1.html

# 使用步骤：

1. 电脑安装 ADB 与 Universal Android USB driver ([如何安装？](https://github.com/Jiangyiqun/android_background_ignore/wiki/%E5%A6%82%E4%BD%95%E5%AE%89%E8%A3%85ADB%E4%B8%8E%E9%A9%B1%E5%8A%A8%EF%BC%9F))
2. 手机开启 USB 调试 ([如何开启?](https://github.com/Jiangyiqun/android_background_ignore/wiki/%E5%A6%82%E4%BD%95%E5%BC%80%E5%90%AFUSB%E8%B0%83%E8%AF%95%EF%BC%9F))
3. 下载 [android_background_ingore](https://github.com/Jiangyiqun/android_background_ignore/releases) 并运行([乱码?闪退?](https://github.com/Jiangyiqun/android_background_ignore/wiki/%E6%89%B9%E5%A4%84%E7%90%86%E4%B9%B1%E7%A0%81,%E9%97%AA%E9%80%80))。

注： 该操作可以[恢复](https://github.com/Jiangyiqun/android_background_ignore/wiki/%E5%A6%82%E4%BD%95%E6%81%A2%E5%A4%8D%EF%BC%9F)


# 技术说明：
Android N 新增一个AppOps项 RUN_IN_BACKGROUND，可限制指定APP自动唤醒，如下：

> For this implementation, we now keep track of how long a uid has
> been in the background, and after a certain amount of time
> (currently 1 minute) we mark it as "idle".  Any packages associated
> with that uid are then no longer allowed to run in the background.
> This means, until the app next goes in the foreground:

> - No manifest broadcast receivers in the app will execute.
> - No services can be started (binding services is still okay,
>   as this is outside dependencies on the app that should still
>   be represented).
> - All alarms for the app are cancelled and no more can be set.
> - All jobs for the app are cancelled and no more can be scheduled.
> - All syncs for the app are cancelled and no more can be requested.

- 参考：[Initial stab at background check](https://android.googlesource.com/platform/frameworks/base/+/bef28feba57be7fd6a4d14a85a8229154338b2ed%5E%21/core/java/android/app/AppOpsManager.java)
- 参考：[Background Optimizations](https://developer.android.com/topic/performance/background-optimization.html)

本项目即给所有**第三方APP**执行如下命令：
> adb shell cmd appops set <package_name> RUN_IN_BACKGROUND ignore

# 已知问题：

### 问题1：部分APP工作异常

限制后台行为会影响部分APP正常工作，主要包括：
- 消息推送无法及时送达，如微信及滴答清单的提醒功能
- 依赖广播的APP无法自动唤醒，如：来电提醒、短信验证码复制

对策: 使用[白名单](https://github.com/Jiangyiqun/android_background_ignore/blob/master/white_list.txt)，排除指定 APP。

### 问提2：部分APP仍会唤醒

1. 无法阻止JobScheduler自动唤醒APP，例如大众点评、Bilibili; 这种唤醒频率较低，[听说](https://www.zhihu.com/question/24360587)较为省电
2. 无法阻止添加系统账号导致的互相唤醒，阿里系多使用此方法
3. 无法阻止ShareServie导致的互相唤醒，百度系多使用此方法

对策：使用[绿色守护](https://github.com/Jiangyiqun/android_background_ignore/wiki/%E7%BB%BF%E8%89%B2%E5%AE%88%E6%8A%A4)的非ROOT自动休眠

### 问题3：无法限制内置APP唤醒

本项目不会限制内置APP，在不翻墙的情况下，内置的Google应用耗电较多

对策：参考[内置应用停用列表](https://github.com/Jiangyiqun/android_background_ignore/wiki/%E5%86%85%E7%BD%AE%E5%BA%94%E7%94%A8%E5%81%9C%E7%94%A8%E5%88%97%E8%A1%A8)， 停用部分Google应用