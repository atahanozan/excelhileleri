import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/helper/dialoghelper.dart';
import 'package:excel_hileleri_mobil/ui/helper/text_helper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class ChatWithTeacherPage extends StatefulWidget {
  const ChatWithTeacherPage({
    Key? key,
    required this.email,
    required this.uid,
    required this.name,
    required this.role,
  }) : super(key: key);

  final String name;
  final String email;
  final String uid;
  final String role;

  @override
  State<ChatWithTeacherPage> createState() => _ChatWithTeacherPageState();
}

class _ChatWithTeacherPageState extends State<ChatWithTeacherPage> {
  final TextEditingController _message = TextEditingController();

  String uid = "";
  String email = "";
  String name = "";
  String role = "";

  DateTime datetime = DateTime.now();

  void _sendMessage() async {
    if (_message.text.isNotEmpty) {
      await FirebaseFirestore.instance.collection("Chat").add({
        "uid": uid,
        "role": role,
        "datetime": datetime.toString(),
        "message": _message.text,
        "email": email,
        "name": name,
      });
      await FirebaseFirestore.instance.collection("MyChats").doc(uid).set({
        "uid": uid,
        "role": role,
        "datetime": datetime.toString(),
        "message": _message.text,
        "email": email,
        "name": name,
      });
      _message.clear();
    } else {
      DialogHelper().errDialog(
          context, "Lütfen bir kaç kelime ile isteklerinizi belirtiniz.");
    }
  }

  @override
  void initState() {
    setState(() {
      name = widget.name;
      uid = widget.uid;
      email = widget.email;
      role = widget.role;
    });

    super.initState();
  }

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightYellow,
      appBar: const CustomAppBar(title: 'Eğitmene Sor'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(
              TextUtilities.chatExplain,
              style: CustomTextStyle.subtitleText,
              textAlign: TextAlign.center,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Chat")
                    .where("email", isEqualTo: email)
                    .orderBy("datetime", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? const Text("")
                      : ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot chatMessages =
                                snapshot.data!.docs[index];

                            return chatMessages["role"] == "user"
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                      left: 100,
                                      right: 5,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        DialogHelper().choicesDialog(
                                            context,
                                            "Mesajı silmek istediğinize emin misiniz?",
                                            "Sil", () {
                                          FirebaseFirestore.instance
                                              .collection("Chat")
                                              .doc(chatMessages.id)
                                              .delete();
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                color: CustomColors.lightBlue,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                chatMessages["message"],
                                                style: CustomTextStyle.bodyText,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: CustomColors.darkRed,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              "Ben",
                                              style: CustomTextStyle
                                                  .subtitleText
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                      left: 5,
                                      right: 100,
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                              color: CustomColors.lightGreen,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              chatMessages["message"],
                                              style: CustomTextStyle.bodyText,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade700,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            "Eğitmen",
                                            style: CustomTextStyle.subtitleText
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                          },
                        );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextField(
                            style: CustomTextStyle.bodyText,
                            controller: _message,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: "Mesajınızı yazınız...",
                              labelStyle: CustomTextStyle.bodyText,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              _sendMessage();
                            },
                            child: FittedBox(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: CustomColors.darkRed,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
