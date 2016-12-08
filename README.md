### 本项目提供原生 Android N 省电方案，所有方法都无需 Root。

- 请点击右上角 Star 收藏。
- [Release] (https://github.com/Jiangyiqun/android_background_ignore/releases)已不再维护。

## 环境设置
在开始之前，请参考[此页](https://github.com/Jiangyiqun/android_background_ignore/tree/master/adb_installer)，进行如下设置：
- 电脑安装 ADB 与 Universal Android USB driver
- 手机开启 USB 调试, 并用USB线与电脑相连

## 省电方法
请同时使用下述方法，以达到最佳省电效果

1. 使用 [后台限制脚本](https://github.com/Jiangyiqun/android_background_ignore/tree/master/android_background_ignore) ，限制应用唤醒
2. 使用 [绿色守护](https://github.com/Jiangyiqun/android_background_ignore/tree/master/greenify)，锁屏自动关闭应用
3. 若不常翻墙，请停用[部分内置应用](https://github.com/Jiangyiqun/android_background_ignore/tree/master/disable_google_apps) 

## 其它
以下相关内容，对省电影响并不大
- 若不常翻墙，建议[修改网络验证服务器](https://github.com/Jiangyiqun/android_background_ignore/tree/master/captive_portal_server_changer)
- 推荐使用 [WakeLockDetector](https://github.com/Jiangyiqun/android_background_ignore/wiki/WakeLockDetector)，分析耗电情况
