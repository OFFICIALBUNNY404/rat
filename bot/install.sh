#!/bin/bash

echo "[*] Mengupdate paket..."
pkg update -y && pkg upgrade -y

echo "[*] Menginstal dependensi..."
pkg install nodejs openjdk-17 wget zip unzip git nano -y
npm install node-telegram-bot-api

echo "[*] Menginstal apktool & zipalign..."
wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O /data/data/com.termux/files/usr/bin/apktool
wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.9.3.jar -O /data/data/com.termux/files/usr/bin/apktool.jar
chmod +x /data/data/com.termux/files/usr/bin/apktool
chmod +x /data/data/com.termux/files/usr/bin/apktool.jar

echo "[✓] Semua modul berhasil diinstall."