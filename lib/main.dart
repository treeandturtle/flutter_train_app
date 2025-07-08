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
          seedColor: Colors.white, // 시드 컬러
          brightness: Brightness.light,
          primary: Colors.blue, // cupartino 확인 버튼 주요 버튼 강조 색상
          primaryContainer: Colors.white, //출발 도착 역 컨테이너 색상
        ),
        scaffoldBackgroundColor: Colors.grey[200], //배경색 설정
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black38,
          primary: Colors.blue, // cupartino 확인 버튼 주요 버튼 강조 색상
          surface: Colors.black38, //다크모드 앱바 색상

          primaryContainer: Colors.grey[800], //다크모드 출발 도착 역 컨테이너 색상

          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.black38, //다크모드 배경색 설정

        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
