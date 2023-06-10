import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/pages/blogdetailpage.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          color: CustomColors.lightYellow,
        ),
        child: StreamBuilder(
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
                      String url = blogs['url'];
                      String no = blogs['no'].toString();

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlogDetailPage(
                                        title: title, url: url)));
                          },
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: CustomColors.darkRed,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  no,
                                  style: CustomTextStyle.mediumHeader.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                const Divider(
                                  height: 5,
                                  thickness: 3,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    child: FittedBox(
                                      child: Text(
                                        title,
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
                  );
          },
        ),
      ),
    );
  }
}
