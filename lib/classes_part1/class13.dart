import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../ui/widgets/appbar_page.dart';

class ClassThirteenPage extends StatelessWidget {
  const ClassThirteenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(),
      body: SfPdfViewer.asset("assets/13_ders.pdf"),
    );
  }
}
