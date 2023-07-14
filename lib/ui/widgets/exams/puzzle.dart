import 'package:excel_hileleri_mobil/ui/helper/dialoghelper.dart';
import 'package:excel_hileleri_mobil/ui/helper/userinfohelper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PuzzleCompetition extends StatefulWidget {
  const PuzzleCompetition({
    Key? key,
    required this.question,
    required this.puzzleList,
    required this.correctAnswer,
    required this.questionId,
    required this.image,
    required this.othercontext,
  }) : super(key: key);

  final String question;
  final List<dynamic> puzzleList;
  final List<dynamic> correctAnswer;
  final int questionId;
  final String image;
  final BuildContext othercontext;

  @override
  State<PuzzleCompetition> createState() => _PuzzleCompetitionState();
}

class _PuzzleCompetitionState extends State<PuzzleCompetition> {
  List<dynamic> puzzles = [];
  List<dynamic> answer = [];
  String lastAnswer = "";

  @override
  void initState() {
    setState(() {
      puzzles = widget.puzzleList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: CustomColors.lightBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100,
            child: Image.network(widget.image),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.question,
            style: CustomTextStyle.bodyText,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: puzzles.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      answer.add(puzzles[index]);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(),
                      color: CustomColors.lightYellow,
                    ),
                    child: Text(
                      puzzles[index],
                      style: CustomTextStyle.bodyText.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white60,
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: answer.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      answer.removeAt(index);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      answer[index],
                      style: CustomTextStyle.bodyText.copyWith(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),
          Text(
            "Eklediğiniz öğeleri kaldırmak için öğeye dokunabilirsiniz.${widget.correctAnswer}",
            style: CustomTextStyle.subtitleText,
          ),
          Text("$answer"),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                if (listEquals(widget.correctAnswer, answer)) {
                  setState(() {
                    lastAnswer = "Doğru";
                    DialogHelper().congratsDialog(widget.othercontext,
                        "Tebrikler... Soruyu doğru yanıtladınız. 5 EH Coin hesabınıza yüklendi.");
                  });
                } else {
                  setState(() {
                    lastAnswer = "Yanlış";
                    DialogHelper().errDialog(widget.othercontext,
                        "Üzgünüm... Bu soruyu doğru bilemedin. Bir sonraki sorular için tekrar yapmaya ne dersin?");
                  });
                }
                UserInfoData()
                    .addPuzzleAnswer(widget.questionId.toString(), lastAnswer);
              },
              child: Text(
                "Yanıtı Gönder",
                style: CustomTextStyle.bodyText,
              ))
        ],
      ),
    );
  }
}
