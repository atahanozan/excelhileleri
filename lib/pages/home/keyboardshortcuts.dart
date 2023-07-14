import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/helper/text_helper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class KeyboardShorcutsPage extends StatefulWidget {
  const KeyboardShorcutsPage({super.key});

  @override
  State<KeyboardShorcutsPage> createState() => _KeyboardShorcutsPageState();
}

class _KeyboardShorcutsPageState extends State<KeyboardShorcutsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int pageNo1 = 1;
  int pageNo2 = 78;
  int buttonValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Klavye Kısayolları'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              TextUtilities.klavyeKisayollar,
              style: CustomTextStyle.subtitleText,
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        pageNo1 = 1;
                        pageNo2 = 78;
                        buttonValue = 1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: buttonValue == 1 ? Border.all() : null,
                        color: buttonValue == 1
                            ? CustomColors.lightGreen
                            : CustomColors.lightYellow,
                      ),
                      child: FittedBox(
                        child: Text(
                          "Tümünü Göster",
                          style: CustomTextStyle.mediumHeader,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColors.darkRed,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                pageNo1 = 1;
                                pageNo2 = 37;
                                buttonValue = 2;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: buttonValue == 2 ? Border.all() : null,
                                color: buttonValue == 2
                                    ? CustomColors.lightGreen
                                    : CustomColors.lightYellow,
                              ),
                              child: FittedBox(
                                child: Text(
                                  "Genel\nÇalışma\nSayfası",
                                  style: CustomTextStyle.mediumHeader,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                pageNo1 = 38;
                                pageNo2 = 50;
                                buttonValue = 3;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: buttonValue == 3 ? Border.all() : null,
                                color: buttonValue == 3
                                    ? CustomColors.lightGreen
                                    : CustomColors.lightYellow,
                              ),
                              child: FittedBox(
                                child: Text(
                                  "Çalışma\nSayfasında\nVeya\nHücrede\nDolaşma",
                                  style: CustomTextStyle.mediumHeader,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                pageNo1 = 51;
                                pageNo2 = 54;
                                buttonValue = 4;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: buttonValue == 4 ? Border.all() : null,
                                color: buttonValue == 4
                                    ? CustomColors.lightGreen
                                    : CustomColors.lightYellow,
                              ),
                              child: FittedBox(
                                child: Text(
                                  "Hücreleri\nSeçme",
                                  style: CustomTextStyle.mediumHeader,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                pageNo1 = 55;
                                pageNo2 = 65;
                                buttonValue = 5;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: buttonValue == 5 ? Border.all() : null,
                                color: buttonValue == 5
                                    ? CustomColors.lightGreen
                                    : CustomColors.lightYellow,
                              ),
                              child: FittedBox(
                                child: Text(
                                  "Hücreleri\nDüzenleme",
                                  style: CustomTextStyle.mediumHeader,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                pageNo1 = 66;
                                pageNo2 = 78;
                                buttonValue = 6;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: buttonValue == 6 ? Border.all() : null,
                                color: buttonValue == 6
                                    ? CustomColors.lightGreen
                                    : CustomColors.lightYellow,
                              ),
                              child: FittedBox(
                                child: Text(
                                  "Hücreleri\nBiçimlendirme",
                                  style: CustomTextStyle.mediumHeader,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: StreamBuilder(
                stream: _firestore
                    .collection("KeyboardShortCuts")
                    .where(
                      "no",
                      isGreaterThanOrEqualTo: pageNo1,
                      isLessThanOrEqualTo: pageNo2,
                    )
                    .orderBy("no")
                    .snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? const Text("Yükleniyor")
                      : ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot keys = snapshot.data!.docs[index];
                            List<dynamic> keyNames = keys["keys"];

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: index % 2 == 0
                                      ? CustomColors.lightGreen
                                      : CustomColors.lightBlue,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        keys["content"],
                                        style: CustomTextStyle.bodyText,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: keyNames.length,
                                        itemBuilder: (context, index) {
                                          return index % 2 == 0
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Text(
                                                    keyNames[index],
                                                    style: CustomTextStyle
                                                        .smallHeader,
                                                  ),
                                                )
                                              : Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    keyNames[index],
                                                    style: CustomTextStyle
                                                        .largeHeader,
                                                  ),
                                                );
                                        },
                                      ),
                                    ),
                                  ],
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
