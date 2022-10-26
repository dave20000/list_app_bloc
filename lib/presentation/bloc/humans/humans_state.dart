import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/character.dart';

part 'humans_state.freezed.dart';

@freezed
class HumansState with _$HumansState {
  const HumansState._();
  const factory HumansState.initial() = _Initial;
  const factory HumansState.fetchData(
    List<Character> humans,
    bool hasReachedEnd,
  ) = _FetchData;
  const factory HumansState.error(String exMsg) = _Error;

  bool get reachedEnd => maybeWhen(
        fetchData: (data, hasReachedEnd) => hasReachedEnd,
        orElse: () => false,
      );
  List<Character>? get humanList => maybeWhen(
        fetchData: (data, hasReachedEnd) => data,
        orElse: () => null,
      );
}
