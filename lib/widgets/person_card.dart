import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key? key,
    required this.persons,
  }) : super(key: key);

  final List<String> persons;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var person in persons)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Color(0xFF37274B),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    person.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFFECBBDA),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
