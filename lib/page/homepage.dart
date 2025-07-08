import 'package:flutter/material.dart';

import 'package:flutter_train_app/widget/selectbutton.dart';
import 'package:flutter_train_app/page/station_part.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? startStation;
  String? endStation;
  @override
  Widget build(BuildContext context) {
    // String? startStation;
    // String? endStation; 상태가 아닌 지역 변수로 설정 시 다른 위젯으로 이동시 감지를 못함
    return Scaffold(
      appBar: AppBar(title: Text('기차 예매')),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 200,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StationPart(
                    stationtitle: '출발역',
                    onSelected: (value) {
                      {
                        setState(() {
                          startStation = value;
                        });
                      }
                    },
                  ),

                  Container(width: 2, height: 50, color: Colors.grey[400]),
                  StationPart(
                    stationtitle: '도착역',
                    onSelected: (value) {
                      {
                        setState(() {
                          endStation = value; // ✅ 콜백으로 받은 값 저장
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            SeatSelectButton(
              startStation: startStation,
              endStation: endStation,
            ),
          ],
        ),
      ),
    );
  }
}
