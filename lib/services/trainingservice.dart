import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class TrainingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getTrainingData() {
    var ref = _firestore.collection("BookTrainings").orderBy("no").snapshots();

    return ref;
  }

  Stream<QuerySnapshot> getTraininDataWithLevel(String level) {
    var ref = _firestore
        .collection("BookTrainings")
        .where("no", isEqualTo: level)
        .snapshots();

    return ref;
  }

  Future<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>>
      getTrainingInformations(Map<String, dynamic> info, String level) async {
    var ref = _firestore
        .collection("BookTrainings")
        .where("no", isEqualTo: level)
        .snapshots()
        .listen((data) {
      for (var docs in data.docs) {
        info.addAll({"title": docs["title"]});
      }
    });

    return ref;
  }
}
