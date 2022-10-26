import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injector/di.dart';
import '../../../bloc/dwarves/dwarves_bloc.dart';
import '../../../bloc/dwarves/dwarves_event.dart';
import '../../../bloc/elves/elves_bloc.dart';
import '../../../bloc/elves/elves_event.dart';
import '../../../bloc/hobbits/hobbits_bloc.dart';
import '../../../bloc/hobbits/hobbits_event.dart';
import '../../../bloc/humans/humans_bloc.dart';
import '../../../bloc/humans/humans_event.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HumansBloc>(
          create: (BuildContext context) =>
              DI.resolve<HumansBloc>()..add(const HumansEvent.fetch()),
        ),
        BlocProvider<ElvesBloc>(
          create: (BuildContext context) =>
              DI.resolve<ElvesBloc>()..add(const ElvesEvent.fetch()),
        ),
        BlocProvider<DwarvesBloc>(
          create: (BuildContext context) =>
              DI.resolve<DwarvesBloc>()..add(const DwarvesEvent.fetch()),
        ),
        BlocProvider<HobbitsBloc>(
          create: (BuildContext context) =>
              DI.resolve<HobbitsBloc>()..add(const HobbitsEvent.fetch()),
        ),
      ],
      child: const HomeBody(),
    );
  }
}
