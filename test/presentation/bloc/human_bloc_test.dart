import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:list_app_bloc/presentation/bloc/humans/humans_bloc.dart';
import 'package:list_app_bloc/presentation/bloc/humans/humans_event.dart';
import 'package:list_app_bloc/presentation/bloc/humans/humans_state.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/repositories/characters_repository_mock.mocks.dart';

Future<void> main() async {
  group("HumanBloc Test", () {
    late MockCharactersRepository mockCharactersRepository;

    const mockHumansListData = HumansState.fetchData([], false);
    const mockErrorHumansListData = HumansState.error("Some error occurred");

    setUpAll(() {
      mockCharactersRepository = MockCharactersRepository();
    });

    group('fetch', () {
      blocTest<HumansBloc, HumansState>(
        'emits HumanState.fetchData state for successful fetching data',
        build: () => HumansBloc(mockCharactersRepository),
        act: (bloc) {
          when(mockCharactersRepository.getHumans(page: 1))
              .thenAnswer((_) async => mockHumansListData);
          bloc.add(const HumansEvent.fetch());
        },
        expect: () => [mockHumansListData],
      );

      blocTest<HumansBloc, HumansState>(
        'emits HumanState.error state for unSuccessful fetching data',
        build: () => HumansBloc(mockCharactersRepository),
        act: (bloc) {
          when(mockCharactersRepository.getHumans(page: 1))
              .thenAnswer((_) async => mockErrorHumansListData);
          bloc.add(const HumansEvent.fetch());
        },
        expect: () => [mockErrorHumansListData],
      );
    });

    group('refresh', () {
      blocTest<HumansBloc, HumansState>(
        'emits HumanState.fetchData state for successful refreshing data',
        build: () => HumansBloc(mockCharactersRepository),
        act: (bloc) {
          when(mockCharactersRepository.getHumans(page: 1))
              .thenAnswer((_) async => mockHumansListData);
          bloc.add(const HumansEvent.refresh());
        },
        expect: () => [mockHumansListData],
      );

      blocTest<HumansBloc, HumansState>(
        'emits HumanState.error state for unSuccessful refreshing data',
        build: () => HumansBloc(mockCharactersRepository),
        act: (bloc) {
          when(mockCharactersRepository.getHumans(page: 1))
              .thenAnswer((_) async => mockErrorHumansListData);
          bloc.add(const HumansEvent.refresh());
        },
        expect: () => [mockErrorHumansListData],
      );
    });
  });
}
