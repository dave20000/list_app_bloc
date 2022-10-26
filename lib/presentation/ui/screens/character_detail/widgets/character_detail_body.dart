import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/character/character_bloc.dart';
import '../../../../bloc/character/character_state.dart';

class CharacterDetailBody extends StatelessWidget {
  const CharacterDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          BlocBuilder<CharacterBloc, CharacterState>(builder: (context, state) {
        return state.when(
          initial: () => const CircularProgressIndicator(
            color: Colors.black,
          ),
          fetched: (data) => Text(data.toString()),
          error: () => const Text("error"),
        );
      }),
    );
  }
}
