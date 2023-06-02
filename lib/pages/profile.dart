import 'package:excel_hileleri_mobil/ui/widgets/adsappbar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AdsAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(child: Image.asset("assets/comingsoon.png")),
            const Expanded(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text("data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
