import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/characters_repository.dart';
import 'elves_event.dart';
import 'elves_state.dart';

@injectable
class ElvesBloc extends Bloc<ElvesEvent, ElvesState> {
  final CharactersRepository _charactersRepository;
  int page = 1;
  bool isFetching = false;
  bool isRefreshing = false;

  ElvesBloc(this._charactersRepository) : super(const ElvesState.initial()) {
    on<ElvesEvent>((event, emit) async {
      await event.when(
          started: () {},
          fetch: () async {
            if (state.reachedEnd) return;
            isFetching = true;
            final elvesList = await _charactersRepository.getElves(
              page: page,
            );
            elvesList.when(
              initial: () {},
              fetchData: (data, reachedEnd) {
                emit(
                  ElvesState.fetchData(
                      List.of(state.elvesList ?? [])..addAll(data), reachedEnd),
                );
              },
              error: (exMsg) => emit(ElvesState.error(exMsg)),
            );
            page++;
            isFetching = false;
          },
          refresh: () async {
            isFetching = true;
            isRefreshing = true;
            page = 1;
            final elvesState = await _charactersRepository.getElves(
              page: page,
            );
            emit(elvesState);
            page++;
            isFetching = false;
            isRefreshing = false;
          });
    });
  }
}
