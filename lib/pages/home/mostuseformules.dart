import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/helper/text_helper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class MostUsedFormulas extends StatefulWidget {
  const MostUsedFormulas({super.key});

  @override
  State<MostUsedFormulas> createState() => _MostUsedFormulasState();
}

class _MostUsedFormulasState extends State<MostUsedFormulas> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sık Kullanılan Formüller'),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              TextUtilities.sikKullanilanFormuller,
              style: CustomTextStyle.subtitleText,
            ),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: StreamBuilder(
                stream: _firestore.collection("mostusesformulas").snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? const Text("Yükleniyor...")
                      : ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot formulas =
                                snapshot.data!.docs[index];
                            String content = formulas["content"];
                            String title = formulas["title"];

                            return InkWell(
                              onTap: () {
                                if (name == formulas["title"]) {
                                  setState(() {
                                    name = "";
                                  });
                                } else {
                                  setState(() {
                                    name = formulas["title"];
                                  });
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: CustomColors.lightBlue,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    title.split("--")[0],
                                                    style: CustomTextStyle
                                                        .bodyText
                                                        .copyWith(
                                                      fontSize: name ==
                                                              formulas["title"]
                                                          ? 32
                                                          : 18,
                                                      color: name ==
                                                              formulas["title"]
                                                          ? CustomColors.darkRed
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    title.split("--")[1],
                                                    style: CustomTextStyle
                                                        .bodyText
                                                        .copyWith(
                                                      fontSize: name ==
                                                              formulas["title"]
                                                          ? 32
                                                          : 18,
                                                      color: name ==
                                                              formulas["title"]
                                                          ? CustomColors.darkRed
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.touch_app,
                                                size: 30,
                                                color: name == title
                                                    ? Colors.green
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: name == formulas["title"]
                                            ? true
                                            : false,
                                        child: Column(
                                          children: [
                                            Text(
                                              content.replaceAll("--", "\n\n"),
                                              style: CustomTextStyle.bodyText,
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            SizedBox(
                                              height: 200,
                                              child: Image.network(
                                                formulas["image"],
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
    );
  }
}
