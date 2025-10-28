import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import jika ingin kembali ke login

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  Widget _buildBackground() {
    // Reusing the background component logic from LoginScreen
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'), // Ganti dengan path gambar Anda
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.6),
      ),
    );
  }

  Widget _buildTextField({required String hint, required IconData icon, bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 120),
                const Text(
                  'Sign-up',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const Text(
                  "Let's get started",
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
                const SizedBox(height: 40),

                // Input Fields
                _buildTextField(hint: 'Your Full Name', icon: Icons.person),
                _buildTextField(hint: 'Email', icon: Icons.email),
                _buildTextField(hint: 'Password', icon: Icons.lock, isPassword: true),
                _buildTextField(hint: 'Confirm Password', icon: Icons.lock_open, isPassword: true),
                const SizedBox(height: 24),

                // Register Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B5998),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Register', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                const SizedBox(height: 40),

                // Already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(color: Colors.white.withOpacity(0.7))),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Kembali ke Layar Login
                      },
                      child: const Text('Register here', style: TextStyle(color: Color(0xFF8C7AE6), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}