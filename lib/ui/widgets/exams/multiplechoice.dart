import 'package:excel_hileleri_mobil/ui/helper/dialoghelper.dart';
import 'package:excel_hileleri_mobil/ui/helper/snackbarhelper.dart';
import 'package:excel_hileleri_mobil/ui/helper/userinfohelper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class MultipleChoiceExams extends StatefulWidget {
  const MultipleChoiceExams({
    Key? key,
    required this.answera,
    required this.answerb,
    required this.answerc,
    required this.answerd,
    required this.correctanswer,
    required this.question,
  }) : super(key: key);

  final String answera;
  final String answerb;
  final String answerc;
  final String answerd;
  final String question;
  final int correctanswer;

  @override
  State<MultipleChoiceExams> createState() => _MultipleChoiceExamsState();
}

class _MultipleChoiceExamsState extends State<MultipleChoiceExams> {
  int answerValue = 0;
  int correctAnswer = 0;
  int coin = 0;
  int totalanswer = 0;
  int collectcoin = 0;
  String err = "Lütfen seçeneklerden en az birini seçin!";
  String congrats = "Tebrikler... Doğru cevap. Hesabınıza 5 EH Coin eklendi.";
  String wrongAnswer =
      "Üzgünüm... Bu soruya doğru yanıt veremediniz. Bir sonraki sorularda daha dikkatli ilerlemeli ve bilmediğiniz konular için eğitim setlerinde tekrar yapmalısınız.";

  void setAnswer(int value) {
    setState(() {
      answerValue = value;
    });
  }

  @override
  void initState() {
    setState(() {
      UserInfoData().userbilgileri().then((value) {
        setState(() {
          correctAnswer = value["competitioncorrectanswer"];
          coin = value["coin"];
          totalanswer = value["competitiontotalquestion"];
          collectcoin = value["competitioncollectcoin"];
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: CustomColors.lightRed,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.question,
                style: CustomTextStyle.bodyText.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              answerLine(1, "A", widget.answera),
              const SizedBox(height: 5),
              answerLine(2, "B", widget.answerb),
              const SizedBox(height: 5),
              answerLine(3, "C", widget.answerc),
              const SizedBox(height: 5),
              answerLine(4, "D", widget.answerd),
              const SizedBox(height: 25),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: CustomColors.lightYellow,
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                onPressed: () {
                  if (answerValue == 0) {
                    DialogHelper().errDialog(context, err);
                  } else {
                    if (answerValue == widget.correctanswer) {
                      setState(() {
                        answerValue = 0;
                        correctAnswer++;
                        totalanswer++;
                        coin += 5;
                        collectcoin += 5;
                        UserInfoData().updateInfo("coin", coin);
                        UserInfoData().updateInfo("ccoin", collectcoin);
                        UserInfoData()
                            .updateInfo("ccorrectanswer", correctAnswer);
                        UserInfoData().updateInfo("ctotalanswer", totalanswer);
                      });
                      SnackBarHelper().showCongratsSnackBar(context, congrats);
                    } else {
                      setState(() {
                        answerValue = 0;
                        totalanswer++;
                        UserInfoData().updateInfo("ctotalanswer", totalanswer);
                      });
                      SnackBarHelper().showErrSnackBar(context, wrongAnswer);
                    }
                  }
                },
                child: Text(
                  "Yanıtı Gönder",
                  style: CustomTextStyle.bodyText.copyWith(
                    fontSize: 20,
                    color: CustomColors.lightYellow,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row answerLine(
    int value,
    String choice,
    String answer,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () => setAnswer(value),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: answerValue == value
                    ? CustomColors.lightGreen
                    : Colors.blue.shade300,
              ),
              child: Text(
                choice,
                style: CustomTextStyle.mediumHeader,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            answer,
            style: CustomTextStyle.bodyText,
          ),
        ),
      ],
    );
  }
}
