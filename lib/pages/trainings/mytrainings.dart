import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/pages/trainings/trainingdetailpage.dart';
import 'package:excel_hileleri_mobil/ui/helper/dialoghelper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/adsappbar.dart';
import 'package:excel_hileleri_mobil/ui/widgets/studentcard.dart';
import 'package:flutter/material.dart';

class MyTrainingsPage extends StatefulWidget {
  const MyTrainingsPage({
    Key? key,
    required this.level,
    required this.points,
    required this.traininglevel,
    required this.trainingname,
  }) : super(key: key);

  final int level;
  final List<dynamic> points;
  final String trainingname;
  final String traininglevel;

  @override
  State<MyTrainingsPage> createState() => _MyTrainingsPageState();
}

class _MyTrainingsPageState extends State<MyTrainingsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdsAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: StudentCard(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Text(
                    "Tamamlanan Dersler",
                    style: CustomTextStyle.smallHeader,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: CustomColors.lightRed,
                        borderRadius: BorderRadius.circular(20)),
                    child: StreamBuilder(
                      stream: _firestore
                          .collection("BookTrainings")
                          .where("no", isLessThanOrEqualTo: widget.level)
                          .snapshots(),
                      builder: (context, snapshot) {
                        return !snapshot.hasData
                            ? const Text("Yükleniyor")
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot kalan =
                                      snapshot.data!.docs[index];
                                  String title = kalan["name"];
                                  String bookname = kalan.id;

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: CustomColors.lightYellow,
                                      ),
                                      child: ListTile(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TrainingDetailPage(
                                                    title: title,
                                                    bookname: bookname,
                                                    level: widget.level),
                                          ),
                                        ),
                                        title: Text(
                                          kalan["name"],
                                          style: CustomTextStyle.bodyText,
                                        ),
                                        subtitle: Text(
                                          kalan["desc"],
                                          style: CustomTextStyle.subtitleText,
                                        ),
                                        trailing: const Icon(Icons.arrow_right),
                                      ),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Text(
                    "Bekleyen Dersler",
                    style: CustomTextStyle.smallHeader,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: CustomColors.lightRed,
                        borderRadius: BorderRadius.circular(20)),
                    child: StreamBuilder(
                      stream: _firestore
                          .collection("BookTrainings")
                          .where("no", isGreaterThan: widget.level)
                          .snapshots(),
                      builder: (context, snapshot) {
                        return !snapshot.hasData
                            ? const Text("Yükleniyor")
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot kalan =
                                      snapshot.data!.docs[index];
                                  String title = kalan["name"];
                                  String bookname = kalan.id;
                                  int no = kalan["no"];

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: CustomColors.lightYellow,
                                      ),
                                      child: ListTile(
                                        onTap: () {
                                          if (no > widget.level + 1) {
                                            DialogHelper().errDialog(context,
                                                "Öncelikle bir sonraki dersi tamamlamanız gerekmektedir.");
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TrainingDetailPage(
                                                        title: title,
                                                        bookname: bookname,
                                                        level: widget.level),
                                              ),
                                            );
                                          }
                                        },
                                        title: Text(
                                          kalan["name"],
                                          style: CustomTextStyle.bodyText,
                                        ),
                                        subtitle: Text(
                                          kalan["desc"],
                                          style: CustomTextStyle.subtitleText,
                                        ),
                                        trailing: const Icon(Icons.arrow_right),
                                      ),
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
          ],
        ),
      ),
    );
  }
}
