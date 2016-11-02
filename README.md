运行该批处理，可设置所有第三方APP的RUN_IN_BACKGROUND权限为ignore状态，能够大幅减少后台自动唤醒的情况，推荐与绿色守护配合使用

详情参见：https://zhuanlan.zhihu.com/p/23372646

RUN_IN_BACKGROUND介绍：

1、命令格式：
$ adb shell cmd appops set &lt;package_name&gt; RUN_IN_BACKGROUND ignore

2、列出所有第三方APP的package_name：
adb shell pm list packages -3

3、还原RUN_IN_BACKGROUND状态：
$ adb shell cmd appops set &lt;package_name&gt; RUN_IN_BACKGROUND allow

详情参考官方文档：https://developer.android.com/topic/performance/background-optimization.html

