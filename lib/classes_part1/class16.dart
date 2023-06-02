import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../ui/widgets/appbar_page.dart';

class ClassSixteenPage extends StatelessWidget {
  const ClassSixteenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(),
      body: SfPdfViewer.asset("assets/16_ders.pdf"),
    );
  }
}
