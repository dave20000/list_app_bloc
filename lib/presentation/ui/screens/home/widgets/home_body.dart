import 'package:flutter/material.dart';

import '../../../../../core/extensions.dart';
import '../../../../../domain/enums/race.dart';
import 'character_tab_content.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Lord of the ring Characters",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Text(
                Race.human.name.capitalize(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Text(
                Race.elf.name.capitalize(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Text(
                Race.dwarf.name.capitalize(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Text(
                Race.hobbit.name.capitalize(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CharacterTabContent(race: Race.human),
            CharacterTabContent(race: Race.elf),
            CharacterTabContent(race: Race.dwarf),
            CharacterTabContent(race: Race.hobbit),
          ],
        ),
      ),
    );
  }
}
