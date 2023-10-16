import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({
    required this.difficultyLevel,
    super.key,
  });

  final int difficultyLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (var i = 0; i < 5; i++)
          Icon(
            Icons.star,
            size: 15,
            color: difficultyLevel >= i + 1 ? Colors.blue : Colors.blue[100],
          )
      ],
    );
  }
}
