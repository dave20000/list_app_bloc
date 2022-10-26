import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/character.dart';

part 'hobbits_state.freezed.dart';

@freezed
class HobbitsState with _$HobbitsState {
  const HobbitsState._();
  const factory HobbitsState.initial() = _Initial;
  const factory HobbitsState.fetchData(
    List<Character> hobbits,
    bool hasReachedEnd,
  ) = _FetchData;
  const factory HobbitsState.error(String exMsg) = _Error;

  bool get reachedEnd => maybeWhen(
        fetchData: (data, hasReachedEnd) => hasReachedEnd,
        orElse: () => false,
      );
  List<Character>? get hobbitList => maybeWhen(
        fetchData: (data, hasReachedEnd) => data,
        orElse: () => null,
      );
}
