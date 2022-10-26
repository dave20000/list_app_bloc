import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/characters_repository.dart';
import 'dwarves_event.dart';
import 'dwarves_state.dart';

@injectable
class DwarvesBloc extends Bloc<DwarvesEvent, DwarvesState> {
  final CharactersRepository _charactersRepository;
  int page = 1;
  bool isFetching = false;
  bool isRefreshing = false;

  DwarvesBloc(this._charactersRepository)
      : super(const DwarvesState.initial()) {
    on<DwarvesEvent>((event, emit) async {
      await event.when(
          started: () {},
          fetch: () async {
            if (state.reachedEnd) return;
            isFetching = true;
            final dwarvesList = await _charactersRepository.getDwarves(
              page: page,
            );
            dwarvesList.when(
              initial: () {},
              fetchData: (data, reachedEnd) {
                emit(
                  DwarvesState.fetchData(
                      List.of(state.dwarvesList ?? [])..addAll(data),
                      reachedEnd),
                );
              },
              error: (exMsg) => emit(DwarvesState.error(exMsg)),
            );
            page++;
            isFetching = false;
          },
          refresh: () async {
            isFetching = true;
            isRefreshing = true;
            page = 1;
            final dwarvesState = await _charactersRepository.getDwarves(
              page: page,
            );
            emit(dwarvesState);
            page++;
            isFetching = false;
            isRefreshing = false;
          });
    });
  }
}
