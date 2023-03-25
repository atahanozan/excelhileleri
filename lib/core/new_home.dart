import 'package:excel_hileleri_mobil/news_pages/new2.dart';
import 'package:excel_hileleri_mobil/news_pages/new3.dart';
import 'package:excel_hileleri_mobil/project_pages/Languages/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../news_pages/new1.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: _listtileThis(
            text: newsTexts.header1,
            text2: newsTexts.index1,
            page: NewsOne(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: _listtileThis(
            text: newsTexts.header2,
            text2: newsTexts.index2,
            page: NewsTwo(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: _listtileThis(
            text: newsTexts.header3,
            text2: newsTexts.index3,
            page: NewsThree(),
          ),
        ),
      ],
    );
  }
}

class _listtileThis extends StatelessWidget {
  const _listtileThis({
    Key? key,
    required this.text,
    required this.text2,
    this.page,
  }) : super(key: key);

  final String text;
  final String text2;
  final page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)),
      minLeadingWidth: 80,
      isThreeLine: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      dense: true,
      visualDensity: VisualDensity(vertical: 4),
      tileColor: Colors.purple.shade100,
      leading: Icon(
        Icons.newspaper_rounded,
        size: 60,
        color: Colors.purple.shade900,
      ),
      trailing: Text(
        "Haber \nDetayı...",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.purple.shade900),
      ),
      title: Text(
        text,
        style: GoogleFonts.raleway(fontSize: 18),
      ),
      subtitle: Text(
        text2,
        style: GoogleFonts.raleway(fontSize: 16),
        maxLines: 6,
        overflow: TextOverflow.fade,
      ),
    );
  }
}