import 'package:flutter/material.dart';
import 'login_page_manual_basic.dart'; 
import 'dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPageManualBasic(), // Ganti ke LoginPageManualBasic()
      routes: {
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}