
import 'package:blackbeanbliss/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Bean Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.person, color: Colors.white),
            label: const Text('Logout', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              // Implementasi logout
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}