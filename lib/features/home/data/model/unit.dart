class UnitModle {
  final String name;
  final String? id;
  final String? description;
  final String? img;
  final String numbersOfBeds;
  final String numbersOfBathrooms;
  final String propertyArea;
  final int price;
  final String location;
  final List<String>? picturesOfUnity;

  UnitModle({
    required this.name,
    this.id,
    this.description,
    this.img,
    required this.numbersOfBeds,
    required this.numbersOfBathrooms,
    required this.propertyArea,
    required this.price,
    required this.location,
    this.picturesOfUnity,
  });

  factory UnitModle.fromMap(Map<String, dynamic> map) {
    return UnitModle(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      img: map['img'],
      numbersOfBeds: map['numbersOfBeds'],
      numbersOfBathrooms: map['numbersOfBathrooms'],
      propertyArea: map['propertyArea'],
      price: map['price'],
      location: map['location'],
      picturesOfUnity: List<String>.from(map['picturesOfUnity'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'img': img,
      'numbersOfBeds': numbersOfBeds,
      'numbersOfBathrooms': numbersOfBathrooms,
      'propertyArea': propertyArea,
      'price': price,
      'location': location,
      'picturesOfUnity': picturesOfUnity,
    };
  }
}
