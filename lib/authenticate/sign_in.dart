// ignore_for_file: no_leading_underscores_for_local_identifiers, dead_code

import 'package:flutter/material.dart';
import 'package:newfirebase2_flutter/services/auth.dart';
import 'package:newfirebase2_flutter/shared/loading.dart';

import '../shared/constant.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, required this.toggleView});

  final Function toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final _formKey = GlobalKey<FormState>();
    bool loading = false;

    String email = '';
    String password = '';
    String error = '';

    return loading ?  const Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Sign in to Brew Crew'),
        actions: [
          TextButton(
            onPressed: () {
              widget.toggleView();
            },
            child: const Text('Register'),
          ),
          const Icon(
            Icons.person,
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val!.isEmpty ? "Enter an email" : null,
                  onChanged: (val) {
                    // ignore: unused_element

                    email = val;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: false,
                  validator: (val) =>
                      val!.length < 6 ? "Enter a password 6+ chars long" : null,
                  onChanged: (val) {
                    // ignore: unused_element

                    password = val;
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });

                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);

                      if (result == null) {
                        setState(
                          () {
                            error = 'could not sign in with those credentials';
                            loading = false;
                          },
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  error,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
