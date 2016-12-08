### 本项目提供原生 Android N 省电方案，所有方法都无需 Root。

2016年12月8日大改，如有链接失效，请告诉我哈^^。感觉有用请点击右上角 Star 收藏。

访问如下页面参与讨论：
- http://bbs.gfan.com/android-8418350-1-1.html
- https://zhuanlan.zhihu.com/p/23372646
- http://bbs.gfan.com/android-8411134-1-1.html

## 环境设置
在开始之前，请参考[此页](https://github.com/Jiangyiqun/android_background_ignore/tree/master/adb_installer)，进行如下设置：
- 电脑安装 ADB 与 Universal Android USB driver
- 手机开启 USB 调试, 并用USB线与电脑相连

## 省电方法
请同时使用下述方法，以达到最佳省电效果

1. 使用 [后台限制脚本](https://github.com/Jiangyiqun/android_background_ignore/tree/master/android_background_ignore) ，限制应用唤醒
2. 使用 [绿色守护](https://github.com/Jiangyiqun/android_background_ignore/tree/master/greenify)，锁屏自动关闭应用
3. 若不常翻墙，请停用[部分内置应用](https://github.com/Jiangyiqun/android_background_ignore/tree/master/disable_google_apps) 

## 补充说明
以下相关内容，对省电影响并不大
- 若不常翻墙，建议[修改网络验证服务器](https://github.com/Jiangyiqun/android_background_ignore/tree/master/captive_portal_server_changer)
- 推荐使用 [WakeLockDetector](https://github.com/Jiangyiqun/android_background_ignore/tree/master/wake_lock_detector)，分析耗电情况
