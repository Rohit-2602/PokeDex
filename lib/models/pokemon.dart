class Pokemon {
  int id;
  int height;
  String name;
  List<Stats> stats;
  List<Types> types;
  int weight;

  Pokemon(this.id, this.height, this.name, this.stats, this.types, this.weight);

  String get imageUrl {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
  }

  Pokemon copyWith({
    int? id,
    int? height,
    String? name,
    List<Stats>? stats,
    List<Types>? types,
    int? weight,
  }) {
    return Pokemon(
      id ?? this.id,
      height ?? this.height,
      name ?? this.name,
      stats ?? this.stats,
      types ?? this.types,
      weight ?? this.weight,
    );
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      map['id'],
      map['height'],
      map['name'],
      List<Stats>.from(map['stats']?.map((x) => Stats.fromMap(x))),
      List<Types>.from(map['types']?.map((x) => Types.fromMap(x))),
      map['weight'],
    );
  }
}

class Stats {
  int stat;
  String name;

  Stats({
    required this.stat,
    required this.name,
  });

  Stats copyWith({
    int? stat,
    String? name,
  }) {
    return Stats(
      stat: stat ?? this.stat,
      name: name ?? this.name,
    );
  }

  factory Stats.fromMap(Map<String, dynamic> map) {
    int stat = map['base_stat'];
    String name = map['stat']['name'];
    if (name == "hp") {
      return Stats(stat: stat, name: "HP ");
    } else if (name == "attack") {
      return Stats(stat: stat, name: "ATK");
    } else if (name == "defense") {
      return Stats(stat: stat, name: "DEF");
    } else if (name == "special-attack") {
      return Stats(stat: stat, name: "STK");
    } else if (name == "special-defense") {
      return Stats(stat: stat, name: "SEF");
    } else if (name == "speed") {
      return Stats(stat: stat, name: "SPD");
    } else {
      return Stats(stat: stat, name: name);
    }
  }
}

class Types {
  String types;
  Types({
    required this.types,
  });

  Types copyWith({
    String? types,
  }) {
    return Types(
      types: types ?? this.types,
    );
  }

  factory Types.fromMap(Map<String, dynamic> map) {
    return Types(
      types: map['type']['name'],
    );
  }
}
