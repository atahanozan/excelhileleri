import 'package:excel_hileleri_mobil/core/list_tile.dart';
import 'package:excel_hileleri_mobil/project_pages/Languages/laguages.dart';
import 'package:excel_hileleri_mobil/project_pages/about_us.dart';
import 'package:excel_hileleri_mobil/project_pages/gallery.dart';
import 'package:excel_hileleri_mobil/project_pages/my_training.dart';
import 'package:excel_hileleri_mobil/project_pages/news.dart';
import 'package:excel_hileleri_mobil/project_pages/profile.dart';
import 'package:excel_hileleri_mobil/project_pages/races.dart';
import 'package:excel_hileleri_mobil/project_pages/translate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../project_pages/contact_info.dart';
import '../project_pages/home_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Colors.purple.shade100,
            child: const drawerHeaderAll(),
          ),
          const _listTileWidget(
            text: "Ana Sayfa",
            page: HomePage(),
            icon: Icons.home_rounded,
          ),
          const _listTileWidget(
            text: "Profil",
            page: ProfilePage(),
            icon: Icons.account_circle_rounded,
          ),
          const listTileWidget(
            text: "Formül Çevirileri",
            page: TranslatePage(),
            icon: Icons.translate_rounded,
          ),
          const ExpansionTile(
            title: _textScale(text: "Eğitimler"),
            leading: Icon(Icons.book_rounded),
            children: [
              _listTileWidget(text: "Eğitimlerim", page: MyTrainingPage()),
              _listTileWidget(text: "Yarışmalar", page: CompatitionPages())
            ],
          ),
          ExpansionTile(
            title: const _textScale(text: "Hakkımızda"),
            leading: const Icon(Icons.work_rounded),
            children: [
              _listTileWidget(
                  text: textUtilities.drawerList4,
                  page: const AboutUssSection()),
              _listTileWidget(
                  text: textUtilities.drawerList3, page: ContactInfo()),
              const _listTileWidget(text: "Blog Yazıları", page: NewsPages()),
            ],
          ),
        ],
      ),
    );
  }
}

class _listTileWidget extends StatelessWidget {
  const _listTileWidget(
      {Key? key, required this.text, required this.page, this.icon})
      : super(key: key);
  final String text;
  final page;
  final icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)),
      title: Text(
        text,
        style: GoogleFonts.raleway(fontSize: 16),
      ),
      leading: Icon(icon),
    );
  }
}

class drawerHeaderAll extends StatelessWidget {
  const drawerHeaderAll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: FittedBox(
        fit: BoxFit.cover,
        child: (Text(
          "Excel \nHileleri",
          maxLines: 2,
          style: GoogleFonts.raleway(color: Colors.purple.shade900),
        )),
      ),
    );
  }
}

class _textScale extends StatelessWidget {
  const _textScale({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.raleway(fontSize: 16),
    );
  }
}
