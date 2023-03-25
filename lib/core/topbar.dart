import 'package:excel_hileleri_mobil/project_pages/contact_info.dart';
import 'package:excel_hileleri_mobil/project_pages/my_training.dart';
import 'package:excel_hileleri_mobil/project_pages/news.dart';
import 'package:excel_hileleri_mobil/project_pages/races.dart';
import 'package:excel_hileleri_mobil/project_pages/translate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: _cardWidget(
            text: 'Formül \nÇevirileri',
            icon: FontAwesomeIcons.language,
            page: TranslatePage(),
          ),
        ),
        const Expanded(
          child: _cardWidget(
            text: "Eğitimler",
            icon: FontAwesomeIcons.book,
            page: MyTrainingPage(),
          ),
        ),
        const Expanded(
          child: _cardWidget(
            text: "Yarışmalar",
            icon: FontAwesomeIcons.gamepad,
            page: CompatitionPages(),
          ),
        ),
        const Expanded(
          child: _cardWidget(
            text: "İletişim",
            icon: FontAwesomeIcons.phone,
            page: ContactInfo(),
          ),
        ),
        const Expanded(
          child: _cardWidget(
            text: "Blog \nYazıları",
            icon: FontAwesomeIcons.globe,
            page: NewsPages(),
          ),
        ),
      ],
    );
  }
}

class _cardWidget extends StatelessWidget {
  const _cardWidget({Key? key, required this.text, this.icon, this.page})
      : super(key: key);
  final String text;
  final icon;
  final page;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Card(
          color: Colors.amber.shade50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: FaIcon(
                    icon,
                    size: 25,
                    color: Colors.purple.shade900,
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
