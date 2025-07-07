import 'package:flutter/material.dart';
import 'package:flutter_train_app/selectbutton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('기차 예매')),
      backgroundColor: Colors.grey[200],
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
                  StationPart(stationtitle: '출발역', stationname: '선택'),

                  Container(width: 2, height: 50, color: Colors.grey[400]),
                  StationPart(stationtitle: '도착역', stationname: '선택'),
                ],
              ),
            ),
            SizedBox(height: 20),
            SeatSelectButton(),
          ],
        ),
      ),
    );
  }
}

class StationPart extends StatelessWidget {
  final String stationname;
  final String stationtitle;
  const StationPart({
    super.key,
    required this.stationname,
    required this.stationtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          stationtitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Text(stationname, style: TextStyle(fontSize: 40)),
      ],
    );
  }
}
