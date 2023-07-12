import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wedding/future/page/wedding_page.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Приглашение Дарьи и Петра',
      debugShowCheckedModeBanner: false,
      home: WeddingPage(),
    );
  }
}
