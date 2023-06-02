import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogDetailPage extends StatefulWidget {
  const BlogDetailPage({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  WebViewController _controller = WebViewController();

  @override
  void initState() {
    setState(() {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.disabled)
        ..clearCache()
        ..loadRequest(Uri.parse(widget.url));
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text(widget.title),
        titleTextStyle: CustomTextStyle.largeHeader,
        elevation: 0,
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
