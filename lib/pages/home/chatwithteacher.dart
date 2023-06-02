import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class ChatWithTeacherPage extends StatefulWidget {
  const ChatWithTeacherPage({super.key});

  @override
  State<ChatWithTeacherPage> createState() => _ChatWithTeacherPageState();
}

class _ChatWithTeacherPageState extends State<ChatWithTeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Eğitmene Sor'),
    );
  }
}
