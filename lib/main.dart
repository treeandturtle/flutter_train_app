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

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
          primaryContainer: Colors.white,
          onPrimaryContainer: Colors.white,
          primary: Colors.blue,
          onPrimary: Colors.blue,
        ),
        scaffoldBackgroundColor: Colors.grey[200],
        focusColor: Colors.red,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black38,
          primary: Colors.blue,
          surface: Colors.black38,

          primaryContainer: Colors.grey[800],

          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.black38,

        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
