import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/helper/userinfohelper.dart';

class NotificationServices {
  Stream<QuerySnapshot> notifications() {
    var ref = FirebaseFirestore.instance
        .collection("Notifications")
        .where("uid", isEqualTo: UserInfoData.uid())
        .snapshots();

    return ref;
  }
}
