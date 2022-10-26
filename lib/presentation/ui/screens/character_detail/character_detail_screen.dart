import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injector/di.dart';
import '../../../bloc/character/character_bloc.dart';
import '../../../bloc/character/character_event.dart';
import 'widgets/character_detail_body.dart';

class CharacterDetailScreen extends StatelessWidget {
  final String id;
  const CharacterDetailScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DI.resolve<CharacterBloc>()..add(CharacterEvent.fetch(id)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Detail",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: const CharacterDetailBody(),
      ),
    );
  }
}
