import 'package:flutter/material.dart';
import 'package:flutter_train_app/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter train app',
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
