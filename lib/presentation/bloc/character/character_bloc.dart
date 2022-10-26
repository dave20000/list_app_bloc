import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/characters_repository.dart';
import 'character_event.dart';
import 'character_state.dart';

@injectable
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharactersRepository _charactersRepository;

  CharacterBloc(this._charactersRepository)
      : super(const CharacterState.initial()) {
    on<CharacterEvent>((event, emit) async {
      await event.when(
        started: () {},
        fetch: (String id) async {
          final character = await _charactersRepository.getCharacterById(id);
          emit(
            character != null
                ? CharacterState.fetched(character)
                : const CharacterState.error(),
          );
        },
      );
    });
  }
}
