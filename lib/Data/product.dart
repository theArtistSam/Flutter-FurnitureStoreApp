import 'dart:ui';

class Product{

  String name;
  String picture;
  int price;
  List<Color> colorPalette;
  bool isFavourite;
  
  Product({
    required this.name,
    required this.picture,
    required this.price,
    required this.colorPalette,
    required this.isFavourite
  });
}