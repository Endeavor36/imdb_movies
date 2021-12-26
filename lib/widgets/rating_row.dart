import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    Key? key,
    required this.rating,
    required this.name,
  }) : super(key: key);

  final String rating;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        const Expanded(
          child: Text(''),
        ),
        Text(
          rating,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
