class CurrentrReservationsModel {
  final int numberOfReservations;
  final int numberOfBeds;
  final String checkIn;
  final String checkOut;
  final String unit;

  CurrentrReservationsModel({
    required this.numberOfReservations,
    required this.numberOfBeds,
    required this.checkIn,
    required this.checkOut,
    required this.unit,
  });
  factory CurrentrReservationsModel.fromMap(Map<String, dynamic> map) {
    return CurrentrReservationsModel(
      numberOfReservations: map['numberOfReservations'],
      numberOfBeds: map['numberOfBeds'],
      checkIn: map['checkIn'],
      checkOut: map['checkOut'],
      unit: map['unit'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'numberOfReservations': numberOfReservations,
      'numberOfBeds': numberOfBeds,
      'checkIn': checkIn,
      'checkOut': checkOut,
      'unit': unit,
    };
  }
}
