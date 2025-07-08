import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/seatpage.dart';

class SeatSelectButton extends StatelessWidget {
  String? startStation;
  String? endStation;
  SeatSelectButton({
    super.key,
    required this.startStation,
    required this.endStation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          if (startStation == null || endStation == null) {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text(
                    '역 선택 오류',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  content: const Text(
                    '출발역과 도착역을 모두 선택해주세요.',
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SeatPage(
                  startStaion: startStation ?? '출발역',
                  endStation: endStation ?? '도착역 ',
                ),
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
          '좌석 선택',
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
