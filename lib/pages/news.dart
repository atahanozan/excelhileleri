import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/core/appbar_page.dart';
import 'package:flutter/material.dart';

class NewsPages extends StatefulWidget {
  const NewsPages({Key? key}) : super(key: key);

  @override
  State<NewsPages> createState() => _NewsPagesState();
}

class _NewsPagesState extends State<NewsPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarPage(textappbar: "Blog Yazıları"),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('blogs')
              .orderBy('id', descending: true)
              .snapshots(),
          builder: (BuildContext context, snapshot) {
            return !snapshot.hasData
                ? const Text('Yükleniyor')
                : ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot myBlogs = snapshot.data!.docs[index];
                      String content = myBlogs['content'];
                      String lastcontent = content.replaceAll('.', '\n\n');
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListTile(
                          title: Text(myBlogs['header']),
                          subtitle: Text(
                            lastcontent,
                            maxLines: 3,
                            overflow: TextOverflow.fade,
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Text(
                                              myBlogs['header'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  ?.copyWith(
                                                    color: Colors
                                                        .greenAccent.shade700,
                                                  ),
                                            )),
                                            IconButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                icon: const Icon(
                                                    Icons.close_rounded)),
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      SizedBox(
                                        height: 300,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Text(lastcontent),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Tarih: ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    ),
                                                    Text(
                                                      myBlogs['datetime'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Yazar: ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    ),
                                                    Text(
                                                      myBlogs['writer'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                      );
                    },
                  );
          },
        ));
  }
}
