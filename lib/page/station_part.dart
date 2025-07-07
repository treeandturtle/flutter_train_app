import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/stationpage.dart';

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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StationPage(stationtitle: stationtitle),
          ),
        );
      },
      child: Column(
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
      ),
    );
  }
}
