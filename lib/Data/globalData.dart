import 'package:flutter/material.dart';
import 'package:furniture_app/Data/product.dart';

List<Product> products = [
  // Adding Prodcuts
  Product(
    name: "Room Sofa",
    picture: "sofa",
    price: 2500,
    colorPalette: [const Color(0xFF7993AE), const Color(0xFF282828), const Color(0xFFC9A885)],
    isFavourite: true
  ),

  Product(
    name: "Toshiba Tv",
    picture: "tv",
    price: 35250,
    colorPalette: [const Color(0xFF414142), const Color(0xFF717172), const Color(0xFF282828)],
    isFavourite: false
  ),
  
  Product(
    name: "Table Lamp",
    picture: "lamp",
    price: 550,
    colorPalette: [const Color(0xFF323232), const Color(0xFFC9A885), const Color(0xFFA05A3F)],
    isFavourite: false
  ),

  Product(
    name: "Wood Table",
    picture: "table",
    price: 905,
    colorPalette: [const Color(0xFF947146), const Color(0xFFC9A885), const Color(0xFF282828)],
    isFavourite: true
  )


];

List<String> suggestions = ["sofa", "tv", "lamp"];