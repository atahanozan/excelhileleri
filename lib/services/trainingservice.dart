import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class TrainingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getTrainingData(int no) {
    var ref = _firestore
        .collection("BookTrainings")
        .where("no", isEqualTo: no)
        .orderBy("no")
        .snapshots();

    return ref;
  }

  Stream<QuerySnapshot> getBookList() {
    var ref = _firestore.collection("BookTrainings").snapshots();

    return ref;
  }

  Future<int> bookLenght() async {
    QuerySnapshot books =
        await FirebaseFirestore.instance.collection("BookTrainings").get();

    int lenght = books.docs.length;

    return lenght;
  }

  Future<Map<String, dynamic>> bookInfo(int unit) async {
    DocumentSnapshot books = await FirebaseFirestore.instance
        .collection("BookTrainings")
        .doc("booktraining_book$unit")
        .get();

    String name = books["name"];
    String desc = books["desc"];
    int no = books["no"];

    Map<String, dynamic> bookinfo = {
      "name": name,
      "desc": desc,
      "no": no,
    };

    return bookinfo;
  }
}
