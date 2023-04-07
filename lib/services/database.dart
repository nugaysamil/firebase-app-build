// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase2_flutter/models/user.dart';
import '../models/brew.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brew');

  Future updateUserData(String sugars, String name, int strenght) async {
    return await brewCollection.doc(uid).set(
      {
        'name': name,
        'strength': strenght,
        'sugars': sugars,
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

  UserData? _userdataFromSnapshots(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>; // this is what i do

    return UserData(
      uid: data['uid'], // this is what i do
      name: data['name'], // this is what i do
      sugars: data['sugars'], // this is what i do
      strength: data['strength'], // this is what i do
    );
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData?> get userData {
    return brewCollection.doc(uid).snapshots().map(_userdataFromSnapshots);
  }

  Stream<UserData> asdStream(String uidd) {
    return brewCollection.doc(uidd).snapshots().map((event) => UserData.fromDocument(event));
  }

  
}
