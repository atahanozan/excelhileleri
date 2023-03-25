import 'package:excel_hileleri_mobil/classes_part1/class18.dart';
import 'package:excel_hileleri_mobil/classes_part1/class19.dart';
import 'package:excel_hileleri_mobil/classes_part1/class5.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MostLikeClass extends StatefulWidget {
  const MostLikeClass({super.key});

  @override
  State<MostLikeClass> createState() => _MostLikeClassState();
}

class _MostLikeClassState extends State<MostLikeClass> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _listTileClass(
          text: "ÇALIŞMA SAYFASINDA KLAVYE İLE HAREKET",
          text2: "Derse girmek için tıklayınız...",
          image: FontAwesomeIcons.one,
          page: ClassFivePage(),
        ),
        const _listTileClass(
          text: "GRAFİKLER",
          text2: "Derse girmek için tıklayınız...",
          image: FontAwesomeIcons.two,
          page: ClassEighteenPage(),
        ),
        const _listTileClass(
          text: "ÇALIŞMAYA RESİM, ŞEKİL, GRAFİK GİBİ NESNELERİ EKLEME",
          text2: "Derse girmek için tıklayınız...",
          image: FontAwesomeIcons.three,
          page: ClassNineteenPage(),
        ),
      ],
    );
  }
}

class _listTileClass extends StatelessWidget {
  const _listTileClass(
      {Key? key, required this.text, this.text2, this.image, this.page})
      : super(key: key);

  final String text;
  final text2;
  final image;
  final page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.amber.shade50,
        dense: true,
        visualDensity: const VisualDensity(vertical: 4),
        isThreeLine: true,
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            text,
            style: GoogleFonts.raleway(fontSize: 18),
          ),
        ),
        leading: FaIcon(
          image,
          size: 40,
          color: Colors.amber.shade500,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            text2,
            style: GoogleFonts.raleway(fontSize: 16),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
