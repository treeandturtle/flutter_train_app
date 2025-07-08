class Train {
  static final Train _instance = Train._internal();

  // 팩토리 생성자: 항상 같은 인스턴스를 반환
  factory Train() {
    return _instance;
  }

  // 내부 생성자: 외부에서 호출 불가
  Train._internal();
  //전체 역 모델
  List<String> stations = [
    "수서",
    "동탄",
    "평택지제",
    "천안아산",
    "오송",
    "대전",
    "김천구미",
    "동대구",
    "경주",
    "울산",
    "부산",
  ];

  List<ReservationModel> reservations = [];

  void addReservation(
    List<String>? selectedSeats,
    StationModel? selectedStation,
  ) {
    if (selectedStation == null ||
        selectedSeats == null ||
        selectedSeats.isEmpty) {
      return;
    }

    bool exists = reservations.any(
      (reservation) =>
          reservation.stationModel.startStation ==
              selectedStation.startStation &&
          reservation.stationModel.endStation == selectedStation.endStation &&
          _listsAreEqual(reservation.selectedSeats, selectedSeats),
    );

    if (!exists) {
      reservations.add(
        ReservationModel(
          stationModel: selectedStation,
          selectedSeats: selectedSeats,
        ),
      );
    }
  }

  bool _listsAreEqual(List<String> a, List<String> b) {
    return Set.of(a).containsAll(b) && Set.of(b).containsAll(a);
  }
}

//   List<ReservationModel> reservations = [];
//   void addReservation(
//     List<String>? selectedSeats,
//     StationModel? selectedStation,
//   ) {
//     if (selectedStation == null ||
//         selectedSeats == null ||
//         selectedSeats.isEmpty) {
//     } else {
//       reservations.add(
//         ReservationModel(
//           stationModel: selectedStation,
//           selectedSeats: selectedSeats,
//         ),
//       );
//     }
//   }
// }

class StationModel {
  String startStation;
  String endStation;

  StationModel({required this.startStation, required this.endStation});
}

class ReservationModel {
  StationModel stationModel;
  List<String> selectedSeats;

  ReservationModel({required this.stationModel, required this.selectedSeats});
}
