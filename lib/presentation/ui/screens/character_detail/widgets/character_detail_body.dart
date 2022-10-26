import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/character/character_bloc.dart';
import '../../../../bloc/character/character_state.dart';

class CharacterDetailBody extends StatelessWidget {
  const CharacterDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
      return state.when(
        initial: () => const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
        fetched: (character) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              detailRow("Name:", character.name),
              detailRow("Race:", character.race),
              detailRow("Gender:", character.gender.name),
              detailRow("Hair:", character.hair),
              detailRow("Realm:", character.realm),
              detailRow("Spouse:", character.spouse),
              detailRow("WikiUrl:", character.wikiUrl),
              detailRow("Death:", character.death),
              detailRow("DOB:", character.birth),
              detailRow("Height:", character.height),
            ],
          ),
        ),
        error: () => const Center(child: Text("error")),
      );
    });
  }

  Widget detailRow(
    String title,
    String detail,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            detail.isEmpty ? "Unknown" : detail,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
