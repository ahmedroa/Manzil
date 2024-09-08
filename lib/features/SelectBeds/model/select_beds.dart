class SelectBedsModel {
  final String topOne;
  final String topTwo;
  final String topThree;
  final String topFour;
  final String topFive;
  final String topSix;
  final String bottomOne;
  final String bottomTwo;
  final String bottomThree;
  final String bottomFour;
  final String bottomFive;
  final String bottomSix;

  SelectBedsModel({
    required this.topOne,
    required this.topTwo,
    required this.topThree,
    required this.topFour,
    required this.topFive,
    required this.topSix,
    required this.bottomOne,
    required this.bottomTwo,
    required this.bottomThree,
    required this.bottomFour,
    required this.bottomFive,
    required this.bottomSix,
  });

  factory SelectBedsModel.fromMap(Map<String, dynamic> map) {
    return SelectBedsModel(
      topOne: map['topOne'] ?? '',
      topTwo: map['topTwo'] ?? '',
      topThree: map['topThree'] ?? '',
      topFour: map['topFour'] ?? '',
      topFive: map['topFive'] ?? '',
      topSix: map['topSix'] ?? '',
      bottomOne: map['bottomOne'] ?? '',
      bottomTwo: map['bottomTwo'] ?? '',
      bottomThree: map['bottomThree'] ?? '',
      bottomFour: map['bottomFour'] ?? '',
      bottomFive: map['bottomFive'] ?? '',
      bottomSix: map['bottomSix'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'topOne': topOne,
      'topTwo': topTwo,
      'topThree': topThree,
      'topFour': topFour,
      'topFive': topFive,
      'topSix': topSix,
      'bottomOne': bottomOne,
      'bottomTwo': bottomTwo,
      'bottomThree': bottomThree,
      'bottomFour': bottomFour,
      'bottomFive': bottomFive,
      'bottomSix': bottomSix,
    };
  }
}
