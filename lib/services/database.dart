// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/brew.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brew');

  Future updateUserData(String sugars, String name, int strenght) async {
    return await brewCollection.doc(uid).set(
      {
        'sugars': sugars,
        'name': name,
        'strenght': strenght,
      },
    );
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return Brew(
          name: doc.get("name") ?? "",
          sugars: doc.get("sugars") ?? "0",
          strenght: doc.get("strength") ?? 0,
        );
      }).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
    
  }
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);
  }
  
}
