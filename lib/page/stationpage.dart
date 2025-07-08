import 'package:flutter/material.dart';
import 'package:flutter_train_app/train_model.dart';

class StationPage extends StatelessWidget {
  final String stationtitle;
  final String? excludeStation;

  const StationPage({
    super.key,
    required this.stationtitle,
    this.excludeStation,
  });

  @override
  Widget build(BuildContext context) {
    Train train = Train();
    final List<String> filteredStations = train.stations
        .where((station) => station != excludeStation)
        .toList();
    return Scaffold(
      appBar: AppBar(title: Text(stationtitle)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: filteredStations.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop(filteredStations[index]);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[300]!,
                      width: 1,
                    ), // 아래 경계선
                  ),
                ),
                child: Text(
                  filteredStations[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
