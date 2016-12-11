微信推送延时排查指南：

### 后台限制脚本
无论是否使用GCM，把微信加入 android_background_ignore.bat 白名单

### 休眠Wifi连接
设置 - WLAN - 配置WLAN（右上角齿轮图标） - 在休眠状态下保持WLAN网路连接 - 始终

![](https://github.com/Jiangyiqun/android_background_ignore/raw/master/wechat_delay/wifi.png)

### 电池优化
设置 - 电池 - 电池优化（右上角三个点图标） -  所有应用 - 微信 - 未优化

![](https://github.com/Jiangyiqun/android_background_ignore/raw/master/wechat_delay/battery.png)

### 自动同步
设置 - 账号 - 右上角三个点图标 - 勾选自动数据同步

![](https://raw.githubusercontent.com/Jiangyiqun/android_background_ignore/master/wechat_delay/autosync.png)

添加账号 - 微信 - 点击你的用户名 - 勾选通讯录同步

![](https://raw.githubusercontent.com/Jiangyiqun/android_background_ignore/master/wechat_delay/sync.png)

### 后台数据
设置 - 应用 - 微信 - 流量使用情况 - 允许后台数据

![](https://github.com/Jiangyiqun/android_background_ignore/raw/master/wechat_delay/background.png)

### 网络不稳定
使用数据网络时，关闭Wifi，以避免自动连上无效的公共WIfi（如酒店、麦当劳、机场提供的 Wifi）。推荐[修改网络验证服务器](https://github.com/Jiangyiqun/android_background_ignore/tree/master/captive_portal_server_changer)自动检查 WIfi 有效性。

### 时间同步（迷之方法）
设置 - 日期和时间 - 取消自动确定日期和时间，取消自动确定时区

![](https://github.com/Jiangyiqun/android_background_ignore/raw/master/wechat_delay/time.png)
