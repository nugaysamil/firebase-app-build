import 'package:flutter/material.dart';
import 'package:newfirebase2_flutter/home/settings_form.dart';
import 'package:newfirebase2_flutter/services/auth.dart';
import 'package:newfirebase2_flutter/services/database.dart';
import 'package:provider/provider.dart';

import '../models/brew.dart';
import 'brew_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final AuthService _auth = AuthService();

    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 60,
              ),
              child: const SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew?>?>.value(
      value: DatabaseService().brews,
      initialData: List.empty(),
      child: Scaffold(
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
            ),
            TextButton(
              onPressed: () {
                _showSettingPanel();
              },
              child: const Text('Setting'),
            )
          ],
        ),
        body: const BrewList(),
      ),
    );
  }
}
