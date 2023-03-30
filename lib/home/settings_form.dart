// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:newfirebase2_flutter/shared/constant.dart';

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
            decoration: textInputDecoration,
            validator: (val) => val!.isEmpty ? ' Please enter a name ' : null,
            onChanged: (val) {
              _currentName = val;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          DropdownButtonFormField<String>(
              decoration: textInputDecoration,
              value: _currentSugars ?? '0',
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text("$sugar sugars"),
                );
              }).toList(),
              onChanged: (val) => _currentSugars = val),
          Slider(
            activeColor: Colors.brown[_currentStrenght ?? 100],
            inactiveColor: Colors.brown[_currentStrenght ?? 100],
            value: (_currentStrenght!).toDouble(),
            onChanged: (val) {
              setState(() {
                _currentStrenght = val.round();
              });
            },
            min: 100,
            max: 900,
            divisions: 8,
          ),
          ElevatedButton(
            onPressed: () async {
              debugPrint(_currentName);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
