import 'package:flutter/material.dart';
import 'package:flutter_train_app/widget/reservation_button.dart';
import 'package:flutter_train_app/widget/seatline.dart';

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
            ReservationButton(selectedSeats: selectedSeats),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
