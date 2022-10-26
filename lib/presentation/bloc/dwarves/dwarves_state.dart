import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/character.dart';

part 'dwarves_state.freezed.dart';

@freezed
class DwarvesState with _$DwarvesState {
  const DwarvesState._();
  const factory DwarvesState.initial() = _Initial;
  const factory DwarvesState.fetchData(
    List<Character> dwarves,
    bool hasReachedEnd,
  ) = _FetchData;
  const factory DwarvesState.error(String exMsg) = _Error;

  bool get reachedEnd => maybeWhen(
        fetchData: (data, hasReachedEnd) => hasReachedEnd,
        orElse: () => false,
      );
  List<Character>? get dwarvesList => maybeWhen(
        fetchData: (data, hasReachedEnd) => data,
        orElse: () => null,
      );
}
