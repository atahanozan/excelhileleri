import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/pages/blogdetailpage.dart';
import 'package:excel_hileleri_mobil/pages/videoplayer.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class TraininListPage extends StatefulWidget {
  const TraininListPage({
    Key? key,
    required this.collection,
  }) : super(key: key);

  final String collection;

  @override
  State<TraininListPage> createState() => _TraininListPageState();
}

class _TraininListPageState extends State<TraininListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Eğitim Listesi"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(widget.collection)
              .orderBy("no", descending: false)
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Text("Yükleniyor")
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot trainings = snapshot.data!.docs[index];
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  widget.collection == "BookTrainings"
                                      ? BlogDetailPage(
                                          title: "${trainings['title']}",
                                          url: "${trainings['url']}")
                                      : VideoPlayerPage(
                                          title: '${trainings['title']}',
                                          url: '${trainings['url']}',
                                          content: '${trainings['content']}',
                                        )),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CustomColors.lightGreen,
                          ),
                          child: Text(
                            "${trainings['title']}",
                            style: CustomTextStyle.smallHeader,
                            textAlign: TextAlign.center,
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
