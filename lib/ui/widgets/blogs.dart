import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/pages/blogdetailpage.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

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
        Text(
          "Blog Yazıları",
          style: CustomTextStyle.largeHeader,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF92809)),
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: StreamBuilder(
            stream: _firestore
                .collection("Blogsindex")
                .orderBy("no", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot blogs = snapshot.data!.docs[index];
                        String title = blogs['title'];
                        String url = blogs['url'];
                        String no = blogs['no'].toString();

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BlogDetailPage(
                                          title: title, url: url)));
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: 100,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xffFFE7C6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    no,
                                    style: CustomTextStyle.subtitleText,
                                  ),
                                  const Divider(
                                    height: 5,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      child: FittedBox(
                                        child: Text(
                                          title.replaceAll(" ", "\n"),
                                          softWrap: true,
                                          style: CustomTextStyle.mediumHeader,
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
                    );
            },
          ),
        ),
      ],
    );
  }
}
