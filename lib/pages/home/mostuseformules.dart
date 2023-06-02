import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MostUsedFormulas extends StatelessWidget {
  MostUsedFormulas({super.key});

  final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..clearCache()
    ..loadRequest(Uri.parse(
        "https://docs.google.com/document/d/1gCys8Li7FVf73n5AouebSUVU3t2uYSK731JTUdopBE8/edit?usp=sharing"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sık Kullanılan Formüller'),
      body: WebViewWidget(controller: _controller),
    );
  }
}
