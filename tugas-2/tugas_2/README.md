# 🎬 Movie Theater App UI (Flutter)

Aplikasi mobile berbasis Flutter yang mengimplementasikan desain UI untuk proses Login, Sign-up, dan halaman pemilihan Teater dengan integrasi geolokasi untuk mendeteksi lokasi pengguna.

## ✨ Fitur Utama

* **Authentication UI:** Desain halaman Login dan Sign-up yang sesuai dengan *mockup* visual.
* **Social Login:** Tombol khusus untuk Login via Google dan Facebook (memerlukan *asset* gambar kustom).
* **Theater Selection Screen:** Halaman daftar bioskop dengan *collapsible list* (menggunakan \`ExpansionTile\`).
* **Geolocation Integration:** Penggunaan paket \`geolocator\` dan \`geocoding\` untuk mendeteksi dan menampilkan nama kota pengguna (misalnya, MEDAN) secara otomatis.

---

## 🚀 Instalasi dan Menjalankan Proyek

### 1. Prasyarat

Pastikan Anda telah menginstal:
* [Flutter SDK](https://flutter.dev/docs/get-started/install)
* Editor Kode (VS Code atau Android Studio)

### 2. Kloning Repositori

\`\`\`bash
git clone [GANTI DENGAN LINK REPO ANDA]
cd your-project-name
\`\`\`

### 3. Mengunduh Dependensi

Aplikasi ini menggunakan \`geolocator\` dan \`geocoding\`. Unduh paket yang diperlukan:

\`\`\`bash
flutter pub get
\`\`\`

### 4. Penyiapan Assets (Penting!)

Aplikasi ini menggunakan gambar latar belakang dan logo sosial media.
1.  Buat folder \`assets/\` di root proyek.
2.  Tambahkan gambar latar belakang (\`background.jpg\`) ke folder \`assets/\`.
3.  Tambahkan logo Google (\`google_logo.png\`) dan Facebook (\`facebook_logo.png\`) ke folder \`assets/\`.

Pastikan \`pubspec.yaml\` sudah dideklarasikan:
\`\`\`yaml
flutter:
  assets:
    - assets/
\`\`\`

### 5. Konfigurasi Izin Lokasi (Penting!)

Agar \`geolocator\` berfungsi:

#### 📱 Android
Tambahkan izin di \`android/app/src/main/AndroidManifest.xml\` (di dalam tag \`<manifest>\`):
\`\`\`xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
\`\`\`

#### 🍎 iOS
Tambahkan deskripsi penggunaan di \`ios/Runner/Info.plist\`:
\`\`\`xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Aplikasi memerlukan akses lokasi untuk menemukan bioskop terdekat di kota Anda.</string>
\`\`\`

### 6. Jalankan Aplikasi

Jalankan aplikasi pada perangkat atau emulator yang terhubung:

\`\`\`bash
flutter run
\`\`\`

---

## 🛠️ Struktur File Proyek

Proyek ini disusun berdasarkan fitur utama:

\`\`\`
lib/
├── main.dart             # Titik masuk aplikasi
├── login_screen.dart     # Halaman Login
├── signup_screen.dart    # Halaman Sign-up
└── theater_screen.dart   # Halaman Pemilihan Teater & Geolocation
\`\`\`

---

## 🤝 Kontributor

Ilham Akbar Jamil (202310370311085)