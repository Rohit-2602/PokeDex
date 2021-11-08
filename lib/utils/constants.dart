import 'dart:ui';

class Constants {
  static Color creamColor = const Color(0xfff5f5f5);
}

const Map<String, Color> pokemonTypeMap = {
  "grass": Color(0xFF78C850),
  "poison": Color(0xFF98558e),
  "fire": Color(0xFFFB6C6C),
  "flying": Color(0xFFA890F0),
  "bug": Color(0xFF48D0B0),
  "water": Color(0xFF7AC7FF),
  "normal": Color(0xFFbcbcad),
  "ground": Color(0xFFeece5a),
  "fairy": Color(0xFFf9acff),
  "electric": Color(0xFFfee53c),
  "fighting": Color(0xFFa75544),
  "psychic": Color(0xFFf160aa),
  "rock": Color(0xFFcebd74),
  "steel": Color(0xFFc4c2db),
  "ice": Color(0xFF96f1ff),
  "ghost": Color(0xFF7C538C),
  "dragon": Color(0xD07038F8),
  "dark": Color(0xFF8f6955),
};

Color getBackGroundColor(String type) {
  return pokemonTypeMap[type]!;
}
