#!/bin/bash

echo -e "\e[1;36m🔧 تثبيت واجهة boxvidra-hammouri...\e[0m"

# مسارات المشروع
INSTALL_DIR="$HOME/.boxvidra-hammouri"

# إنشاء المجلدات
mkdir -p $INSTALL_DIR/{scripts,apps,sounds,themes,config/startmenu}

# نسخ الملفات من المشروع
cp -r scripts/* $INSTALL_DIR/scripts/
cp -r Programs/* $INSTALL_DIR/apps/ 2>/dev/null || echo "⚠️ لا يوجد مجلد Programs"
cp -r sounds/* $INSTALL_DIR/sounds/ 2>/dev/null
cp -r themes/* $INSTALL_DIR/themes/ 2>/dev/null

# إعداد alias للتشغيل السريع
if ! grep -q "mobox-native" ~/.bashrc; then
  echo 'alias mobox-native="$HOME/.boxvidra-hammouri/scripts/boxvidra"' >> ~/.bashrc
  source ~/.bashrc
fi

# تشغيل صوت الإقلاع إن وجد
if [ -f "$INSTALL_DIR/sounds/Windows10_Startup.wav" ]; then
  paplay "$INSTALL_DIR/sounds/Windows10_Startup.wav" &
fi

echo -e "\n✅ تم تثبيت boxvidra-hammouri بنجاح!"
echo -e "✨ شغّله باستخدام الأمر: \e[1;32mmobox-native\e[0m"
echo 'alias hammouri-native="$HOME/.boxvidra-hammouri/scripts/boxvidra"' >> ~/.bashrc && source ~/.bashrc
echo 'alias hammouri-ui="termux-x11 :1 -xstartup '\''hammouri-native'\''"' >> ~/.bashrc && source ~/.bashrc
