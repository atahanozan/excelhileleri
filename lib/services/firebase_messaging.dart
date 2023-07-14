import 'dart:convert';

import 'package:excel_hileleri_mobil/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessages(RemoteMessage message) async {
  final notification = message.notification;
  if (notification != null) return;
  print(message.notification?.title);
}

class FirebaseMessagingHelper {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    "high_importance_channel",
    "High Importance Channel",
    description: "This channel is use for high importance notifications",
    importance: Importance.defaultImportance,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatoKey.currentState?.pushNamed(
      "/notification",
      arguments: message,
    );
  }

  Future initLocalNotifications() async {
    const iOs = DarwinInitializationSettings();
    const android = AndroidInitializationSettings("@drawable/ic_launcher");
    const settings = InitializationSettings(android: android, iOS: iOs);

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) {
        final message =
            RemoteMessage.fromMap(jsonDecode(payload.payload.toString()));
        handleMessage(message);
      },
      onDidReceiveBackgroundNotificationResponse: (payload) {
        final message =
            RemoteMessage.fromMap(jsonDecode(payload.payload.toString()));
        handleMessage(message);
      },
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessages);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: "@drawable/ic_launcher",
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future<void> initNotifications() async {
    await messaging.requestPermission();
    final fcmtoken = await messaging.getToken();
    initPushNotification();
    initLocalNotifications();
  }
}
