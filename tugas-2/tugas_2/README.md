Aplikasi mobile berbasis **Flutter** yang mengimplementasikan desain antarmuka (UI) untuk proses **Login**, **Sign-up**, dan **halaman pemilihan Teater** dengan integrasi **Geolokasi** untuk mendeteksi lokasi pengguna secara otomatis.
## ✨ Fitur Utama
- **Authentication UI:** Desain halaman Login dan Sign-up sesuai dengan *mockup* visual.
- **Social Login:** Tombol khusus untuk Login via Google dan Facebook (menggunakan *custom assets*).
- **Theater Selection Screen:** Halaman daftar bioskop dengan tampilan *collapsible list* menggunakan \`ExpansionTile\`.
- **Geolocation Integration:** Menggunakan paket \`geolocator\` dan \`geocoding\` untuk mendeteksi serta menampilkan nama kota pengguna (contoh: *Medan*).
## 🚀 Instalasi dan Menjalankan Proyek
### 1️⃣ Prasyarat
Pastikan Anda telah menginstal:
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Editor kode seperti **VS Code** atau **Android Studio**
### 2️⃣ Kloning Repositori
```bash
git clone https://github.com/ilhamakbarjamil/pemrograman-mobile.git
cd pemrograman-mobile/tugas-1
```
### 3️⃣ Mengunduh Dependensi
```bash
flutter pub get
```
### 4️⃣ Penyiapan Assets (Penting!)
Aplikasi menggunakan gambar latar belakang serta logo sosial media.
1. Buat folder assets/ di root proyek.
2. Tambahkan file berikut:
   - assets/background.jpg
   - assets/google_logo.png
   - assets/facebook_logo.png
3. Pastikan pubspec.yaml sudah menyertakan deklarasi assets.
### 5️⃣ Konfigurasi Izin Lokasi (Wajib!)
#### 📱 Android
Tambahkan izin berikut di android/app/src/main/AndroidManifest.xml:
```bash
<uses-permission android:name=\"android.permission.ACCESS_FINE_LOCATION\" />
<uses-permission android:name=\"android.permission.ACCESS_COARSE_LOCATION\" />
```
#### 🍎 iOS
Tambahkan deskripsi penggunaan lokasi di ios/Runner/Info.plist:
```bash
<key>NSLocationWhenInUseUsageDescription</key>
<string>Aplikasi memerlukan akses lokasi untuk menemukan bioskop terdekat di kota Anda.</string>
```
### 6️⃣ Menjalankan Aplikasi
```bash
flutter run
```
## 🧩 Struktur Direktori
lib/
├── main.dart
├── login_screen.dart
├── signup_screen.dart
└── theater_screen.dart
## 📸 Lampiran (Screenshots)
![Login Screen](assets/screenshots/login.png)
![Sign-up Screen](assets/screenshots/signup.png)
![Theater Screen](assets/screenshots/theater.png)
## 👨‍💻 Kontributor
Ilham Akbar Jamil (202310370311085)
## 🪪 Lisensi
Proyek ini dibuat untuk keperluan pembelajaran dan pengembangan aplikasi mobile berbasis Flutter. Silakan digunakan, dimodifikasi, atau dikembangkan lebih lanjut sesuai kebutuhan." > README.md