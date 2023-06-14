import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({
    Key? key,
    required this.gender,
    required this.phone,
    required this.name,
    required this.selectedDate,
    required this.user,
  }) : super(key: key);

  final String gender;
  final String phone;
  final String name;
  final DateTime selectedDate;
  final User? user;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DateTime selectedDate = DateTime(1900, 1, 1);
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _name = TextEditingController();
  bool date = false;
  String? uid;

  @override
  void initState() {
    setState(() {
      uid = widget.user?.uid;
      selectedDate = widget.selectedDate;
    });
    super.initState();
  }

  @override
  void dispose() {
    _gender.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Profili Düzenle"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "Abone datamızın eksiksiz ve güncel olması için lütfen bilgileri doldurunuz.",
                style: CustomTextStyle.subtitleText,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Ad Soyad",
                      style: CustomTextStyle.bodyText
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _name,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomColors.lightBlue,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        hintText: widget.name,
                        hintStyle: CustomTextStyle.bodyText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Doğum Tarihi",
                      style: CustomTextStyle.bodyText
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2024),
                        );
                        if (picked != null && picked != selectedDate) {
                          setState(() {
                            selectedDate = picked;
                            date = true;
                          });
                        }
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomColors.lightBlue,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "${selectedDate.toLocal()}".split(" ")[0],
                        hintStyle: CustomTextStyle.bodyText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Cinsiyet",
                      style: CustomTextStyle.bodyText
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _gender,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomColors.lightBlue,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        hintText: widget.gender,
                        hintStyle: CustomTextStyle.bodyText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Telefon",
                      style: CustomTextStyle.bodyText
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _phone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomColors.lightBlue,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        hintText: widget.phone,
                        hintStyle: CustomTextStyle.bodyText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    widget.user!.updateDisplayName(
                        _name.text.isNotEmpty ? _name.text : widget.name);
                    _firestore.collection("Users").doc(uid).update({
                      "birth": date == true
                          ? selectedDate.toString()
                          : widget.selectedDate.toString(),
                      "gender": _gender.text.isNotEmpty
                          ? _gender.text
                          : widget.gender,
                      "phone":
                          _phone.text.isNotEmpty ? _phone.text : widget.phone,
                      "name": _name.text.isNotEmpty ? _name.text : widget.name,
                    });
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Bilgileriniz Güncellendi.")));
                  },
                  child: Text(
                    "Düzenle",
                    style: CustomTextStyle.bodyText,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
