import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/pages/admin/adminpanel.dart';
import 'package:excel_hileleri_mobil/pages/editprofile.dart';
import 'package:excel_hileleri_mobil/ui/helper/userinfohelper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/adsappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    required this.level,
    required this.totalDers,
    required this.points,
    required this.name,
    required this.gender,
    required this.phone,
    required this.birth,
    required this.email,
    required this.traininglevel,
    required this.currenttraining,
  }) : super(key: key);

  final int level;
  final int totalDers;
  final List<dynamic> points;
  final String name;
  final String gender;
  final String phone;
  final String birth;
  final String email;
  final String traininglevel;
  final String currenttraining;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String successStatu = "";
  double averagePoint = 0;
  List<dynamic> points = [];

  @override
  void initState() {
    setState(() {
      if (widget.level > 0) {
        setState(() {
          points = widget.points;
          averagePoint =
              widget.points.reduce((value, element) => value + element) /
                  widget.points.length;
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdsAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EditProfile(
                                          gender:
                                              widget.gender == "Henüz eklenmedi"
                                                  ? "Seçeneksiz..."
                                                  : widget.gender,
                                          name: widget.name,
                                          phone:
                                              widget.phone == "Henüz eklenmedi"
                                                  ? "05XXX"
                                                  : widget.phone,
                                          selectedDate: widget.birth ==
                                                  "Henüz eklenmedi"
                                              ? DateTime.now()
                                              : DateTime.parse(widget.birth),
                                          user: UserInfoData.user(),
                                        )));
                          },
                          style: OutlinedButton.styleFrom(
                              foregroundColor: CustomColors.darkRed,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          child: Text(
                            "Düzenle",
                            style: CustomTextStyle.bodyText,
                          )),
                      Visibility(
                        visible: widget.email == "atahanozantokdemir@gmail.com"
                            ? true
                            : false,
                        child: TextButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AdminPanel(),
                                  ),
                                ),
                            child: Text(
                              "Admin Panel",
                              style: CustomTextStyle.smallHeader.copyWith(
                                color: CustomColors.darkRed,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.name.toString().replaceAll(" ", "\n"),
                    style: GoogleFonts.titanOne(
                      fontSize: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .where("email", isEqualTo: widget.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? const Text("Yükleniyor")
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot userInfo =
                                  snapshot.data!.docs[index];

                              return Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: CustomColors.lightYellow,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Genel Bilgiler",
                                      style: CustomTextStyle.mediumHeader,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Doğum Tarihi ",
                                              style: CustomTextStyle.bodyText
                                                  .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              userInfo["birth"] ==
                                                      "Henüz eklenmedi"
                                                  ? userInfo["birth"]
                                                  : userInfo["birth"]
                                                      .split(" ")[0],
                                              style: CustomTextStyle.bodyText
                                                  .copyWith(
                                                color: widget.birth ==
                                                        "Henüz eklenmedi"
                                                    ? Colors.grey.shade400
                                                    : Colors.black,
                                              ),
                                            )),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Cinsiyet ",
                                              style: CustomTextStyle.bodyText
                                                  .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              userInfo["gender"],
                                              style: CustomTextStyle.bodyText
                                                  .copyWith(
                                                color: widget.gender ==
                                                        "Henüz eklenmedi"
                                                    ? Colors.grey.shade400
                                                    : Colors.black,
                                              ),
                                            )),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "E-mail ",
                                              style: CustomTextStyle.bodyText
                                                  .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              widget.email.toString(),
                                              style: CustomTextStyle.bodyText,
                                            )),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Telefon ",
                                              style: CustomTextStyle.bodyText
                                                  .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                              userInfo["phone"],
                                              style: CustomTextStyle.bodyText
                                                  .copyWith(
                                                color: widget.phone ==
                                                        "Henüz eklenmedi"
                                                    ? Colors.grey.shade400
                                                    : Colors.black,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                  },
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColors.lightGreen,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Eğitim Bilgileri",
                        style: CustomTextStyle.mediumHeader,
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "Eğitim Seviyesi ",
                                style: CustomTextStyle.bodyText.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Text(
                                widget.traininglevel,
                                style: CustomTextStyle.bodyText,
                              )),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "Devam Eden Eğitim ",
                                style: CustomTextStyle.bodyText.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Text(
                                widget.currenttraining,
                                style: CustomTextStyle.bodyText,
                              )),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "Başarı Ortalaması ",
                                style: CustomTextStyle.bodyText.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Text(
                                averagePoint.toString(),
                                style: CustomTextStyle.bodyText,
                              )),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "Başarı Durumu ",
                                style: CustomTextStyle.bodyText.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Text(
                                successStatu,
                                style: CustomTextStyle.bodyText,
                              )),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "Alınan Ders Sayısı ",
                                style: CustomTextStyle.bodyText.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Text(
                                widget.level.toString(),
                                style: CustomTextStyle.bodyText,
                              )),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "Kalan Ders Sayısı ",
                                style: CustomTextStyle.bodyText.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Text(
                                (widget.totalDers - widget.level).toString(),
                                style: CustomTextStyle.bodyText,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _auth.signOut();
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text(
                        "Çıkış Yap",
                        style: CustomTextStyle.bodyText,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    content: Text(
                                      "Hesabı silmek istediğinize emin misiniz?",
                                      style: CustomTextStyle.bodyText,
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            UserInfoData.user()!.delete();
                                            Navigator.pushReplacementNamed(
                                                context, "/enter");
                                          },
                                          child: Text(
                                            "Evet",
                                            style: CustomTextStyle.bodyText,
                                          )),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            "Hayır",
                                            style: CustomTextStyle.bodyText
                                                .copyWith(color: Colors.black),
                                          ))
                                    ],
                                  ));
                        },
                        child: Text(
                          "Hesabı Sil",
                          style: CustomTextStyle.bodyText.copyWith(
                            color: CustomColors.darkRed,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
