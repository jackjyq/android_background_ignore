# 名称 android_background_ignore (linux version)
# 作者 Jack Jiang
# 版本 V0.1
# 项目地址 https://github.com/Jiangyiqun/android_background_ignore


# 运行环境检测
echo
echo "本程序可限制第三方APP的自动唤醒，系统必须是 Android 7.0 +，需要开启USB调试。"
while :
do
    echo
    if adb devices | grep -q device$
    then
        break
    else
        echo "出错了！详情如下："
        adb devices
        echo "请确保手机开启 USB 调试"
        echo
        read -rsp $'按任意键继续'
    fi
done



# 初次使用生成白名单
if [ -f white_list.txt ]
then 
    :
else
    echo "# 这是一份白名单，及其自身的撰写说明" > white_list.txt
    echo "# 收录在此的应用，后台行为不会被限制 " >> white_list.txt
    echo "# " >> white_list.txt
    echo "# 撰写说明： " >> white_list.txt
    echo "# 一、依赖推送的应用，酌情添加至白名单 " >> white_list.txt
    echo "# 原因：被限制后台的应用，长时间不用后台服务会被关掉，无法接收推送 " >> white_list.txt
    echo "# 影响：即时通讯工具，如微信(无论是否使用GCM)；定时提醒工具，如滴答清单 " >> white_list.txt
    echo "# 建议：只添加依赖其推送的应用，不添加手动查看消息的应用 " >> white_list.txt
    echo "# " >> white_list.txt
    echo "# 二、依赖广播的应用，必须添加至白名单 " >> white_list.txt
    echo "# 原因：被限制后台的应用，无法接受系统广播，即无法随特定事件启动 " >> white_list.txt
    echo "# 影响：第三方来电提醒，短信验证码自动拾取，悬浮按钮，剪切板增强，手势增强 " >> white_list.txt
    echo "# 建议：通常应当添加至白名单 " >> white_list.txt
    echo "# " >> white_list.txt
    echo "# 三、以下应用，无需添加至白名单 " >> white_list.txt
    echo "# 系统内置应用，输入法，启动器（Launcher），由辅助功能启动的应用（如绿色守护） " >> white_list.txt
    echo "# " >> white_list.txt
    echo "# 请参考以上说明，删除多余的行，仅保留需要添加至白名单的应用 " >> white_list.txt
    echo "# " >> white_list.txt
    echo "# 白名单: " >> white_list.txt
    adb shell pm list packages -3 | cut -d':' -f2 >> white_list.txt
    echo >> white_list.txt
    echo "# 请保存文件，关闭文本编辑器以继续..." >> white_list.txt
    echo "请阅读并编辑 white_list.txt 文件"
    gedit white_list.txt
fi



# 用户菜单
echo
echo "功能菜单："
echo "1、限制自动唤醒"
echo "2、恢复默认模式"
while : 
do
    echo -n "请选择: "
    read choice
    case $choice in
        1)  # 限制自动唤醒
            echo
            echo "正在限制自动唤醒："
            adb shell pm list packages -3 | cut -d':' -f2 > apps_list.txt
            while read line
            do
                echo "正在限制 $line 的自动唤醒"
                adb shell cmd appops set $line RUN_IN_BACKGROUND ignore
            done < apps_list.txt
            rm -f apps_list.txt

            echo
            echo "正在处理白名单："
            while read line
            do
                if echo $line | grep -q ^[0-9A-Za-z]
                then
                    echo "正在恢复 $line 为默认模式"
                    adb shell cmd appops set $line RUN_IN_BACKGROUND allow
                fi
            done < white_list.txt
            break
            ;;

        2) # 恢复默认模式
            echo
            echo "正在恢复默认模式："
            adb shell pm list packages -3 | cut -d':' -f2 > apps_list.txt
            while read line
            do
                echo "正在恢复 $line 为默认模式"
                adb shell cmd appops set $line RUN_IN_BACKGROUND allow
            done < apps_list.txt
            rm -f apps_list.txt
            break
            ;;

        *)
            echo "错误输入，请重试"
            ;;
    esac
done



# 结束，提醒关闭USB调试
echo
echo "已经完成，请关闭USB调试后，按 Enter 退出"
read -rsp $'按 Enter 键继续'
while :
do
    echo
    if adb devices | grep -q device$
    then
        echo
        echo "USB调试未关闭！"
        read -rsp $"请关闭USB调试后，按 Enter  退出"
    else
        break
    fi
done