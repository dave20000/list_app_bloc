import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/characters_repository.dart';
import 'hobbits_event.dart';
import 'hobbits_state.dart';

@injectable
class HobbitsBloc extends Bloc<HobbitsEvent, HobbitsState> {
  final CharactersRepository _charactersRepository;
  int page = 1;
  bool isFetching = false;
  bool isRefreshing = false;

  HobbitsBloc(this._charactersRepository)
      : super(const HobbitsState.initial()) {
    on<HobbitsEvent>((event, emit) async {
      await event.when(
          started: () {},
          fetch: () async {
            if (state.reachedEnd) return;
            isFetching = true;
            final humansState = await _charactersRepository.getHobbits(
              page: page,
            );
            humansState.when(
              initial: () {},
              fetchData: (data, reachedEnd) {
                emit(
                  HobbitsState.fetchData(
                      List.of(state.hobbitList ?? [])..addAll(data),
                      reachedEnd),
                );
              },
              error: (exMsg) => emit(HobbitsState.error(exMsg)),
            );
            page++;
            isFetching = false;
          },
          refresh: () async {
            isFetching = true;
            isRefreshing = true;
            page = 1;
            final hobbitState = await _charactersRepository.getHobbits(
              page: page,
            );
            emit(hobbitState);
            page++;
            isFetching = false;
            isRefreshing = false;
          });
    });
  }
}
