在非ROOT的Android 7.0上，为减少卡顿，增加续航，可以：
1、使用绿色守护，自动杀灭指定后台进程
2、运行该批处理，限制APP后台自动唤醒
同时使用以上两条方法，可达到较好效果。
具体参见：https://zhuanlan.zhihu.com/p/23372646

运行该批处理，可设置所有第三方APP的RUN_IN_BACKGROUND权限为ignore状态

RUN_IN_BACKGROUND介绍：
一、命令格式
$ adb shell cmd appops set &lt;package_name&gt; RUN_IN_BACKGROUND ignore
例如，要限制手机百度及支付宝，输入如下命令：
om.baidu.searchbox RUN_IN_BACKGROUND ignore
adb shell cmd appops set com.eg.android.AlipayGphone RUN_IN_BACKGROUND ignore

二、查看APP的package_name
方法A（推荐）：
手机信息大全:Android System Info(com.electricsheep.asi)_1.26.2_Android应用
方法B：
输入以下命令，列出所有第三方APP的包名，拷贝即可
adb shell 'pm list packages -3'

三、还原RUN_IN_BACKGROUND状态
$ adb shell cmd appops set &lt;package_name&gt; RUN_IN_BACKGROUND allow

RUN_IN_BACKGROUND效果：
理论效果：
当把一个应用的RUN_IN_BACKGROUND设为ignore之后：

1，应用在AndroidManifest.xml注册的用于接收隐式广播的receiver都会失效，换个方向就是说隐式广播无法启动这个应用了
2，应用不能启动Service(不包括通过bindService绑定的Service)。现有的后台Service(不包括前台Service)在一分钟后会被系统杀掉。
3，应用注册的alarm/job/sync全部没有了，也不能再注册了
详情参考官方文档：https://developer.android.com/topic/performance/background-optimization.html

实测效果：
美团系：
可以阻止美团、大众点评、猫眼之间的互相唤醒。
不能阻止大众点评自动唤醒（JobService），但唤醒频率很低。
阿里系：
可以大幅减少阿里系后台唤醒：
不能阻止支付宝唤醒高德地图（AMapService)； 
不能阻止飞猪唤醒支付宝 (Authenticated)；
百度系：
不能阻止百度系（ShareService）相互唤醒；
不能阻止Uber被百度系唤醒（RegistrationReceiver)；
其它：
不能阻止Bilibili自动唤醒（JobService），但唤醒频率很低。
对豆瓣、网易等APP效果明显；
总结：
该方法可阻止大多数后台唤醒。