import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/reservation_page.dart';

import 'package:flutter_train_app/train_model.dart';

//출발역과 도착역이 정해지면 좌석을 선택하는 버튼 위젯
//이 위젯은 출발역과 도착역을 선택한 후 좌석 선택 페이지로 이동하는 역할을 합니다.
//출발역과 도착역이 선택되지 않은 경우에는 경고 다이얼로그를 표시합니다.

class CheckButton extends StatelessWidget {
  final List<ReservationModel> reservations;

  const CheckButton({super.key, required this.reservations});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          if (reservations.isEmpty) {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text(
                    '예매 오류',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  content: const Text(
                    '예매를 하지 않았습니다!!.',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('확인'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            //사실상 눌 처리는 필요없지만 혹시 몰라 추가
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    ReservationPage(reservations: reservations),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          '예매 내역 확인',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
