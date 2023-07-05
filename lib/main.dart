import 'package:flutter/material.dart';
import 'package:wedding/future/page/wedding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // textTheme: GoogleFonts.lobsterTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        primarySwatch: Colors.blue,
      ),
      home: const WeddingPage(),
    );
  }
}
//