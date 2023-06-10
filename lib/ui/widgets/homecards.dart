import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class HomePageCards extends StatefulWidget {
  const HomePageCards({
    Key? key,
    required this.header,
    required this.content,
    required this.image,
    required this.page,
  }) : super(key: key);

  final String header;
  final String content;
  final String image;
  final Widget page;

  @override
  State<HomePageCards> createState() => _HomePageCardsState();
}

class _HomePageCardsState extends State<HomePageCards> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget.page),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            border: Border.all(
              color: CustomColors.lightGreen,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffD1E4DA),
              ),
              height: 120,
              child: Image.asset(widget.image),
            ),
            Text(
              widget.header,
              style: CustomTextStyle.smallHeader,
            ),
            Text(
              widget.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyle.subtitleText,
            ),
            const Icon(
              Icons.arrow_forward_rounded,
            )
          ],
        ),
      ),
    );
  }
}
