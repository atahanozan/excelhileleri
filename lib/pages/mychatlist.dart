import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/pages/home/chatwithteacher.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class MyChatList extends StatefulWidget {
  const MyChatList({super.key});

  @override
  State<MyChatList> createState() => _MyChatListState();
}

class _MyChatListState extends State<MyChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Sohbet Listesi"),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("MyChats")
            .orderBy("datetime", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const Text("Yükleniyor")
              : ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot myChats = snapshot.data!.docs[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ChatWithTeacherPage(
                                      email: myChats["email"],
                                      uid: myChats["uid"],
                                      name: myChats["name"],
                                      role: 'teacher',
                                    ))),
                        child: ListTile(
                          tileColor: Colors.blue,
                          title: Text(myChats["name"]),
                          subtitle: Text(myChats["email"]),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
