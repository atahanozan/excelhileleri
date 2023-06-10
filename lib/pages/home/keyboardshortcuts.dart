import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KeyboardShorcutsPage extends StatelessWidget {
  KeyboardShorcutsPage({super.key});

  final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..clearCache()
    ..loadRequest(Uri.parse(
        "https://docs.google.com/document/d/1bh7nkegi3A9WNOBOa1g9rZ0lA6USOFOjEMcUkxSWgi4/edit?usp=sharing"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: 'Klavye Kısayolları'),
      body: WebViewWidget(controller: _controller),
    );
  }
}
