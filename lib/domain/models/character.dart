import '../../core/api/mappers/ui_model.dart';
import '../../data/models/character_dto.dart';
import '../enums/gender.dart';

class Character extends UIModel {
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

  Character({
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

  Character copyWith({
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
    return Character(
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
  CharacterDto toDto() => CharacterDto(
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
