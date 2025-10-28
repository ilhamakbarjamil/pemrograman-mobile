import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class TheaterScreen extends StatefulWidget {
  const TheaterScreen({super.key});

  @override
  State<TheaterScreen> createState() => _TheaterScreenState();
}

class _TheaterScreenState extends State<TheaterScreen> {
  String _currentLocation = 'Mencari Lokasi...';

  @override
  void initState() {
    super.initState();
    _getDeviceLocation();
  }

  // 1. Fungsi untuk mendapatkan lokasi dan nama kota
  Future<void> _getDeviceLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Cek apakah layanan lokasi aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _currentLocation = 'Layanan lokasi dinonaktifkan');
      return;
    }

    // Cek status izin
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        setState(() => _currentLocation = 'Izin lokasi ditolak');
        return;
      }
    }

    try {
      // Ambil posisi saat ini
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      
      // Reverse Geocoding: Ubah koordinat menjadi alamat
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        // Ambil nama kota atau sub-lokalitas
        String city = placemarks.first.subAdministrativeArea ?? placemarks.first.locality ?? 'Lokasi Tidak Diketahui';
        setState(() => _currentLocation = city.toUpperCase());
      } else {
        setState(() => _currentLocation = 'Gagal menemukan nama kota');
      }

    } catch (e) {
      setState(() => _currentLocation = 'Error: ${e.toString()}');
    }
  }

  // Komponen daftar bioskop dengan ExpansionTile
  Widget _buildTheaterItem(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ExpansionTile(
          title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          children: <Widget>[
            // Contoh isi ExpansionTile
            ListTile(
              title: const Text('Lihat Jadwal', style: TextStyle(color: Colors.white70)),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Detail Informasi', style: TextStyle(color: Colors.white70)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1B2F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Kembali ke layar sebelumnya
          },
        ),
        title: const Text('THEATER', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Bagian Lokasi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Color(0xFF8C7AE6)),
                const SizedBox(width: 8),
                Text(
                  _currentLocation,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF8C7AE6)),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white24, height: 1),

          // Daftar Bioskop
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildTheaterItem('XI CINEMA'),
                _buildTheaterItem('PONDOK KELAPA 21'),
                _buildTheaterItem('CGV'),
                _buildTheaterItem('CINEPOLIS'),
                _buildTheaterItem('CP MALL'),
                _buildTheaterItem('HERMES'),
                _buildTheaterItem('Cinema Lainnya'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}