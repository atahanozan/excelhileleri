import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfoData {
  static User? user() {
    return FirebaseAuth.instance.currentUser;
  }

  static String? uid() {
    return user()?.uid;
  }

  static String? email() {
    return user()?.email;
  }

  Stream<QuerySnapshot> usersnapshot() {
    var ref = FirebaseFirestore.instance
        .collection("Users")
        .where("email", isEqualTo: email())
        .snapshots();

    return ref;
  }

  Future<Map<String, dynamic>> userbilgileri() async {
    DocumentSnapshot users =
        await FirebaseFirestore.instance.collection("Users").doc(uid()).get();

    String name = await users["name"];
    String gender = await users["gender"];
    String birth = await users["birth"];
    String phone = await users["phone"];
    String statu = await users["statu"];
    int level = await users["level"];
    int coin = await users["coin"];
    int unit = await users["unit"];
    int page = await users["page"];
    int ccoin = await users["ccoin"];
    int ccorrectanswer = await users["ccorrectanswer"];
    int ctotalanswer = await users["ctotalanswer"];
    List<dynamic> points = await users["points"];

    Map<String, dynamic> user = {
      "name": name,
      "gender": gender,
      "birth": birth,
      "phone": phone,
      "statu": statu,
      "level": level,
      "coin": coin,
      "unit": unit,
      "page": page,
      "ccoin": ccoin,
      "ccorrectanswer": ccorrectanswer,
      "ctotalanswer": ctotalanswer,
      "points": points,
    };

    return user;
  }

  Future<void> updateInfo(String key, dynamic value) async {
    var ref =
        await FirebaseFirestore.instance.collection("Users").doc(uid()).update({
      key: value,
    });

    return ref;
  }

  Future<void> addPuzzleAnswer(String questionId, String answer) async {
    if (answer == "Doğru") {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection("Users").doc(uid()).get();

      Map<String, dynamic> answers = snapshot["answers"];
      int coin = snapshot["coin"];
      int ccoin = snapshot["ccoin"];
      int ccorrectanswer = snapshot["ccorrectanswer"];
      int ctotalanswer = snapshot["ctotalanswer"];

      answers.addAll({questionId: answer});
      coin += 5;
      ccoin += 5;
      ccorrectanswer += 1;
      ctotalanswer += 1;

      var ref = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid())
          .update({
        "answers": answers,
        "coin": coin,
        "ccoin": ccoin,
        "ccorrectanswer": ccorrectanswer,
        "ctotalanswer": ctotalanswer,
      });

      return ref;
    } else {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection("Users").doc(uid()).get();

      Map<String, dynamic> answers = snapshot["answers"];
      int ctotalanswer = snapshot["ctotalanswer"];

      answers.addAll({questionId: answer});
      ctotalanswer += 1;

      var ref = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid())
          .update({
        "answers": answers,
        "ctotalanswer": ctotalanswer,
      });

      return ref;
    }
  }
}
