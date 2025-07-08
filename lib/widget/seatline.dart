import 'package:flutter/material.dart';
import 'package:flutter_train_app/widget/seat.dart';

// 좌석 선택 페이지에서 좌석을 선택하는 위젯
// 좌석은 A-1, B-3, C-5 형태로 저장되며,
// 좌석 선택 시 선택된 좌석을 List<String> 형태로 반환합니다.
class Seatline extends StatefulWidget {
  final Function(List<String>) seats;
  const Seatline({super.key, required this.seats});

  @override
  State<Seatline> createState() => _SeatlineState();
}

class _SeatlineState extends State<Seatline> {
  // 선택된 좌석은 ["A-1", "B-3", "C-5"] 형태로 저장!
  List<String> selectedSeats = [];

  // 좌석 선택 시 호출되는 함수
  // 선택된 좌석을 List<String> 형태로 반환합니다.
  //좌석을 추가 및 삭제 하는 함수
  void handleSeatSelected(String col, int row, bool isSelected) {
    final seatId = '$col-$row';

    setState(() {
      if (isSelected) {
        selectedSeats.add(seatId);
      } else {
        selectedSeats.remove(seatId);
      }
    });
    widget.seats(selectedSeats);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 21,
      // 첫 번째 행은 A, B, C, D 열의 헤더로 사용
      // 나머지 행은 좌석 선택을 위한 행으로 사용
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 20,
                child: Text(
                  'A',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 4),
              SizedBox(
                width: 50,
                height: 20,
                child: Text(
                  'B',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 50, height: 50),
              SizedBox(
                width: 50,
                height: 20,
                child: Text(
                  'C',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 4),
              SizedBox(
                width: 50,
                height: 20,
                child: Text(
                  'D',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Seat(col: 'A', row: index, onSelected: handleSeatSelected),
                SizedBox(width: 4),
                Seat(col: 'B', row: index, onSelected: handleSeatSelected),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text('$index ', style: TextStyle(fontSize: 18)),
                  ),
                ),
                Seat(col: 'C', row: index, onSelected: handleSeatSelected),
                SizedBox(width: 4),
                Seat(col: 'D', row: index, onSelected: handleSeatSelected),
              ],
            ),
          );
        }
      },
    );
  }
}
