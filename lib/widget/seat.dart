import 'package:flutter/material.dart';

// 좌석 선택 페이지에서 좌석에 해당하는 위젯
// 좌석의 선택과 해제를 관리하며 UI를 업데이트합니다.
// col,row를 통해 좌석의 위치를 지정하고,
// onSelected 콜백을 통해 선택된 좌석 정보를 전달합니다.
class Seat extends StatefulWidget {
  final String col; // A~D
  final int row; // 1~20
  final Function(String col, int row, bool isSelected) onSelected;
  const Seat({
    super.key,
    required this.col,
    required this.row,
    required this.onSelected,
  });

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  bool isSelected = false;
  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.onSelected(widget.col, widget.row, isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSelection,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.purple : Colors.grey[300],
        ),
      ),
    );
  }
}
