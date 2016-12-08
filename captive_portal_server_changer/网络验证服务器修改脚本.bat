adb.exe shell settings put global captive_portal_use_https 1
adb.exe shell settings put global captive_portal_server www.google.cn
adb.exe shell settings put global captive_portal_http_url http://www.google.cn/generate_204
adb.exe shell settings put global captive_portal_https_url https://www.google.cn/generate_204
pause