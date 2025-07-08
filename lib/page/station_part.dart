import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/stationpage.dart';

// 출발역과 도착역을 선택하는 위젯
// 이 위젯은 출발역과 도착역을 선택할 수 있는 위젯입니다.
// 역을 선택할 수 있는 페이지로 이동하며, 아무것도 안하고 뒤로 가면 선택으로 다시 출력
class StationPart extends StatefulWidget {
  final String stationtitle;
  final Function(String?) onSelected;
  final String? excludeStation;
  const StationPart({
    super.key,
    required this.stationtitle,
    required this.onSelected,
    this.excludeStation,
  });

  @override
  State<StationPart> createState() => _StationPartState();
}

class _StationPartState extends State<StationPart> {
  String? selectedStation;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // 역 선택 페이지로 이동하여 선택된 역을 가져옵니다.
        //비동기로 구현했으면 선택된 값이 나올때까지 기다려 값을 저장
        String? selectedStationPage = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StationPage(
              stationtitle: widget.stationtitle,
              excludeStation: widget.excludeStation,
            ),
          ),
        );
        //값에 따라 처리하고 콜백함수를 통해 부모 위젯에게 해당 값을 전달
        if (selectedStationPage != null) {
          setState(() {
            selectedStation = selectedStationPage;
          });
          widget.onSelected(selectedStationPage);
        } else {
          setState(() {
            selectedStation = null;
          });
          widget.onSelected(null);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.stationtitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Text(selectedStation ?? '선택', style: TextStyle(fontSize: 40)),
        ],
      ),
    );
  }
}
