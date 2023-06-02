import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class KeyboardShorcutsPage extends StatelessWidget {
  const KeyboardShorcutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Klavye Kısayolları'),
    );
  }
}
