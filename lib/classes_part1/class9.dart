import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../ui/widgets/appbar_page.dart';

class ClassNinePage extends StatelessWidget {
  const ClassNinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(),
      body: SfPdfViewer.asset("assets/9_ders.pdf"),
    );
  }
}
