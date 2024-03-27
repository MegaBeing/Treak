import 'package:flutter/material.dart';
import 'package:treak/Screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2b2b2b)),
        useMaterial3: true,
      ),
      home: const ProviderScope(child: HomeScreen()),
    );
  }
}


