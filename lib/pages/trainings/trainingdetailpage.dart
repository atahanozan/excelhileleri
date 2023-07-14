import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/helper/takenoteshelper.dart';
import 'package:excel_hileleri_mobil/ui/helper/userinfohelper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class TrainingDetailPage extends StatefulWidget {
  const TrainingDetailPage({
    Key? key,
    required this.title,
    required this.bookname,
    required this.level,
  }) : super(key: key);

  final String title;
  final String bookname;
  final int level;

  @override
  State<TrainingDetailPage> createState() => _TrainingDetailPageState();
}

class _TrainingDetailPageState extends State<TrainingDetailPage> {
  final TextEditingController _controller = TextEditingController();
  int pageCount = 0;
  int pageNo = 1;

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("BookTrainings")
        .doc("booktraining_book1")
        .collection("module1")
        .get()
        .then((value) {
      setState(() {
        pageCount = value.docs.length;
        UserInfoData().userbilgileri().then((index) {
          setState(() {
            pageNo = index["book"];
          });
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext seccontext) {
    return Scaffold(
      floatingActionButton: TakeNotes(
        controller: _controller,
        className: widget.title,
        context: context,
      ).takeNewNote(),
      appBar: CustomAppBar(title: widget.title),
      extendBodyBehindAppBar: true,
      body: Container(
        color: CustomColors.lightYellow,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("booktraining_book1")
              .where("complete", isEqualTo: false)
              .orderBy("page")
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Text("Yükleniyor...")
                : ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      DocumentSnapshot books = snapshot.data!.docs[index];
                      List<dynamic> type = books["index"];

                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: [
                                Text(
                                  books["header"],
                                  style: CustomTextStyle.mediumHeader,
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: type.length,
                                  itemBuilder: (context, number) {
                                    Map<String, dynamic> content = type[number];

                                    return number == 0 || number % 2 == 0
                                        ? Container(
                                            padding: const EdgeInsets.all(15),
                                            margin: content["fullscreen"] ==
                                                    true
                                                ? const EdgeInsets.symmetric(
                                                    vertical: 20)
                                                : const EdgeInsets.only(
                                                    top: 20,
                                                    bottom: 20,
                                                    left: 100,
                                                  ),
                                            decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: CustomColors.lightBlue,
                                                  blurRadius: 40,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  content["text"],
                                                  style:
                                                      CustomTextStyle.bodyText,
                                                ),
                                                Visibility(
                                                  visible:
                                                      content["image"] != null
                                                          ? true
                                                          : false,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 10,
                                                        ),
                                                      ],
                                                    ),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: content["image"] !=
                                                            null
                                                        ? Image.network(
                                                            content["image"])
                                                        : const Text(""),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            padding: const EdgeInsets.all(15),
                                            margin: content["fullscreen"] ==
                                                    true
                                                ? const EdgeInsets.symmetric(
                                                    vertical: 20)
                                                : const EdgeInsets.only(
                                                    top: 20,
                                                    bottom: 20,
                                                    left: 100,
                                                  ),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                const BoxShadow(
                                                  color: CustomColors.lightRed,
                                                  blurRadius: 40,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  content["text"],
                                                  style:
                                                      CustomTextStyle.bodyText,
                                                ),
                                                Visibility(
                                                  visible:
                                                      content["image"] != null
                                                          ? true
                                                          : false,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 10,
                                                        ),
                                                      ],
                                                    ),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: content["image"] !=
                                                            null
                                                        ? Image.network(
                                                            content["image"])
                                                        : const Text(""),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection("booktraining_book1")
                                        .doc(books.id)
                                        .update({
                                      "complete": true,
                                    });
                                  },
                                  child: Text("Sonraki Konu"),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
