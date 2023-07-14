import 'package:excel_hileleri_mobil/pages/trainings/traininglist.dart';
import 'package:excel_hileleri_mobil/ui/helper/dialoghelper.dart';
import 'package:excel_hileleri_mobil/ui/helper/text_helper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class AllTrainingsPage extends StatefulWidget {
  const AllTrainingsPage({super.key});

  @override
  State<AllTrainingsPage> createState() => _AllTrainingsPageState();
}

class _AllTrainingsPageState extends State<AllTrainingsPage> {
  bool visibility = false;
  IconData arrow = Icons.arrow_drop_down_circle_rounded;
  IconData arrow2 = Icons.arrow_drop_up_rounded;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: "Excel Eğitimleri"),
      body: Container(
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          color: CustomColors.lightYellow,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 80,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: CustomColors.darkRed,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Yazılı Eğitimler",
                                style: CustomTextStyle.mediumHeader,
                              ),
                              Icon(
                                visibility == false
                                    ? Icons.arrow_drop_down_rounded
                                    : Icons.arrow_drop_up_rounded,
                              ),
                            ],
                          ),
                          Visibility(
                            visible: visibility,
                            child: Column(
                              children: [
                                Text(
                                  TextUtilities.yaziliEgitimAciklama,
                                  style: CustomTextStyle.subtitleText,
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.lock_open_rounded,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: InkWell(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const TraininListPage(
                                                      collection:
                                                          'BookTrainings',
                                                    ))),
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            color: CustomColors.lightYellow,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Temel Seviye Excel\nEğitimleri",
                                                  style: CustomTextStyle
                                                      .smallHeader,
                                                ),
                                              ),
                                              const Expanded(
                                                flex: 1,
                                                child: Icon(
                                                    Icons.arrow_right_rounded),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.lock_outline,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: InkWell(
                                        onTap: () {
                                          DialogHelper().errDialog(context,
                                              TextUtilities.comingSoon);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            color: CustomColors.lightYellow,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Orta Seviye Excel\nEğitimleri",
                                                  style: CustomTextStyle
                                                      .smallHeader
                                                      .copyWith(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              const Expanded(
                                                flex: 1,
                                                child: Icon(
                                                  Icons.arrow_right_rounded,
                                                  color: Colors.grey,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.lock_outline,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: InkWell(
                                        onTap: () {
                                          DialogHelper().errDialog(context,
                                              TextUtilities.comingSoon);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            color: CustomColors.lightYellow,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "İleri Seviye Excel\nEğitimleri",
                                                  style: CustomTextStyle
                                                      .smallHeader
                                                      .copyWith(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              const Expanded(
                                                flex: 1,
                                                child: Icon(
                                                  Icons.arrow_right_rounded,
                                                  color: Colors.grey,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const TraininListPage(
                                  collection: 'VideoTrainings',
                                ))),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: CustomColors.darkRed,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Videolu Eğitimler",
                            style: CustomTextStyle.mediumHeader,
                          ),
                          Text(
                            TextUtilities.videoluEgitimAciklama,
                            style: CustomTextStyle.subtitleText,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_right_rounded)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
