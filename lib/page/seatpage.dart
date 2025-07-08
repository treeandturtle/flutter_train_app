import 'package:flutter/material.dart';
import 'package:flutter_train_app/widget/reservation_button.dart';
import 'package:flutter_train_app/widget/seatline.dart';

// 좌석 선택 페이지
// 이 페이지는 출발역과 도착역을 선택한 후 좌석을 선택하는 페이지입니다.
// 좌석은 A-1, B-3, C-5 형태로 저장되며,
// 좌석 선택 시 선택된 좌석을 List<String> 형태로 반환합니다.
class SeatPage extends StatefulWidget {
  final String startStaion;
  final String endStation;
  const SeatPage({
    super.key,
    required this.startStaion,
    required this.endStation,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  List<String> selectedSeats = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('좌석 선택')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.startStaion,
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_circle_right_outlined, size: 30),
                Text(
                  widget.endStation,
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.purple,
                  ),
                ),
                SizedBox(width: 4),
                Text('선택됨'),
                SizedBox(width: 20),
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(width: 4),
                Text('선택안됨'),
              ],
            ),
            // list.builder를 사용하여 좌석 선택 UI를 구현
            //expanded 위젯을 사용하여 오버플로우를 방지
            // Seatline 위젯을 사용하여 좌석 선택 UI를 구현
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Seatline(
                  seats: (seats) {
                    setState(() {
                      selectedSeats = seats;
                    });
                  },
                ),
              ),
            ),
            // 예약하기 버튼 위젯을 사용하여 선택된 좌석을 보여주고 예매를 확인하는 다이얼로그를 표시
            // 예매 확인 후 홈 페이지로 이동합니다.
            ReservationButton(selectedSeats: selectedSeats),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
