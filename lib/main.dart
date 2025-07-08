import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter train app',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),

        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
