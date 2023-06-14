import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseMessagingHelper {
  late final FirebaseMessaging messaging;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> notificationSetting() async {
    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
  }

  Future<void> connectNotification(BuildContext context, String uid) async {
    await Firebase.initializeApp();

    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );
    notificationSetting();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("${event.notification?.title}"),
                content: Text("${event.notification?.body}"),
              ));
      _firestore.collection("Notifications").add({
        "uid": uid,
        "title": event.notification?.title,
        "body": event.notification?.body,
      });
    });

    messaging.getToken().then((value) => debugPrint("Token: $value"));
  }

  static Future<void> backgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
