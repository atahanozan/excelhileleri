import 'package:excel_hileleri_mobil/services/trainingservice.dart';
import 'package:excel_hileleri_mobil/ui/helper/userinfohelper.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentCard extends StatefulWidget {
  const StudentCard({Key? key}) : super(key: key);

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String? uid, email;
  String name = "";
  int level = 1;
  int page = 1;
  List<dynamic> points = [];
  String bookName = "";
  String successStatu = "";
  String traininglevel = "Temel Excel Eğitimi";
  double averagePoint = 0;

  @override
  void initState() {
    setState(() {
      user = _auth.currentUser;
      uid = UserInfoData.uid();
      email = user?.email;
      UserInfoData().userbilgileri().then((value) {
        setState(() {
          name = value["name"];
          level = value["level"];
          points = value["points"];
          page = value["page"];
          TrainingService().bookInfo(page).then((otherValue) {
            setState(() {
              bookName = otherValue["name"];
              if (level > 0) {
                setState(() {
                  averagePoint =
                      points.reduce((value, element) => value + element) /
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
                });
              } else {
                setState(() {
                  averagePoint = 0;
                });
              }
            });
          });
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Eğitim Seviyesi",
                  style: CustomTextStyle.bodySmallText
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                ":",
                style: CustomTextStyle.smallHeader,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  traininglevel,
                  style: CustomTextStyle.bodySmallText,
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
                  "Ders Seviyesi",
                  style: CustomTextStyle.bodySmallText
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                ":",
                style: CustomTextStyle.smallHeader,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  level.toString(),
                  style: CustomTextStyle.bodySmallText,
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
                  style: CustomTextStyle.bodySmallText
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                ":",
                style: CustomTextStyle.smallHeader,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  bookName,
                  style: CustomTextStyle.bodySmallText,
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
                  "Başarı Ortalaması",
                  style: CustomTextStyle.bodySmallText
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                ":",
                style: CustomTextStyle.smallHeader,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  averagePoint.toString(),
                  style: CustomTextStyle.bodySmallText,
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
                  "Başarı Seviyesi",
                  style: CustomTextStyle.bodySmallText
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                ":",
                style: CustomTextStyle.smallHeader,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  successStatu,
                  style: CustomTextStyle.bodySmallText,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
