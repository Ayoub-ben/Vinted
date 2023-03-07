import 'package:flutter/material.dart';
import 'package:vinted/ProfilPage.dart';
import 'package:vinted/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'AchatPage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.orange,
      ),
      home: AchatPage(),//ProfilePage( documentId: 'sxKEpnL884R4FiE8Nq55'),
    );
  }
}

