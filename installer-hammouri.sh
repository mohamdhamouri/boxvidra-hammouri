#!/bin/bash

echo -e "\e[1;36m🚀 تثبيت hammouri-native...\e[0m"

INSTALL_DIR="$HOME/.boxvidra-hammouri"
mkdir -p $INSTALL_DIR/{scripts,apps,sounds,themes}

# نسخ الملفات من الجذر إلى مجلد التثبيت
cp boxvidra $INSTALL_DIR/scripts/ 2>/dev/null
cp *.desktop $INSTALL_DIR/apps/ 2>/dev/null
cp *.wav $INSTALL_DIR/sounds/ 2>/dev/null
cp *.jpg $INSTALL_DIR/themes/ 2>/dev/null
cp *.png $INSTALL_DIR/themes/ 2>/dev/null

# تفعيل alias للتشغيل العادي
echo 'alias hammouri-native="$HOME/.boxvidra-hammouri/scripts/boxvidra"' >> ~/.bashrc

# تفعيل alias لتشغيل الواجهة مع Termux:X11
echo 'alias hammouri-ui="termux-x11 :1 -xstartup '\''hammouri-native'\''"' >> ~/.bashrc

# تحديث البيئة
source ~/.bashrc

# تشغيل الصوت إن وُجد
[ -f "$INSTALL_DIR/sounds/Windows10_Startup.wav" ] && paplay "$INSTALL_DIR/sounds/Windows10_Startup.wav" &

echo -e "\n✅ تم التثبيت! شغّل الواجهة بـ: \e[1;32mhammouri-ui\e[0m أو الطرفية بـ: \e[1;32mhammouri-native\e[0m"
