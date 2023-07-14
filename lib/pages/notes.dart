import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/services/notesservices.dart';
import 'package:excel_hileleri_mobil/services/trainingservice.dart';
import 'package:excel_hileleri_mobil/ui/helper/dialoghelper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyNotesPage extends StatefulWidget {
  const MyNotesPage({super.key});

  @override
  State<MyNotesPage> createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String? uid;
  Stream str = const Stream.empty();
  bool buttonVisibility = true;
  bool filterVisibility = false;
  List<Color> colors = [
    CustomColors.lightRed,
    CustomColors.lightGreen,
  ];

  @override
  void initState() {
    setState(() {
      user = _auth.currentUser;
      uid = user?.uid;
      str = NotesServices().allNotes(uid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Notlarım",
              style: CustomTextStyle.largeHeader,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Visibility(
                    visible: buttonVisibility,
                    child: Column(
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              buttonVisibility = false;
                              filterVisibility = true;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            side:
                                const BorderSide(color: CustomColors.lightBlue),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Ders Konularına Göre Filtreleyin",
                                style: CustomTextStyle.bodyText
                                    .copyWith(color: Colors.black87),
                              ),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              str = NotesServices().allNotes(uid);
                            });
                          },
                          child: Text(
                            "Tüm Notları Göster",
                            style: CustomTextStyle.bodyText,
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: filterVisibility,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(),
                      ),
                      child: StreamBuilder(
                        stream: TrainingService().getBookList(),
                        builder: (context, snapshot) {
                          return !snapshot.hasData
                              ? const Text("Yükleniyor...")
                              : ListView.builder(
                                  itemCount: snapshot.data?.docs.length,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot books =
                                        snapshot.data!.docs[index];
                                    String name = books["name"];

                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          str =
                                              NotesServices().classNotes(name);
                                          buttonVisibility = true;
                                          filterVisibility = false;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        decoration: BoxDecoration(
                                          color: CustomColors.lightBlue,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text(
                                          name,
                                          style: CustomTextStyle.bodyText
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
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
            Flexible(
              child: StreamBuilder(
                stream: str,
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? const Text("Yükleniyor...")
                      : ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot notes = snapshot.data!.docs[index];
                            String noteDetails = notes["note"];
                            String className = notes["classname"];

                            return Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: CustomColors.lightYellow),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 10,
                                        right: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                        ),
                                        color: notes["classname"] ==
                                                "Excel Eğitimi Giriş"
                                            ? CustomColors.lightGreen
                                            : CustomColors.darkRed,
                                      ),
                                      child: Text(
                                        className.replaceAll(" ", "\n"),
                                        style: CustomTextStyle.subtitleText,
                                        softWrap: false,
                                        overflow: TextOverflow.fade,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(),
                                      child: Text(
                                        noteDetails,
                                        style: CustomTextStyle.bodyText,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      right: 10,
                                      left: 5,
                                    ),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      color: CustomColors.lightRed,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                            onTap: () =>
                                                DialogHelper().choicesDialog(
                                                    context,
                                                    "Bu notu silmek istediğinizden emin misiniz?",
                                                    "Evet", () {
                                                  FirebaseFirestore.instance
                                                      .collection("MyNotes")
                                                      .doc(notes.id)
                                                      .delete();
                                                  Navigator.pop(context);
                                                }),
                                            child: const Icon(Icons.delete)),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        InkWell(
                                            onTap: () {},
                                            child: const Icon(Icons.edit)),
                                      ],
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
          ],
        ),
      ),
    );
  }
}
