import 'package:flutter/material.dart';
import 'login.dart'; // Import file login.dart

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Tambahkan logo atau gambar header di sini jika diperlukan

            const Text(
              'Join Guide Me',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Spacer
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  // Ubah warna border dan hint text jika diperlukan
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacer
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  // Ubah warna border dan hint text jika diperlukan
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacer
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  // Ubah warna border dan hint text jika diperlukan
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacer
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika pendaftaran di sini
              },
              child: const Text('Sign Up'),
              // Sesuaikan gaya tombol sesuai tema Anda
            ),
            const SizedBox(height: 20), // Spacer
            TextButton(
              onPressed: () {
                // Navigasi ke halaman login.dart saat tombol "Already have an account? Login" ditekan
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Text('Already have an account? Login'), // Ubah teks sesuai tema Anda
              // Sesuaikan gaya tombol sesuai tema Anda
            ),
          ],
        ),
      ),
    );
  }
}
