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
            const Text(
              'Welcome to the Sign Up Page',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20), // Spacer
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
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
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacer
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika pendaftaran di sini
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20), // Spacer
            TextButton(
              onPressed: () {
                // Navigasi ke halaman login.dart saat tombol "Sudah punya akun? Login" ditekan
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Text('Sudah punya akun? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
