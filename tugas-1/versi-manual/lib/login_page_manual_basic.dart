import 'package:flutter/material.dart';

class LoginPageManualBasic extends StatefulWidget {
  const LoginPageManualBasic({super.key});

  @override
  State<LoginPageManualBasic> createState() => _LoginPageManualBasicState();
}

class _LoginPageManualBasicState extends State<LoginPageManualBasic> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      // Simulasi delay login
      Future.delayed(const Duration(milliseconds: 500), () {
        if (email == 'ilhamakbarjamil@gmai.com' && password == 'password123') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Berhasil!')),
          );
          Navigator.pushReplacementNamed(context, '/dashboard');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email atau Password salah.')),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Media Query tetap digunakan untuk padding dasar,
    // tapi tidak untuk penskalaan elemen yang kompleks.
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(screenWidth * 0.05), // Padding dasar responsif
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 350, // Batasi lebar maksimum agar tidak terlalu lebar di layar besar
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch, // Agar elemen mengisi lebar
                children: [
                  // Logo (sangat dasar, tanpa penskalaan tinggi yang kompleks)
                 
                  const SizedBox(height: 24), // Spasi tetap
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Masukkan email Anda',
                      border: OutlineInputBorder(), // Border standar
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Masukkan password Anda',
                      border: OutlineInputBorder(), // Border standar
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton( // Tombol standar
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('LOGIN'),
                  ),
                  const SizedBox(height: 12),
                  TextButton( // Tombol teks standar
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Lupa password? Fitur belum tersedia.')),
                      );
                    },
                    child: const Text('Lupa Password?'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}