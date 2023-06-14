import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/pages/trainingdetailpage.dart';
import 'package:excel_hileleri_mobil/pages/videoplayer.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customalertdialog.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TraininListPage extends StatefulWidget {
  const TraininListPage({
    Key? key,
    required this.collection,
  }) : super(key: key);

  final String collection;

  @override
  State<TraininListPage> createState() => _TraininListPageState();
}

class _TraininListPageState extends State<TraininListPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? email, uid;
  User? user;
  int level = 1;

  @override
  void initState() {
    setState(() {
      user = _auth.currentUser;
      email = user?.email;
      uid = user?.uid;
      _firestore
          .collection("Users")
          .doc(uid)
          .get()
          .then((DocumentSnapshot snapshot) {
        setState(() {
          level = snapshot["level"];
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Eğitim Listesi"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(widget.collection)
              .orderBy("no", descending: false)
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Text("Yükleniyor")
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot trainings = snapshot.data!.docs[index];
                      int trainingNo = trainings["no"];
                      int lastLevel = (level + 1);

                      return InkWell(
                        onTap: () {
                          if (widget.collection == "BookTrainings") {
                            if (trainingNo > lastLevel) {
                              showDialog(
                                  context: context,
                                  builder: (_) => const CustomAlerDialog(
                                      content: Text(
                                          "Bir önceki eğitiminiz henüz tamamlanmamış. Öncelikle Mevcut eğitimlerinizi tamamlayınız.")));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => TrainingDetailPage(
                                      title: "${trainings['title']}",
                                      url: "${trainings['url']}",
                                      level: trainingNo,
                                    ),
                                  ));
                            }
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => VideoPlayerPage(
                                        title: '${trainings['title']}',
                                        url: '${trainings['url']}',
                                        content: '${trainings['content']}',
                                      )),
                            );
                          }
                        },
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: widget.collection == "VideoTrainings"
                                    ? CustomColors.lightGreen
                                    : trainingNo < lastLevel
                                        ? CustomColors.lightGreen
                                        : trainingNo == lastLevel
                                            ? CustomColors.lightBlue
                                            : CustomColors.lightRed,
                              ),
                              child: Text(
                                "${trainings['title']}",
                                style: CustomTextStyle.smallHeader.copyWith(
                                  color: widget.collection == "VideoTrainings"
                                      ? Colors.black
                                      : trainingNo < lastLevel
                                          ? Colors.grey
                                          : Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Visibility(
                              visible: widget.collection == "BookTrainings"
                                  ? true
                                  : false,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Icon(
                                  trainingNo <= lastLevel
                                      ? Icons.lock_open
                                      : Icons.lock,
                                  color: trainingNo < lastLevel
                                      ? Colors.grey
                                      : Colors.black,
                                  size: 40,
                                ),
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
    );
  }
}
