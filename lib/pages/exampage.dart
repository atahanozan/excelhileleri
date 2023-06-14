import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key, required this.level}) : super(key: key);

  final int level;

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int totalPoint = 0;
  List<String> answers = ["", "", "", "", "", "", "", "", "", ""];
  List<String> correctAnswers = [
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "${widget.level}. Seviye Sınav Soruları"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: _firestore
                    .collection("Level${widget.level}")
                    .orderBy("soruno")
                    .snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? const Text("Yükleniyor...")
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot questions =
                                snapshot.data!.docs[index];
                            String correctAns = questions["answer"];

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: CustomColors.lightBlue,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Soru ${(index + 1)}",
                                      style: CustomTextStyle.largeHeader,
                                    ),
                                    Visibility(
                                      visible: questions["image"] == "yok"
                                          ? false
                                          : true,
                                      child: questions["image"] == "yok"
                                          ? const Text("")
                                          : Container(
                                              alignment: Alignment.center,
                                              height: 150,
                                              child: Image.network(
                                                  "${questions["image"]}"),
                                            ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Text(
                                        questions["question"],
                                        style: CustomTextStyle.mediumHeader,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                answers[index] =
                                                    questions["answer1"];
                                                correctAnswers[index] =
                                                    correctAns;
                                              });
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: answers[index] ==
                                                          questions["answer1"]
                                                      ? Colors.blue
                                                      : Colors.grey),
                                              child: const Text("A"),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            questions["answer1"],
                                            style: CustomTextStyle.bodyText,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                answers[index] =
                                                    questions["answer2"];
                                                correctAnswers[index] =
                                                    correctAns;
                                              });
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: answers[index] ==
                                                          questions["answer2"]
                                                      ? Colors.blue
                                                      : Colors.grey),
                                              child: const Text("B"),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            questions["answer2"],
                                            style: CustomTextStyle.bodyText,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                answers[index] =
                                                    questions["answer3"];
                                                correctAnswers[index] =
                                                    correctAns;
                                              });
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: answers[index] ==
                                                          questions["answer3"]
                                                      ? Colors.blue
                                                      : Colors.grey),
                                              child: const Text("C"),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            questions["answer3"],
                                            style: CustomTextStyle.bodyText,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                answers[index] =
                                                    questions["answer4"];
                                                correctAnswers[index] =
                                                    correctAns;
                                              });
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: answers[index] ==
                                                          questions["answer4"]
                                                      ? Colors.blue
                                                      : Colors.grey),
                                              child: const Text("D"),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            questions["answer4"],
                                            style: CustomTextStyle.bodyText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (answers[0] == correctAnswers[0]) {
                      setState(() {
                        totalPoint++;
                      });
                    }
                    if (answers[1] == correctAnswers[1]) {
                      setState(() {
                        totalPoint++;
                      });
                    }
                    if (answers[2] == correctAnswers[2]) {
                      setState(() {
                        totalPoint++;
                      });
                    }
                    if (answers[3] == correctAnswers[3]) {
                      setState(() {
                        totalPoint++;
                      });
                    }
                    if (answers[4] == correctAnswers[4]) {
                      setState(() {
                        totalPoint++;
                      });
                    }
                    if (answers[5] == correctAnswers[5]) {
                      setState(() {
                        totalPoint++;
                      });
                    }
                    if (answers[6] == correctAnswers[6]) {
                      setState(() {
                        totalPoint++;
                      });
                    }
                    if (answers[7] == correctAnswers[7]) {
                      setState(() {
                        totalPoint++;
                      });
                    }
                    if (answers[8] == correctAnswers[8]) {
                      setState(() {
                        totalPoint++;
                      });
                    }
                    if (answers[9] == correctAnswers[9]) {
                      setState(() {
                        totalPoint++;
                      });
                    }
                  },
                  child: const Text("Sınavı Bitir")),
            ],
          ),
        ),
      ),
    );
  }
}
