import 'package:flutter/material.dart';

class MovieButton extends StatelessWidget {
  const MovieButton({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: SizedBox(
        height: 75,
        width: 75,
        child: ElevatedButton(
          child: Image.asset(
            imagePath,
            height: 25,
            width: 25,
          ),
          style: ElevatedButton.styleFrom(primary: const Color(0xFF210F37)),
          onPressed: () {},
        ),
      ),
    );
  }
}
