import 'package:flutter/material.dart';
import 'package:flutter_train_app/widget/seat.dart';

class Seatline extends StatefulWidget {
  const Seatline({super.key});

  @override
  State<Seatline> createState() => _SeatlineState();
}

class _SeatlineState extends State<Seatline> {
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
                Seat(),
                SizedBox(width: 4),
                Seat(),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text('$index ', style: TextStyle(fontSize: 18)),
                  ),
                ),
                Seat(),
                SizedBox(width: 4),
                Seat(),
              ],
            ),
          );
        }
      },
    );
  }
}
