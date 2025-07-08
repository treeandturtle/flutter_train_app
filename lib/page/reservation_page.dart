import 'package:flutter/material.dart';
import 'package:flutter_train_app/train_model.dart';

class ReservationPage extends StatelessWidget {
  final List<ReservationModel> reservations;
  const ReservationPage({super.key, required this.reservations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('예매 확인')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '예매 정보',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: reservations.length,
                itemBuilder: (context, index) {
                  final reservation = reservations[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('출발역: ${reservation.stationModel.startStation}'),
                          Text('도착역: ${reservation.stationModel.endStation}'),
                          Text('좌석: ${reservation.selectedSeats.join(', ')}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
