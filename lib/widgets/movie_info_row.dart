import 'package:flutter/material.dart';

class MovieInfoRow extends StatelessWidget {
  const MovieInfoRow({
    Key? key,
    required this.info,
    required this.imagePath,
  }) : super(key: key);

  final String info;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: 20,
          width: 20,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          info,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
