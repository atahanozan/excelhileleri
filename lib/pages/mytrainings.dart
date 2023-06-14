import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/pages/blogdetailpage.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/adsappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyTrainingsPage extends StatefulWidget {
  const MyTrainingsPage({
    Key? key,
    required this.user,
    required this.level,
  }) : super(key: key);

  final User? user;
  final int level;

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
                                                builder: (_) => BlogDetailPage(
                                                      title: kalan["title"],
                                                      url: kalan["url"],
                                                    ))),
                                        title: Text(
                                          kalan["title"],
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
                                                builder: (_) => BlogDetailPage(
                                                      title: kalan["title"],
                                                      url: kalan["url"],
                                                    ))),
                                        title: Text(
                                          kalan["title"],
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
