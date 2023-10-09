class PlaceModel {
  String name;
  String image;
  double rating;

  PlaceModel({
    required this.name,
    required this.image,
    this.rating = 3.5,
  });
}

var places = [
  PlaceModel(name: "Mega Mall Batam Center", image: "megamall.png"),
  PlaceModel(name: "Mega Mall Batam Center", image: "megamall.png"),
  PlaceModel(name: "Mega Mall Batam Center", image: "megamall.png"),

];
