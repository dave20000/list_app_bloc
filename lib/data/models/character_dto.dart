import '../../core/api/mappers/to_json.dart';
import '../../domain/enums/gender.dart';
import '../../domain/models/character.dart';

class CharacterDto extends ToJson {
  final String birth;
  final String death;
  final Gender gender;
  final String hair;
  final String height;
  final String id;
  final String name;
  final String race;
  final String realm;
  final String spouse;
  final String wikiUrl;

  CharacterDto({
    required this.birth,
    required this.death,
    required this.gender,
    required this.hair,
    required this.height,
    required this.id,
    required this.name,
    required this.race,
    required this.realm,
    required this.spouse,
    required this.wikiUrl,
  });

  CharacterDto copyWith({
    String? birth,
    String? death,
    Gender? gender,
    String? hair,
    String? height,
    String? id,
    String? name,
    String? race,
    String? realm,
    String? spouse,
    String? wikiUrl,
  }) {
    return CharacterDto(
      birth: birth ?? this.birth,
      death: death ?? this.death,
      gender: gender ?? this.gender,
      hair: hair ?? this.hair,
      height: height ?? this.height,
      id: id ?? this.id,
      name: name ?? this.name,
      race: race ?? this.race,
      realm: realm ?? this.realm,
      spouse: spouse ?? this.spouse,
      wikiUrl: wikiUrl ?? this.wikiUrl,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'birth': birth,
      'death': death,
      'gender': gender.name,
      'hair': hair,
      'height': height,
      '_id': id,
      'name': name,
      'race': race,
      'realm': realm,
      'spouse': spouse,
      'wikiUrl': wikiUrl,
    };
  }

  factory CharacterDto.fromJson(Map<String, dynamic> map) {
    return CharacterDto(
      birth: map['birth'] ?? '',
      death: map['death'] ?? '',
      gender: Gender.values.singleWhere(
        (element) => element.name == map['gender'],
        orElse: () => Gender.EMPTY,
      ),
      hair: map['hair'] ?? '',
      height: map['height'] ?? '',
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      race: map['race'] ?? '',
      realm: map['realm'] ?? '',
      spouse: map['spouse'] ?? '',
      wikiUrl: map['wikiUrl'] ?? '',
    );
  }

  @override
  String toString() {
    return 'CharacterDto(birth: $birth, death: $death, gender: $gender, hair: $hair, height: $height, id: $id, name: $name, race: $race, realm: $realm, spouse: $spouse, wikiUrl: $wikiUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharacterDto &&
        other.birth == birth &&
        other.death == death &&
        other.gender == gender &&
        other.hair == hair &&
        other.height == height &&
        other.id == id &&
        other.name == name &&
        other.race == race &&
        other.realm == realm &&
        other.spouse == spouse &&
        other.wikiUrl == wikiUrl;
  }

  @override
  int get hashCode {
    return birth.hashCode ^
        death.hashCode ^
        gender.hashCode ^
        hair.hashCode ^
        height.hashCode ^
        id.hashCode ^
        name.hashCode ^
        race.hashCode ^
        realm.hashCode ^
        spouse.hashCode ^
        wikiUrl.hashCode;
  }

  @override
  Character toModel() => Character(
        birth: birth,
        death: death,
        gender: gender,
        hair: hair,
        height: height,
        id: id,
        name: name,
        race: race,
        realm: realm,
        spouse: spouse,
        wikiUrl: wikiUrl,
      );
}
