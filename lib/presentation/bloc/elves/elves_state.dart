import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/character.dart';

part 'elves_state.freezed.dart';

@freezed
class ElvesState with _$ElvesState {
  const ElvesState._();
  const factory ElvesState.initial() = _Initial;
  const factory ElvesState.fetchData(
    List<Character> elves,
    bool hasReachedEnd,
  ) = _FetchData;
  const factory ElvesState.error(String exMsg) = _Error;

  bool get reachedEnd => maybeWhen(
        fetchData: (data, hasReachedEnd) => hasReachedEnd,
        orElse: () => false,
      );
  List<Character>? get elvesList => maybeWhen(
        fetchData: (data, hasReachedEnd) => data,
        orElse: () => null,
      );
}
