import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  final String startStaion;
  final String endStation;
  const SeatPage({
    super.key,
    required this.startStaion,
    required this.endStation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('좌석 선택')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                startStaion,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
              Text(
                endStation,
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
        ],
      ),
    );
  }
}
