import 'package:flutter/material.dart';

import '../../../../../domain/models/character.dart';

class CharacterInfoCard extends StatelessWidget {
  final Character character;
  const CharacterInfoCard({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                character.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                character.race.isEmpty ? "Unknown" : character.race,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          detailText(
            "DOB: ",
            character.birth.isEmpty ? "Unknown" : character.birth,
          ),
          const SizedBox(height: 4),
          detailText(
            "Death: ",
            character.death.isEmpty ? "Unknown" : character.death,
          ),
        ],
      ),
    );
  }

  Text detailText(String title, String detail) {
    return Text.rich(
      TextSpan(
          text: title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
          children: [
            TextSpan(
              text: detail,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            )
          ]),
    );
  }
}
