import 'package:flutter/material.dart';
import 'package:flutter_train_app/widget/seat.dart';

class Seatline extends StatefulWidget {
  final Function(List<String>) seats;
  const Seatline({super.key, required this.seats});

  @override
  State<Seatline> createState() => _SeatlineState();
}

class _SeatlineState extends State<Seatline> {
  // 선택된 좌석은 ["A-1", "B-3", "C-5"] 형태로 저장!
  List<String> selectedSeats = [];

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
