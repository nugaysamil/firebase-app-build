// ignore_for_file: unused_element, avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase2_flutter/models/user.dart';
import 'package:newfirebase2_flutter/services/database.dart';
import 'package:newfirebase2_flutter/shared/constant.dart';
import 'package:newfirebase2_flutter/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

final _formKey = GlobalKey<FormState>();
final List<String> sugars = ['0', '1', '2', '3', '4'];

String? _currentName;
String? _currentSugars;
int? _currentStrenght = 100;

class _SettingsFormState extends State<SettingsForm> {
  @override
  Widget build(BuildContext context) {
 
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData?>(
      stream: DatabaseService().asdStream(user.uid),
      builder: (BuildContext context, AsyncSnapshot<UserData?> snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data!;
          return Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Update your brew settings',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textInputDecoration,
                  validator: (val) =>
                      val!.isEmpty ? ' Please enter a name ' : null,
                  onChanged: (val) {
                    _currentName = val;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                 DropdownButtonFormField<String>(
                    decoration: textInputDecoration,
                    value: _currentSugars ?? userData.sugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text("$sugar sugars"),
                      );
                    }).toList(),
                    onChanged: (val) => _currentSugars = val),
                Slider(
                  activeColor:
                      Colors.brown[_currentStrenght ?? snapshot.data!.strength],
                  inactiveColor:
                      Colors.brown[_currentStrenght ?? snapshot.data!.strength],
                  value:
                      (_currentStrenght ?? snapshot.data!.strength).toDouble(),
                  onChanged: (val) {
                    setState(
                      () {
                        _currentStrenght = val.round();
                      },
                    );
                  },
                  min: 100,
                  max: 900,
                  divisions: 8,
                ), 
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      DatabaseService(uid: user.uid).updateUserData(
                          _currentSugars ?? userData.sugars,
                          _currentName ?? userData.name,
                          _currentStrenght ?? userData.strength);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          );
        }
        if (snapshot.hasError) {
          return const Text('hata');
        }
        return const Loading();
      },
    );
  }
}
