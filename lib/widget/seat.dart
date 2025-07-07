import 'package:flutter/material.dart';

class Seat extends StatefulWidget {
  const Seat({super.key});

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  bool isSelected = false;
  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
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
