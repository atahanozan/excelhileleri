import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/pages/blogdetailpage.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class AllBlogsPage extends StatefulWidget {
  const AllBlogsPage({super.key});

  @override
  State<AllBlogsPage> createState() => _AllBlogsPageState();
}

class _AllBlogsPageState extends State<AllBlogsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: "Blog Yazıları"),
      body: StreamBuilder(
        stream: _firestore
            .collection("Blogsindex")
            .orderBy("no", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const CircularProgressIndicator()
              : ListView.builder(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlogDetailPage(
                                        title: title,
                                        content: content,
                                        image: image,
                                        content1: content1,
                                      )));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: CustomColors.darkRed,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: Image.network(
                                      teacher,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: FittedBox(
                                      child: Text(
                                        title,
                                        softWrap: true,
                                        style: CustomTextStyle.mediumHeader,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                height: 5,
                                thickness: 3,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Expanded(
                                  flex: 3,
                                  child: RichText(
                                    maxLines: 4,
                                    overflow: TextOverflow.fade,
                                    text: TextSpan(
                                        text: content1,
                                        style: CustomTextStyle.subtitleText,
                                        children: [
                                          TextSpan(
                                            text:
                                                content.replaceAll("--", "\n"),
                                            style: CustomTextStyle.subtitleText,
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
