class PastReservationsModel {
  final int numberOfReservations;
  final int numberOfBeds;
  final String checkIn;
  final String checkOut;
  final String unit;

  PastReservationsModel({
    required this.numberOfReservations,
    required this.numberOfBeds,
    required this.checkIn,
    required this.checkOut,
    required this.unit,
  });
  factory PastReservationsModel.fromMap(Map<String, dynamic> map) {
    return PastReservationsModel(
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



  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  // factory ReservationsModel.fromJson(Map<String, dynamic> json) => _$ReservationsModelFromJson(json);

  // /// Connect the generated [_$ReservationsModelToJson] function to the `toJson` method.
  // Map<String, dynamic> toJson() => _$ReservationsModelToJson(this);

