import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/homepage.dart';

class ReservationButton extends StatelessWidget {
  final List<String> selectedSeats;
  const ReservationButton({super.key, required this.selectedSeats});

  @override
  Widget build(BuildContext context) {
    final sortedSeats = selectedSeats.toList()..sort();
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: const Text(
                  '예매 확인',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                content: Text(
                  sortedSeats.isEmpty
                      ? '선택된 좌석이 없습니다.'
                      : // 선택된 좌석이 없을 때 메시지
                        '선택한 좌석: ${sortedSeats.join(', ')}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),

                // 선택된 좌석을 보여주는 메시지
                actions: [
                  CupertinoDialogAction(
                    isDestructiveAction: true, // 취소 버튼을 강조
                    child: const Text('취소'),
                    onPressed: () {
                      Navigator.of(context).pop(); // 다이얼로그만 닫기
                    },
                  ),
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ), // 홈 페이지로 이동
                        (route) => false, // 이전 페이지 모두 제거
                        //물론 pop 두번도 가능하지만 자유도면을 고려하여 선택
                      );
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          '예매 하기',
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
