import 'package:excel_hileleri_mobil/core/appbar_page.dart';
import 'package:excel_hileleri_mobil/project_pages/races.dart';
import 'package:excel_hileleri_mobil/project_pages/trainin_documents.dart';
import 'package:excel_hileleri_mobil/project_pages/videogallery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTrainingPage extends StatelessWidget {
  const MyTrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(
        textappbar: "Eğitimler",
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(children: [
            Expanded(
                child: Card(
              color: Colors.amber.shade50,
              child: FittedBox(
                fit: BoxFit.contain,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoGallery()));
                    },
                    child: Text(
                      "Videolu Eğitimler",
                      style: GoogleFonts.raleway(color: Colors.purple.shade800),
                    )),
              ),
            )),
            Expanded(
                child: Card(
              color: Colors.amber.shade100,
              child: FittedBox(
                fit: BoxFit.contain,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrainingDocuments()));
                    },
                    child: Text("Yazılı Eğitimler",
                        style: GoogleFonts.raleway(
                            color: Colors.purple.shade800))),
              ),
            )),
            Expanded(
                child: Card(
              color: Colors.amber.shade200,
              child: FittedBox(
                fit: BoxFit.contain,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompatitionPages()));
                    },
                    child: Text("Yarışmalar",
                        style: GoogleFonts.raleway(
                            color: Colors.purple.shade800))),
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
