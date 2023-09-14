import 'package:flutter/material.dart';
import 'login.dart'; 

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
              'Join Guide Me',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), 
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  
                ),
              ),
            ),
            const SizedBox(height: 20), 
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  
                ),
              ),
            ),
            const SizedBox(height: 20), 
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
            const SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('Sign Up'),
              
            ),
            const SizedBox(height: 20), 
            TextButton(
              onPressed: () {
                
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Text('Already have an account? Login'), 
              
            ),
          ],
        ),
      ),
    );
  }
}
