import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/pages/trainings/trainingdetailpage.dart';
import 'package:excel_hileleri_mobil/pages/videoplayer.dart';
import 'package:excel_hileleri_mobil/services/trainingservice.dart';
import 'package:excel_hileleri_mobil/ui/helper/dialoghelper.dart';
import 'package:excel_hileleri_mobil/ui/helper/userinfohelper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String? email, uid;
  User? user;
  String lesson = "";
  int level = 0;
  int coin = 0;
  int classLenght = 0;
  bool coinVisible = true;
  List<dynamic> points = [];
  double averagePoint = 0;
  String successStatu = "";

  @override
  void initState() {
    UserInfoData().userbilgileri().then(
      (value) {
        setState(() {
          level = value["level"];
          coin = value["coin"];
          points = value["points"];
          averagePoint = points.reduce((value, element) => value + element) /
              points.length;
          if (averagePoint < 80) {
            setState(() {
              successStatu = "Düşük Başarı Seviyesi";
            });
          }
          if (averagePoint < 90 && averagePoint > 79) {
            setState(() {
              successStatu = "Orta Başarı Seviyesi";
            });
          } else {
            setState(() {
              successStatu = "Yüksek Başarı Seviyesi";
            });
          }
          TrainingService().bookLenght().then((value) {
            setState(() {
              classLenght = value;
            });
          });
          TrainingService().bookInfo(level).then((value) {
            setState(() {
              lesson = value["name"];
            });
          });
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Eğitim Listesi"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Visibility(
              visible: widget.collection == "BookTrainings" ? true : false,
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CustomColors.lightYellow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Eğitim Gösterge Kartı",
                      style: CustomTextStyle.mediumHeader,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Alınan Ders",
                            style: CustomTextStyle.bodyText
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "$level",
                            style: CustomTextStyle.bodyText,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Kalan Ders",
                            style: CustomTextStyle.bodyText
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "${classLenght - level}",
                            style: CustomTextStyle.bodyText,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Güncel Ders Adı",
                            style: CustomTextStyle.bodyText
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            lesson,
                            style: CustomTextStyle.bodyText,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Ortalama Başarı Puanı",
                            style: CustomTextStyle.bodyText
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "$averagePoint",
                            style: CustomTextStyle.bodyText,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Başarı Durumu",
                            style: CustomTextStyle.bodyText
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            successStatu,
                            style: CustomTextStyle.bodyText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(widget.collection)
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
                            DocumentSnapshot trainings =
                                snapshot.data!.docs[index];
                            int trainingNo = trainings["no"];
                            int lastLevel = (level);
                            String name = trainings["name"];
                            String bookname = trainings.id;

                            return InkWell(
                              onTap: () {
                                if (widget.collection == "BookTrainings") {
                                  if (trainingNo > lastLevel) {
                                    DialogHelper().errDialog(context,
                                        "Bir önceki eğitiminiz henüz tamamlanmamış. Öncelikle Mevcut eğitimlerinizi tamamlayınız.");
                                  } else {
                                    if (index < 3) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => TrainingDetailPage(
                                              title: name,
                                              bookname: bookname,
                                              level: trainingNo,
                                            ),
                                          ));
                                    } else {
                                      if (coin > 14) {
                                        setState(() {
                                          coin -= 15;
                                          UserInfoData()
                                              .updateInfo("coin", coin);
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  TrainingDetailPage(
                                                title: name,
                                                bookname: bookname,
                                                level: trainingNo,
                                              ),
                                            ));
                                      } else {
                                        DialogHelper().errDialog(context,
                                            "Bu ders için yeterli EH Coin bulunmamaktadır.EH Coinleri reklam izleyerek ya da Bilgi Yarışmasına katılarak kazanabilirsiniz.");
                                      }
                                    }
                                  }
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => VideoPlayerPage(
                                              title: '${trainings['name']}',
                                              url: '${trainings['url']}',
                                              content: '${trainings['desc']}',
                                            )),
                                  );
                                }
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          widget.collection == "VideoTrainings"
                                              ? CustomColors.lightGreen
                                              : trainingNo < lastLevel
                                                  ? CustomColors.lightGreen
                                                  : trainingNo == lastLevel
                                                      ? CustomColors.lightBlue
                                                      : CustomColors.lightRed,
                                    ),
                                    child: Text(
                                      name,
                                      style:
                                          CustomTextStyle.smallHeader.copyWith(
                                        color: widget.collection ==
                                                "VideoTrainings"
                                            ? Colors.black
                                            : trainingNo < lastLevel
                                                ? Colors.grey
                                                : Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                        widget.collection == "BookTrainings"
                                            ? true
                                            : false,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 5),
                                      child: Icon(
                                        trainingNo <= lastLevel
                                            ? Icons.lock_open
                                            : Icons.lock,
                                        color: trainingNo < lastLevel
                                            ? Colors.grey
                                            : Colors.black,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: index < 3 ? false : true,
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      padding: const EdgeInsets.only(
                                        right: 5,
                                        bottom: 5,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: Image.asset(
                                                "assets/images/coin.png"),
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            "15",
                                            style: CustomTextStyle.bodyText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
