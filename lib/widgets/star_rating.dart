import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Color(0xFFF79E44),
        ),
        const Icon(
          Icons.star,
          color: Color(0xFFF79E44),
        ),
        const Icon(
          Icons.star,
          color: Color(0xFFF79E44),
        ),
        const Icon(
          Icons.star,
          color: Color(0xFFF79E44),
        ),
        const Icon(
          Icons.star,
          color: Color(0xFFF79E44),
        ),
        const Expanded(
          child: Text(''),
        ),
        Text(
          rating,
          style: const TextStyle(
            color: Color(0xFFF79E44),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
