import 'package:firebase_auth/firebase_auth.dart';
import 'package:newfirebase2_flutter/authenticate/autheenticate.dart';
import 'package:newfirebase2_flutter/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User?>(context);

    // ignore: unnecessary_null_comparison
    if (user == null) {
      
      return const Authenticate();
    } else {
      return const HomePage();
      
    }
  }
}
