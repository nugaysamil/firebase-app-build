// ignore_for_file: dead_code, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../services/auth.dart';
import '../shared/constant.dart';
import '../shared/loading.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.toggleView});

  final Function toggleView;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    final _formKey = GlobalKey<FormState>();
    bool loading = false;

    String email = '';
    String password = '';
    String error = '';

    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: const Text('Sign Up to Brew Crew'),
              actions: [
                TextButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: const Text('Sign In'),
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
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) =>
                          val!.isEmpty ? "Enter an email" : null,
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
                      validator: (val) => val!.length < 6
                          ? "Enter a password 6+ chars long"
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        // ignore: unused_element

                        password = val;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // ignore: unused_local_variable
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);

                          setState(() {
                            loading = true;
                          });
                          if (result == null) {
                            setState(
                              () {
                                error = 'please supply a valid email';
                                loading = false;
                              },
                            );
                          }
                        }
                      },
                      child: const Text(
                        'Register in',
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
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
