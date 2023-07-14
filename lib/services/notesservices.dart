import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/helper/userinfohelper.dart';

class NotesServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> allNotes(String? uid) {
    var ref = _firestore
        .collection("Users")
        .doc(uid)
        .collection("MyNotes")
        .orderBy("time", descending: true)
        .snapshots();
    return ref;
  }

  Stream<QuerySnapshot> classNotes(String className) {
    var ref = _firestore
        .collection("Users")
        .doc(UserInfoData.uid())
        .collection("MyNotes")
        .where("classname", isEqualTo: className)
        .orderBy("time", descending: true)
        .snapshots();
    return ref;
  }

  Future<DocumentReference<Map<String, dynamic>>> addNotes(
      String className, String note) async {
    var ref = await _firestore
        .collection("Users")
        .doc(UserInfoData.uid())
        .collection("MyNotes")
        .add({
      "classname": className,
      "note": note,
      "time": DateTime.now().toString(),
    });

    return ref;
  }
}
