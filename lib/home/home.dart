import 'package:flutter/material.dart';
import 'package:newfirebase2_flutter/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final AuthService _auth = AuthService();

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Brew'),
        backgroundColor: Colors.black26,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: const Text('logout'),
          )
        ],
      ),
    );
  }
}
