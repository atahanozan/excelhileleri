import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class ClassCard extends StatefulWidget {
  const ClassCard({
    Key? key,
    required this.header,
    required this.content,
    required this.image,
  }) : super(key: key);

  final String header;
  final String content;
  final String image;

  @override
  State<ClassCard> createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(widget.image),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.header,
                  style: CustomTextStyle.largeHeader,
                ),
                Text(
                  widget.content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyle.bodySmallText,
                ),
                const Icon(Icons.arrow_right_alt_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
