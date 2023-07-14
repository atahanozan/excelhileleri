import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/services/competitionservice.dart';
import 'package:excel_hileleri_mobil/ui/helper/dialoghelper.dart';
import 'package:excel_hileleri_mobil/ui/helper/userinfohelper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:excel_hileleri_mobil/ui/widgets/exams/multiplechoice.dart';
import 'package:excel_hileleri_mobil/ui/widgets/exams/puzzle.dart';
import 'package:flutter/material.dart';

class CompetitionPage extends StatefulWidget {
  const CompetitionPage({super.key});

  @override
  State<CompetitionPage> createState() => _CompetitionPageState();
}

class _CompetitionPageState extends State<CompetitionPage> {
  int lenght = 0;
  int competitionno = 0;
  String info =
      "Şimdilik sorabileceğim tüm soruları sordum. Ekleme yapıldıkça soruları yanıtlamaya devam edebilirsin...";

  @override
  void initState() {
    CompetitionService().questionLenght().then((value) {
      setState(() {
        lenght = value;
        UserInfoData().userbilgileri().then((value) {
          setState(() {
            competitionno = value["competitiontotalquestion"];
            if (competitionno + 1 > lenght) {
              DialogHelper().infoDialog(context, info);
            }
          });
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Bilgi Yarışması"),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .where("email", isEqualTo: UserInfoData.email())
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Text("Yükleniyor...")
                : ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      DocumentSnapshot userinfo = snapshot.data!.docs[index];
                      String totalQuestion =
                          userinfo["competitiontotalquestion"].toString();
                      String correctAnswer =
                          userinfo["competitioncorrectanswer"].toString();
                      String wrongAnswer =
                          (userinfo["competitiontotalquestion"] -
                                  userinfo["competitioncorrectanswer"])
                              .toString();
                      String collectCoin =
                          userinfo["competitioncollectcoin"].toString();
                      String coin = userinfo["coin"].toString();
                      int no = userinfo["competitiontotalquestion"] + 1;
                      return Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: CustomColors.lightYellow,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Bilgi Yarışması Durum Tablosu",
                              style: CustomTextStyle.mediumHeader,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Toplam Cevaplanan Soru",
                                    style: CustomTextStyle.bodyText
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    totalQuestion,
                                    style: CustomTextStyle.bodyText,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Doğru Cevap",
                                    style: CustomTextStyle.bodyText
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    correctAnswer,
                                    style: CustomTextStyle.bodyText,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Yanlış Cevap",
                                    style: CustomTextStyle.bodyText
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    wrongAnswer,
                                    style: CustomTextStyle.bodyText,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Kazanılan Toplam EH Coin",
                                    style: CustomTextStyle.bodyText
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    collectCoin,
                                    style: CustomTextStyle.bodyText,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Mevcut Toplam EH Coin",
                                    style: CustomTextStyle.bodyText
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    coin,
                                    style: CustomTextStyle.bodyText,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            SizedBox(
                              child: no > lenght
                                  ? Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: CustomColors.darkRed,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        info,
                                        style: CustomTextStyle.bodyText
                                            .copyWith(color: Colors.white),
                                      ))
                                  : StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection("competition")
                                          .where("no", isEqualTo: no)
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        return !snapshot.hasData
                                            ? const Text("Yükleniyor...")
                                            : ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: 1,
                                                itemBuilder: (context, index) {
                                                  DocumentSnapshot questions =
                                                      snapshot
                                                          .data!.docs[index];
                                                  String type =
                                                      questions["type"];

                                                  return type == "choice"
                                                      ? MultipleChoiceExams(
                                                          answera: questions[
                                                              "answera"],
                                                          answerb: questions[
                                                              "answerb"],
                                                          answerc: questions[
                                                              "answerc"],
                                                          answerd: questions[
                                                              "answerd"],
                                                          correctanswer: questions[
                                                              "correctanswer"],
                                                          question: questions[
                                                              "question"],
                                                        )
                                                      : PuzzleCompetition(
                                                          question: questions[
                                                              "question"],
                                                          puzzleList: questions[
                                                              "puzzlelist"],
                                                          correctAnswer: questions[
                                                              "correctanswer"],
                                                          questionId:
                                                              questions["no"],
                                                          image: questions[
                                                              "image"],
                                                          othercontext: context,
                                                        );
                                                },
                                              );
                                      },
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
