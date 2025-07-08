import 'package:flutter/material.dart';

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
