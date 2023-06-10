import 'package:excel_hileleri_mobil/ui/widgets/adsappbar.dart';
import 'package:flutter/material.dart';

class MyTrainingsPage extends StatefulWidget {
  const MyTrainingsPage({super.key});

  @override
  State<MyTrainingsPage> createState() => _MyTrainingsPageState();
}

class _MyTrainingsPageState extends State<MyTrainingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdsAppBar(),
    );
  }
}
