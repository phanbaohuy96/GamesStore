import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {

  static FirebaseService instance = FirebaseService._internal();

  factory FirebaseService(){    
    return instance;
  }

  FirebaseService._internal();
  Stream<QuerySnapshot> getList(String type) => Firestore.instance.collection("forum").snapshots();
}