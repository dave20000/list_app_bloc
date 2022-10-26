import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/injector/di.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../domain/enums/race.dart';
import '../../../../../domain/models/character.dart';
import '../../../../bloc/dwarves/dwarves_bloc.dart';
import '../../../../bloc/dwarves/dwarves_event.dart';
import '../../../../bloc/dwarves/dwarves_state.dart';
import '../../../../bloc/elves/elves_bloc.dart';
import '../../../../bloc/elves/elves_event.dart';
import '../../../../bloc/elves/elves_state.dart';
import '../../../../bloc/hobbits/hobbits_bloc.dart';
import '../../../../bloc/hobbits/hobbits_event.dart';
import '../../../../bloc/hobbits/hobbits_state.dart';
import '../../../../bloc/humans/humans_bloc.dart';
import '../../../../bloc/humans/humans_event.dart';
import '../../../../bloc/humans/humans_state.dart';
import 'character_info_card.dart';
import 'character_shimmer_info_card.dart';

class CharacterTabContent extends StatefulWidget {
  final Race race;
  const CharacterTabContent({required this.race, super.key});

  @override
  State<CharacterTabContent> createState() => _CharacterTabContentState();
}

class _CharacterTabContentState extends State<CharacterTabContent> {
  late final ScrollController _humansScrollController;
  late final ScrollController _elvesScrollController;
  late final ScrollController _dwarvesScrollController;
  late final ScrollController _hobbitsScrollController;

  @override
  void initState() {
    _humansScrollController = ScrollController()..addListener(_onScroll);
    _elvesScrollController = ScrollController()..addListener(_onScroll);
    _dwarvesScrollController = ScrollController()..addListener(_onScroll);
    _hobbitsScrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _humansScrollController
      ..removeListener(_onScroll)
      ..dispose();
    _elvesScrollController
      ..removeListener(_onScroll)
      ..dispose();
    _dwarvesScrollController
      ..removeListener(_onScroll)
      ..dispose();
    _hobbitsScrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    switch (widget.race) {
      case Race.human:
        if (_humansScrollController.hasClients &&
            _humansScrollController.offset >=
                (_humansScrollController.position.maxScrollExtent * 0.9) &&
            !context.read<HumansBloc>().isFetching) {
          context.read<HumansBloc>().add(const HumansEvent.fetch());
        }
        break;
      case Race.elf:
        if (_elvesScrollController.hasClients &&
            _elvesScrollController.offset >=
                (_elvesScrollController.position.maxScrollExtent * 0.9) &&
            !context.read<ElvesBloc>().isFetching) {
          context.read<ElvesBloc>().add(const ElvesEvent.fetch());
        }
        break;
      case Race.dwarf:
        if (_dwarvesScrollController.hasClients &&
            _dwarvesScrollController.offset >=
                (_dwarvesScrollController.position.maxScrollExtent * 0.9) &&
            !context.read<DwarvesBloc>().isFetching) {
          context.read<DwarvesBloc>().add(const DwarvesEvent.fetch());
        }
        break;
      case Race.hobbit:
        if (_hobbitsScrollController.hasClients &&
            _hobbitsScrollController.offset >=
                (_hobbitsScrollController.position.maxScrollExtent * 0.9) &&
            !context.read<HobbitsBloc>().isFetching) {
          context.read<HobbitsBloc>().add(const HobbitsEvent.fetch());
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        switch (widget.race) {
          case Race.human:
            context.read<HumansBloc>().add(const HumansEvent.refresh());
            break;
          case Race.elf:
            context.read<ElvesBloc>().add(const ElvesEvent.refresh());
            break;
          case Race.dwarf:
            context.read<DwarvesBloc>().add(const DwarvesEvent.refresh());
            break;
          case Race.hobbit:
            context.read<HobbitsBloc>().add(const HobbitsEvent.refresh());
            break;
        }
      },
      child: Container(
        color: const Color(0xFFF1EFFA),
        child: widget.race == Race.dwarf
            ? BlocBuilder<DwarvesBloc, DwarvesState>(
                builder: (context, state) {
                  return Center(
                    child: state.when(
                      initial: () => initialLoader(),
                      fetchData: (data, hasReachedEnd) {
                        return characterListWidget(
                          data,
                          hasReachedEnd,
                        );
                      },
                      error: (exMsg) => Text(exMsg),
                    ),
                  );
                },
              )
            : widget.race == Race.elf
                ? BlocBuilder<ElvesBloc, ElvesState>(
                    builder: (context, state) {
                      return Center(
                        child: state.when(
                          initial: () => initialLoader(),
                          fetchData: (data, hasReachedEnd) {
                            return characterListWidget(
                              data,
                              hasReachedEnd,
                            );
                          },
                          error: (exMsg) => Text(exMsg),
                        ),
                      );
                    },
                  )
                : widget.race == Race.human
                    ? BlocBuilder<HumansBloc, HumansState>(
                        builder: (context, state) {
                          return Center(
                            child: state.when(
                              initial: () => initialLoader(),
                              fetchData: (data, hasReachedEnd) {
                                return characterListWidget(
                                  data,
                                  hasReachedEnd,
                                );
                              },
                              error: (exMsg) => Text(exMsg),
                            ),
                          );
                        },
                      )
                    : BlocBuilder<HobbitsBloc, HobbitsState>(
                        builder: (context, state) {
                          return Center(
                            child: state.when(
                              initial: () => initialLoader(),
                              fetchData: (data, hasReachedEnd) {
                                return characterListWidget(
                                  data,
                                  hasReachedEnd,
                                );
                              },
                              error: (exMsg) => Text(exMsg),
                            ),
                          );
                        },
                      ),
      ),
    );
  }

  Widget initialLoader() {
    return Column(
      children: [
        const SizedBox(height: 8),
        for (int i = 0; i < 5; i++) const ShimmerCharacterInfoCard(),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget characterListWidget(
    List<Character> characterList,
    bool hasReachedEnd,
  ) {
    return characterList.isEmpty
        ? const Text("Empty")
        : Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              controller: widget.race == Race.human
                  ? _humansScrollController
                  : widget.race == Race.elf
                      ? _elvesScrollController
                      : widget.race == Race.dwarf
                          ? _dwarvesScrollController
                          : _hobbitsScrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: hasReachedEnd
                  ? characterList.length
                  : characterList.length + 1,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) => index >= characterList.length
                  ? Column(
                      children: const [
                        ShimmerCharacterInfoCard(),
                        ShimmerCharacterInfoCard(),
                      ],
                    )
                  : GestureDetector(
                      onTap: () => DI.resolve<AppRouter>().push(
                            CharacterDetailRoute(
                              id: characterList[index].id,
                            ),
                          ),
                      child: CharacterInfoCard(
                        character: characterList[index],
                      ),
                    ),
            ),
            // : const ShimmerCharacterInfoCard()),
          );
  }
}
