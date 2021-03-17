import 'package:flutter/material.dart';
import 'package:flutter_app/configs/colors.dart';

Color colorFromType(dynamic data){
  Color color = getColor(data?.first?.toLowerCase()) ?? Colors.white;
  return color;
}

Color getColor(String val) {
  switch (val) {
    case "grass":
      return PokedexColors.lightGreen;

    case "bug":
      return PokedexColors.lightTeal;

    case "fire":
      return PokedexColors.lightRed;

    case "water":
      return PokedexColors.lightBlue;

    case "fighting":
      return PokedexColors.red;

    case "normal":
      return PokedexColors.beige;

    case "electric":
      return PokedexColors.lightYellow;

    case "psychic":
      return PokedexColors.lightPink;

    case "poison":
      return PokedexColors.lightPurple;

    case "ghost":
      return PokedexColors.purple;

    case "ground":
      return PokedexColors.darkBrown;

    case "rock":
      return PokedexColors.lightBrown;

    case "dark":
      return PokedexColors.black;

    case "dragon":
      return PokedexColors.violet;

    case "fairy":
      return PokedexColors.pink;

    case "flying":
      return PokedexColors.lilac;

    case "ice":
      return PokedexColors.lightCyan;

    case "steel":
      return PokedexColors.grey;

    default:
      return Colors.white;
  }
}