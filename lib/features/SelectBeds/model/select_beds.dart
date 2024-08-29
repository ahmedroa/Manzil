class SelectBeds {
  final bool oneBed;
  final bool twoBed;
  final bool threeBed;
  final bool fourBed;
  final bool fiveBed;
  final bool sixBed;

  SelectBeds(
      {required this.oneBed,
      required this.twoBed,
      required this.threeBed,
      required this.fourBed,
      required this.fiveBed,
      required this.sixBed});

  factory SelectBeds.fromMap(Map<String, dynamic> map) {
    return SelectBeds(
      oneBed: map['oneBed'],
      twoBed: map['twoBed'],
      threeBed: map['threeBed'],
      fourBed: map['fourBed'],
      fiveBed: map['fiveBed'],
      sixBed: map['sixBed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'oneBed': oneBed,
      'twoBed': twoBed,
      'threeBed': threeBed,
      'fourBed': fourBed,
      'fiveBed': fiveBed,
      'sixBed': sixBed,
    };
  }
}
