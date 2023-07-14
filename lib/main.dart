import 'package:excel_hileleri_mobil/auth/enterpage.dart';
import 'package:excel_hileleri_mobil/auth/forgotpassword.dart';
import 'package:excel_hileleri_mobil/auth/login.dart';
import 'package:excel_hileleri_mobil/auth/register.dart';
import 'package:excel_hileleri_mobil/firebase_options.dart';
import 'package:excel_hileleri_mobil/pages/allblogspage.dart';
import 'package:excel_hileleri_mobil/pages/trainings/alltrainings.dart';
import 'package:excel_hileleri_mobil/pages/home/competition.dart';
import 'package:excel_hileleri_mobil/pages/home/keyboardshortcuts.dart';
import 'package:excel_hileleri_mobil/pages/home/mostuseformules.dart';
import 'package:excel_hileleri_mobil/pages/home_page.dart';
import 'package:excel_hileleri_mobil/pages/notes.dart';
import 'package:excel_hileleri_mobil/pages/splashscreen.dart';
import 'package:excel_hileleri_mobil/pages/trainings/traininglist.dart';
import 'package:excel_hileleri_mobil/pages/yapayzeka.dart';
import 'package:excel_hileleri_mobil/services/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final navigatoKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessagingHelper().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excel Hileleri',
      navigatorKey: navigatoKey,
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
          ),
        ),
      ),
      routes: {
        "/": (context) => const SplashScreen(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/forgotpassword": (context) => const ForgotPasswordPage(),
        "/competition": (context) => const CompetitionPage(),
        "/keyboard": (context) => const KeyboardShorcutsPage(),
        "/formulas": (context) => const MostUsedFormulas(),
        "/home": (context) => const HomePage(),
        "/enter": (context) => const EnterPage(),
        "/allblogs": (context) => const AllBlogsPage(),
        "/alltrainings": (context) => const AllTrainingsPage(),
        "/traininglistbook": (context) =>
            const TraininListPage(collection: 'BookTrainings'),
        "/traininglistvideo": (context) =>
            const TraininListPage(collection: 'VideoTrainings'),
        "/ai": (context) => const YapayZekaPage(),
        "/notes": (context) => const MyNotesPage(),
      },
    );
  }
}
