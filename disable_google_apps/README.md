若你不使用Google的应用(不常翻墙)，可停用部分内置应用，这会**明显延长待机时间**。

停用内置应用并非为了整洁美观，而是出于省电的实际要求。推荐使用[WakeLock Detector Lite](https://github.com/Jiangyiqun/android_background_ignore/tree/master/wake_lock_detector)查看，只尝试停用影响休眠的应用，而不是**“ 能停用的都停用 ”**。后者无助于省电，并可能导致不可预知的问题。

##  停用 Google Play Services
若无法显示，请点击设置 - 应用 - 显示系统进程。
* Google Account Manager 账号管理程序
* Google Backup Transport 备份传输
* Google Play Services 服务(若无法停禁用，请点击设置-安全-设备管理器，然后取消Google Play服务)
* Google Play Services Framwork 服务框架

## 停用依赖 Google Play Services 的应用
* Calendar 日历
* Device Policy
* Drive 云端硬盘
* Gmail
* Google App ([无法停用？](https://github.com/Jiangyiqun/android_background_ignore/wiki/%E5%A6%82%E4%BD%95%E5%81%9C%E7%94%A8-Google-APP-%3F))
* Google Play Games 游戏
* Google Play Music音乐
* Google Play Store商店
* Hanouts 环聊
* Maps 地图
* Photos 照片
* Project Fi
* Youtube

注：若造成异常，可使用[重置应用偏好](https://github.com/Jiangyiqun/android_background_ignore/wiki/%E5%A6%82%E4%BD%95%E6%81%A2%E5%A4%8D%EF%BC%9F)功能恢复
