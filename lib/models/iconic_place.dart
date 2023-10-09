class IconicPlaceModel {
  String name;
  String image;
  double rating;

  IconicPlaceModel({
    required this.name,
    required this.image,
    this.rating = 4.5,
  });
}

var iconicplaces = [
  IconicPlaceModel(name: "Barelang Bridge", image: "jembatan1.jpeg"),
  IconicPlaceModel(name: "Barelang Bridge", image: "jembatan1.jpeg"),
  IconicPlaceModel(name: "Barelang Bridge", image: "jembatan1.jpeg"),
];
