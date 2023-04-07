import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserId {
  final String? uid;

  UserId({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({
    required this.uid,
    required this.name,
    required this.sugars,
    required this.strength,
  });

  factory UserData.fromDocument(DocumentSnapshot doc) {
    return UserData(
      uid: doc.id, // this is what i do
      name: doc['name'], // this is what i do
      sugars: doc['sugars'], // this is what i do
      strength: doc['strength'], // this is what i do
    );
  }
}
