import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../../core/api/api_manager.dart';
import '../../core/extensions.dart';
import '../../domain/enums/race.dart';
import '../../domain/models/character.dart';
import '../../domain/repositories/characters_repository.dart';
// import '../../presentation/bloc/characters/characters_state.dart';
import '../../presentation/bloc/dwarves/dwarves_state.dart';
import '../../presentation/bloc/elves/elves_state.dart';
import '../../presentation/bloc/hobbits/hobbits_state.dart';
import '../../presentation/bloc/humans/humans_state.dart';
import '../models/character_dto.dart';

@Injectable(as: CharactersRepository)
class CharactersRepositoryImpl implements CharactersRepository {
  final ApiManager _apiManager;

  CharactersRepositoryImpl(this._apiManager);

  // @override
  // Future<CharactersState> getCharacters({
  //   required int page,
  //   required Race race,
  // }) async {
  //   final apiBaseResponse = await _apiManager.getAsync<CharacterDto>(
  //     endpoint: "character",
  //     queryParams: {
  //       "race": race.name.capitalize(),
  //       "page": page,
  //       "limit": 10,
  //     },
  //   );
  //   await Future.delayed(const Duration(seconds: 1));
  //   return apiBaseResponse.when(
  //     success: (data) {
  //       log("Get Characters Api Called=> Page: $page, Race: ${race.name}");
  //       switch (race) {
  //         case Race.human:
  //           return CharactersState.fetchedHumans(
  //             data.docs.map((e) => e.toModel()).toList(),
  //             page >= data.pages,
  //           );
  //         case Race.elf:
  //           return CharactersState.fetchedElves(
  //             data.docs.map((e) => e.toModel()).toList(),
  //             page >= data.pages,
  //           );
  //         case Race.dwarf:
  //           return CharactersState.fetchedDwarves(
  //             data.docs.map((e) => e.toModel()).toList(),
  //             page >= data.pages,
  //           );
  //         case Race.hobbit:
  //           return CharactersState.fetchedHobbits(
  //             data.docs.map((e) => e.toModel()).toList(),
  //             page >= data.pages,
  //           );
  //       }
  //     },
  //     error: (ex) {
  //       log("Exception occurred on Page : $page. Exception: ${ex.msg} ");
  //       return CharactersState.error(ex.msg);
  //     },
  //   );
  // }

  @override
  Future<Character?> getCharacterById(String id) async {
    final apiBaseResponse = await _apiManager.getAsync<CharacterDto>(
      endpoint: "character/$id",
    );

    return apiBaseResponse.when(
      success: (data) => data.docs.map((e) => e.toModel()).toList().first,
      error: (ex) => null,
    );
  }

  @override
  Future<DwarvesState> getDwarves({required int page}) async {
    final apiBaseResponse = await _apiManager.getAsync<CharacterDto>(
      endpoint: "character",
      queryParams: {
        "race": Race.dwarf.name.capitalize(),
        "page": page,
        "limit": 10,
      },
    );
    await Future.delayed(const Duration(seconds: 1));
    return apiBaseResponse.when(
      success: (data) {
        log("Get Characters Api Called=> Page: $page, Race: ${Race.dwarf.name}");
        return DwarvesState.fetchData(
          data.docs.map((e) => e.toModel()).toList(),
          page >= data.pages,
        );
      },
      error: (ex) {
        log("Exception occurred on Page : $page. Exception: ${ex.msg} ");
        return DwarvesState.error(ex.msg);
      },
    );
  }

  @override
  Future<ElvesState> getElves({required int page}) async {
    final apiBaseResponse = await _apiManager.getAsync<CharacterDto>(
      endpoint: "character",
      queryParams: {
        "race": Race.elf.name.capitalize(),
        "page": page,
        "limit": 10,
      },
    );
    await Future.delayed(const Duration(seconds: 1));
    return apiBaseResponse.when(
      success: (data) {
        log("Get Characters Api Called=> Page: $page, Race: ${Race.elf.name}");
        return ElvesState.fetchData(
          data.docs.map((e) => e.toModel()).toList(),
          page >= data.pages,
        );
      },
      error: (ex) {
        log("Exception occurred on Page : $page. Exception: ${ex.msg} ");
        return ElvesState.error(ex.msg);
      },
    );
  }

  @override
  Future<HobbitsState> getHobbits({required int page}) async {
    final apiBaseResponse = await _apiManager.getAsync<CharacterDto>(
      endpoint: "character",
      queryParams: {
        "race": Race.hobbit.name.capitalize(),
        "page": page,
        "limit": 10,
      },
    );
    await Future.delayed(const Duration(seconds: 1));
    return apiBaseResponse.when(
      success: (data) {
        log("Get Characters Api Called=> Page: $page, Race: ${Race.hobbit.name}");
        return HobbitsState.fetchData(
          data.docs.map((e) => e.toModel()).toList(),
          page >= data.pages,
        );
      },
      error: (ex) {
        log("Exception occurred on Page : $page. Exception: ${ex.msg} ");
        return HobbitsState.error(ex.msg);
      },
    );
  }

  @override
  Future<HumansState> getHumans({required int page}) async {
    final apiBaseResponse = await _apiManager.getAsync<CharacterDto>(
      endpoint: "character",
      queryParams: {
        "race": Race.human.name.capitalize(),
        "page": page,
        "limit": 10,
      },
    );
    await Future.delayed(const Duration(seconds: 1));
    return apiBaseResponse.when(
      success: (data) {
        log("Get Characters Api Called=> Page: $page, Race: ${Race.human.name}");
        return HumansState.fetchData(
          data.docs.map((e) => e.toModel()).toList(),
          page >= data.pages,
        );
      },
      error: (ex) {
        log("Exception occurred on Page : $page. Exception: ${ex.msg} ");
        return HumansState.error(ex.msg);
      },
    );
  }
}
