import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogDetailPage extends StatefulWidget {
  const BlogDetailPage({
    Key? key,
    required this.title,
    required this.content,
    required this.content1,
    required this.image,
  }) : super(key: key);

  final String title;
  final String content;
  final String content1;
  final String image;

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  List<String> content1 = [];
  String content2 = "";

  @override
  void initState() {
    setState(() {
      content1 = widget.content.split(" ");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "",
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: CustomColors.lightYellow,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.title,
                style: CustomTextStyle.largeHeader,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 150,
                child: Image.network(widget.image),
              ),
              const Divider(
                thickness: 2,
                height: 20,
                color: Colors.black54,
              ),
              RichText(
                text: TextSpan(
                    text: widget.content1,
                    style: GoogleFonts.meddon(
                      fontSize: 60,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: widget.content.replaceAll("--", "\n\n"),
                        style: CustomTextStyle.bodyText,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
