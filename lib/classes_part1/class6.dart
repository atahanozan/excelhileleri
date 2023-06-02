import 'package:excel_hileleri_mobil/ui/widgets/appbar_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ClassSixPage extends StatelessWidget {
  const ClassSixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(),
      body: SfPdfViewer.asset("assets/6_ders.pdf"),
    );
  }
}
