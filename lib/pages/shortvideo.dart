import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/widgets/videoplayerwidget.dart';
import 'package:flutter/material.dart';

class ShortVideosPage extends StatefulWidget {
  const ShortVideosPage({Key? key}) : super(key: key);

  @override
  State<ShortVideosPage> createState() => _ShortVideosPageState();
}

class _ShortVideosPageState extends State<ShortVideosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("VideoShort").snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Text("Yükleniyor...")
                : PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot videos = snapshot.data!.docs[index];
                      String url = videos["url"];
                      String title = videos["title"];
                      String body = videos["content"];

                      return VideoPlayerWidget(
                        body: body,
                        title: title,
                        url: url,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
