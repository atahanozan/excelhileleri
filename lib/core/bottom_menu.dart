import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../project_pages/about_us.dart';
import '../project_pages/contact_info.dart';
import '../project_pages/my_training.dart';
import '../project_pages/translate.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple.shade800,
                  borderRadius: BorderRadius.circular(20)),
              height: 100,
              width: 150,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutUssSection())),
                    child: Text("Hakkımızda",
                        style: GoogleFonts.raleway(
                            fontSize: 100, color: Colors.amber.shade400)),
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.purple.shade800,
                    borderRadius: BorderRadius.circular(20)),
                height: 100,
                width: 200,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TranslatePage())),
                      child: Text("Formül \nÇevirileri",
                          style: GoogleFonts.raleway(
                              fontSize: 100, color: Colors.amber.shade400)),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.purple.shade800,
                    borderRadius: BorderRadius.circular(20)),
                height: 100,
                width: 200,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyTrainingPage())),
                      child: Text("Eğitim \nDökümanları",
                          style: GoogleFonts.raleway(
                              fontSize: 100, color: Colors.amber.shade400)),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.purple.shade800,
                      borderRadius: BorderRadius.circular(20)),
                  height: 100,
                  width: 150,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactInfo())),
                        child: Text("İletişim",
                            style: GoogleFonts.raleway(
                                fontSize: 100, color: Colors.amber.shade400)),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
