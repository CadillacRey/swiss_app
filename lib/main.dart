import 'package:flutter/material.dart';
import 'package:swiss_streaming/colours.dart';
import 'package:swiss_streaming/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SwissStreaming',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
      ),
      home: const HomeScreen(),
    );
  }
}
