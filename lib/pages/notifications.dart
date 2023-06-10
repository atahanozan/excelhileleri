import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/adsappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String? uid;
  @override
  void initState() {
    setState(() {
      user = _auth.currentUser;
      uid = user?.uid;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdsAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Bildirimler",
                  style: CustomTextStyle.largeHeader,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Notifications")
                      .where("uid", isEqualTo: uid.toString())
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Text(
                            "Yükleniyor...",
                            style: CustomTextStyle.smallHeader,
                          )
                        : ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot notifications =
                                  snapshot.data!.docs[index];
                              String title = notifications["title"];
                              String body = notifications["body"];

                              return ListTile(
                                title: Text(title),
                                subtitle: Text(body),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete_rounded),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection("Notifications")
                                        .doc(notifications.id)
                                        .delete();
                                  },
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                tileColor: CustomColors.lightGreen,
                              );
                            },
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
