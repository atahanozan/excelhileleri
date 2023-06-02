import 'package:excel_hileleri_mobil/auth/login.dart';
import 'package:excel_hileleri_mobil/auth/register.dart';
import 'package:excel_hileleri_mobil/firebase_options.dart';
import 'package:excel_hileleri_mobil/pages/about_us.dart';
import 'package:excel_hileleri_mobil/pages/home/chatwithteacher.dart';
import 'package:excel_hileleri_mobil/pages/home/competition.dart';
import 'package:excel_hileleri_mobil/pages/home/keyboardshortcuts.dart';
import 'package:excel_hileleri_mobil/pages/home/mostuseformules.dart';
import 'package:excel_hileleri_mobil/pages/home_page.dart';
import 'package:excel_hileleri_mobil/pages/mainpage.dart';
import 'package:excel_hileleri_mobil/pages/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excel Hileleri',
      theme: ThemeData.light().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            backgroundColor: const Color(0xffFF763D),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fixedSize: const Size.fromWidth(200),
          ),
        ),
      ),
      routes: {
        "/": (context) => const SplashScreen(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/chat": (context) => const ChatWithTeacherPage(),
        "/competition": (context) => const CompetitionPage(),
        "/keyboard": (context) => const KeyboardShorcutsPage(),
        "/formulas": (context) => MostUsedFormulas(),
        "/aboutus": (context) => const AboutUssSection(),
        "/home": (context) => const HomePage(),
        "/main": (context) => const MainPage(),
      },
    );
  }
}
