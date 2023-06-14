import 'package:excel_hileleri_mobil/pages/exampage.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TrainingDetailPage extends StatefulWidget {
  const TrainingDetailPage({
    Key? key,
    required this.title,
    required this.url,
    required this.level,
  }) : super(key: key);

  final String title;
  final String url;
  final int level;

  @override
  State<TrainingDetailPage> createState() => _TrainingDetailPageState();
}

class _TrainingDetailPageState extends State<TrainingDetailPage> {
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
  void dispose() {
    _controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ExamPage(level: widget.level)));
        },
        label: Text(
          "Bölüm Sonu Sınavı",
          style: CustomTextStyle.bodyText,
        ),
        icon: const Icon(Icons.edit),
      ),
      appBar: CustomAppBar(title: widget.title),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
