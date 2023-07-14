import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class HomeAiCard extends StatefulWidget {
  const HomeAiCard({super.key});

  @override
  State<HomeAiCard> createState() => _HomeAiCardState();
}

class _HomeAiCardState extends State<HomeAiCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, "/ai"),
        child: Container(
          height: 180,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: CustomColors.lightYellow,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                "assets/images/chatai.png",
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140),
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: CustomColors.lightGreen,
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 2,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Yapay Zekaya Soru Sor",
                        style: CustomTextStyle.bodyText.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.arrow_circle_right_outlined)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
