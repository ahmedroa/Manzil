class UnitModle {
  final String name;
  final String? id;
  final String? description;
  final String? img;
  // final List<dynamic> features;
  // final List<String>? images;
  final String numbersOfBeds;
  final String numbersOfBathrooms;
  final String propertyArea;
  final int price;
  final String location;

  UnitModle({
    required this.name,
    this.id,
    this.description,
    this.img,
    // required this.features,
    // this.images,
    required this.numbersOfBeds,
    required this.numbersOfBathrooms,
    required this.propertyArea,
    required this.price,
    required this.location,
  });

  factory UnitModle.fromMap(Map<String, dynamic> map) {
    return UnitModle(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      img: map['img'],
      // features: List<dynamic>.from(map['features']),
      // imgs: List<String>.from(map['imgs'] ?? []),
      numbersOfBeds: map['numbersOfBeds'],
      numbersOfBathrooms: map['numbersOfBathrooms'],
      propertyArea: map['propertyArea'],
      price: map['price'],
      location: map['location'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'img': img,
      // 'features': features,
      // 'images': images,
      'numbersOfBeds': numbersOfBeds,
      'numbersOfBathrooms': numbersOfBathrooms,
      'propertyArea': propertyArea,
      'price': price,
      'location': location,
    };
  }
}
