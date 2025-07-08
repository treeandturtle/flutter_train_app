import 'package:flutter/material.dart';
import 'package:flutter_train_app/train_model.dart';

// 출발역과 도착역을 선택하는 페이지
// 이 페이지는 출발역과 도착역을 선택할 수 있는 페이지입니다.
// 출발역과 도착역을 선택하면 해당 역의 좌석을 선택할 수 있는 페이지로 이동합니다.
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
    // excludeStation이 null이 아니면 해당 역을 제외한 역 목록을 필터링합니다.
    // excludeStation이 null이면 모든 역을 표시합니다.
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
