import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {

  static FirebaseService instance = FirebaseService._internal();

  factory FirebaseService(){    
    return instance;
  }

  FirebaseService._internal()
  {
    print("FirebaseService()");
    _getList().listen((value){
      _listSink.add(value);
    });
  }

  static StreamController<QuerySnapshot> listController = StreamController<QuerySnapshot>();

  Stream<QuerySnapshot> get listStream => listController.stream;
  static StreamSink<QuerySnapshot> get _listSink => listController.sink;

  static Stream<QuerySnapshot> _getList()
  {
    return Firestore.instance.collection("forum").snapshots();
  }  

  dispose()
  {
    listController.close();
  }
}