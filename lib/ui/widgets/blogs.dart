import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/pages/blogdetailpage.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key});

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Blog Yazıları",
              style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/allblogs");
              },
              child: const Text(
                "Tümünü gör",
                style: TextStyle(color: CustomColors.lightRed),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: StreamBuilder(
            stream: _firestore
                .collection("Blogsindex")
                .orderBy("no", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? Text(
                      "Yükleniyor...",
                      style: CustomTextStyle.bodyText,
                    )
                  : ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [0.8, 1],
                          colors: [
                            Colors.white,
                            Colors.transparent,
                          ],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot blogs = snapshot.data!.docs[index];
                          String title = blogs['title'];
                          String content = blogs['content'];
                          String no = blogs['no'].toString();
                          String image = blogs["image"];
                          String content1 = blogs["content1"];
                          String teacher = blogs["teacher"];

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => BlogDetailPage(
                                              title: title,
                                              content: content,
                                              image: image,
                                              content1: content1,
                                            )));
                              },
                              child: Container(
                                alignment: Alignment.topLeft,
                                width: 100,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: CustomColors.darkRed,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: CustomColors.lightYellow,
                                      child: Image.network(teacher),
                                    ),
                                    const Divider(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: FittedBox(
                                          child: Text(
                                            title.replaceAll(" ", "\n"),
                                            softWrap: true,
                                            style: GoogleFonts.raleway(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
}
