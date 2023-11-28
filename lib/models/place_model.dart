class PlaceModel {
  String name;
  String image;
  double rating;

  PlaceModel({
    required this.name,
    required this.image,
    this.rating = 5,
  });
}

var places = [
  PlaceModel(name: "Mega Mall Batam Center1", image: "megamall.png"),
  PlaceModel(name: "Mega Mall Batam Center2", image: "megamall.png"),
  PlaceModel(name: "Mega Mall Batam Center3", image: "megamall.png"),

];
