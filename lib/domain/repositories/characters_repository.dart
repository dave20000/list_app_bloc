// import '../../presentation/bloc/characters/characters_state.dart';
import '../../presentation/bloc/dwarves/dwarves_state.dart';
import '../../presentation/bloc/elves/elves_state.dart';
import '../../presentation/bloc/hobbits/hobbits_state.dart';
import '../../presentation/bloc/humans/humans_state.dart';
import '../models/character.dart';

abstract class CharactersRepository {
  // Future<CharactersState> getCharacters({
  //   required int page,
  //   required Race race,
  // });
  Future<HumansState> getHumans({
    required int page,
  });
  Future<DwarvesState> getDwarves({
    required int page,
  });
  Future<HobbitsState> getHobbits({
    required int page,
  });
  Future<ElvesState> getElves({
    required int page,
  });
  Future<Character?> getCharacterById(String id);
}
