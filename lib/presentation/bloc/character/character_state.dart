import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/character.dart';

part 'character_state.freezed.dart';

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState.initial() = _Initial;
  const factory CharacterState.fetched(Character character) = _Fetched;
  const factory CharacterState.error() = _Error;
}
