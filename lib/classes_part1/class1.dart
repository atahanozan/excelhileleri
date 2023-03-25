import 'package:excel_hileleri_mobil/core/appbar_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ClassOnePage extends StatelessWidget {
  const ClassOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(textappbar: ""),
      body: SfPdfViewer.asset("assets/1ders.pdf"),
    );
  }
}