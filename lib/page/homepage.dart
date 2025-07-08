import 'package:flutter/material.dart';
import 'package:flutter_train_app/train_model.dart';

import 'package:flutter_train_app/widget/reservation_check_button.dart';

import 'package:flutter_train_app/widget/selectbutton.dart';
import 'package:flutter_train_app/page/station_part.dart';

//홈페이지 위젯
//이 위젯은 출발역과 도착역을 선택하는 위젯
//출발역과 도착역을 선택한 후 좌석 선택 페이지로 이동하는 역할을 합니다.
//출발역과 도착역이 선택되지 않은 경우에는 경고 다이얼로그를 표시합니다.
class HomePage extends StatefulWidget {
  final List<String>? selectedSeats;
  final StationModel? selectedStation;
  const HomePage({super.key, this.selectedSeats, this.selectedStation});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? startStation;
  String? endStation; // 출발역과 도착역을 상태 변수로 설정
  Train train = Train();

  @override
  Widget build(BuildContext context) {
    // String? startStation;
    // String? endStation; 상태가 아닌 지역 변수로 설정 시 다른 위젯으로 이동시 감지를 못함

    train.addReservation(widget.selectedSeats, widget.selectedStation);

    return Scaffold(
      appBar: AppBar(title: Text('기차 예매')),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 200,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 출발역과 도착역을 선택하는 위젯
                  // StationPart 위젯을 사용하여 출발역과 도착역을 선택
                  //콜배 함수를 통해 선택한 역을 받아와 상태변수에 저장
                  // excludeStation을 통해 선택한 역을 제외한 역 목록을 표시
                  // 도착역 부분 역시 동일
                  StationPart(
                    stationtitle: '출발역',
                    excludeStation: endStation,
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
                    excludeStation: startStation,
                    onSelected: (value) {
                      {
                        setState(() {
                          endStation = value; // 콜백으로 받은 값 저장
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
            SizedBox(height: 20),

            CheckButton(
              reservations: train.reservations,
              // 선택된 역을 totalStations에 추가하는 함수
            ),
          ],
        ),
      ),
    );
  }
}
