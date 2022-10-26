import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/characters_repository.dart';
import 'humans_event.dart';
import 'humans_state.dart';

@injectable
class HumansBloc extends Bloc<HumansEvent, HumansState> {
  final CharactersRepository _charactersRepository;
  int page = 1;
  bool isFetching = false;
  bool isRefreshing = false;

  HumansBloc(this._charactersRepository) : super(const HumansState.initial()) {
    on<HumansEvent>((event, emit) async {
      await event.when(
          started: () {},
          fetch: () async {
            if (state.reachedEnd) return;
            isFetching = true;
            final humansState = await _charactersRepository.getHumans(
              page: page,
            );
            humansState.when(
              initial: () {},
              fetchData: (data, reachedEnd) {
                emit(
                  HumansState.fetchData(
                      List.of(state.humanList ?? [])..addAll(data), reachedEnd),
                );
              },
              error: (exMsg) => emit(HumansState.error(exMsg)),
            );
            page++;
            isFetching = false;
          },
          refresh: () async {
            isFetching = true;
            isRefreshing = true;
            page = 1;
            final charactersState = await _charactersRepository.getHumans(
              page: page,
            );
            emit(charactersState);
            page++;
            isFetching = false;
            isRefreshing = false;
          });
    });
  }
}
