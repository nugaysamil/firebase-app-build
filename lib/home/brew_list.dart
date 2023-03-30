// ignore_for_file: unused_local_variable, unnecessary_null_comparison, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:flutter/material.dart';
import 'package:newfirebase2_flutter/home/brew_tile.dart';
import 'package:provider/provider.dart';
import 'package:newfirebase2_flutter/models/brew.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context) ?? [];
    print(brews.length);

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
