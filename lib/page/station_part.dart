import 'package:flutter/material.dart';
import 'package:flutter_train_app/page/stationpage.dart';

class StationPart extends StatefulWidget {
  final String stationtitle;
  final Function(String?) onSelected;
  const StationPart({
    super.key,
    required this.stationtitle,
    required this.onSelected,
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
        String? selectedStationPage = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                StationPage(stationtitle: widget.stationtitle),
          ),
        );
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
