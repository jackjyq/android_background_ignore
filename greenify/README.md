绿色守护可在非Root模式下工作，能够在锁屏后自动关闭指定的APP。

## 使用步骤
1. 根据绿色守护提示，进行初始设置
2. 点击右上角加号，打开应用排查顾问
3. 选择指定的APP (将会在锁屏后自动关闭)

## 使用建议
绿化太多 APP 会导致锁屏时间长，并增加 APP 启动时间，这反而会增加系统资源消耗，建议只绿化在后台持续运行的 APP。

此外，许多 APP 虽然会在后台运行，但是锁屏一段时间后（小于1分钟，有时只有几秒种）就会退出，并不消耗系统资源。因此可先锁屏一段时间，再用应用排查顾问查看，只绿化那些仍然运行的APP。

## 补充说明
### 下载地址
- [酷安网](http://www.coolapk.com/apk/com.oasisfeng.greenify)（推荐）
- [本地](https://github.com/Jiangyiqun/android_background_ignore/raw/master/greenify/Greenify.apk)（可使用[应用批量安装脚本](https://github.com/Jiangyiqun/android_background_ignore/tree/master/adb_install_apks)安装）

### 授权脚本:
[该脚本](https://raw.githubusercontent.com/Jiangyiqun/android_background_ignore/master/greenify/Greenify%E6%8E%88%E6%9D%83.bat)（无需Root）用于激活 **嗜睡模式** 与 **唤醒跟踪** 功能。方法来自于[官方网页](https://greenify.uservoice.com/knowledgebase/articles/749142-how-to-grant-permissions-required-by-some-features)。不执行不影响基本功能。
