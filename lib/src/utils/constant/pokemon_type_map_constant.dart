import 'dart:ui';

const Map<String, Color> pokemonTypeMapConstant = {
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

const Map<String, Color> pokemonTypeMapConstant2 = {
  "grass": Color.fromARGB(255, 180, 233, 156),
  "poison": Color.fromARGB(255, 218, 129, 203),
  "fire": Color.fromARGB(255, 248, 135, 135),
  "flying": Color.fromARGB(255, 164, 136, 247),
  "bug": Color.fromARGB(255, 89, 245, 208),
  "water": Color.fromARGB(255, 162, 214, 252),
  "normal": Color.fromARGB(255, 236, 236, 147),
  "ground": Color.fromARGB(255, 245, 227, 162),
  "fairy": Color.fromARGB(255, 243, 143, 250),
  "electric": Color.fromARGB(255, 248, 241, 197),
  "fighting": Color.fromARGB(255, 250, 113, 85),
  "psychic": Color.fromARGB(255, 240, 153, 198),
  "rock": Color.fromARGB(255, 236, 198, 29),
  "steel": Color.fromARGB(255, 140, 133, 241),
  "ice": Color.fromARGB(255, 101, 224, 243),
  "ghost": Color.fromARGB(255, 176, 19, 238),
  "dragon": Color.fromARGB(208, 146, 102, 247),
  "dark": Color.fromARGB(255, 243, 115, 42),
};

Color getBackGroundColor(String type) {
  return pokemonTypeMapConstant[type] ?? const Color(0xFF78C850);
}

Color getBackGroundColor2(String type) {
  return pokemonTypeMapConstant2[type] ??
      const Color.fromARGB(255, 142, 199, 114);
}
