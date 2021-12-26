import 'package:flutter/material.dart';

import '../models/movie_list.dart';

class MovieListProvider with ChangeNotifier {
  final List<MovieList> _moviesList = [
    MovieList(
      id: 'tt4154796',
      title: 'Avengers: Endgame',
      runtime: '181 min',
      rating: '8.4',
      poster:
          'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg',
    ),
    MovieList(
      id: 'tt0848228',
      title: 'The Avengers',
      runtime: '143 min',
      rating: '8.0',
      poster:
          'https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg',
    ),
  ];

  List<MovieList> get moviesList {
    return [..._moviesList];
  }
}
