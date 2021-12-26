import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imdb_movies/services/get_movies.dart';
import 'package:provider/provider.dart';

import '../providers/movie_list_provider.dart';
import '../models/movie_detail.dart';
import '../widgets/rating_row.dart';
import '../widgets/star_rating.dart';
import '../widgets/rounded_box.dart';
import '../widgets/person_card.dart';
import '../widgets/movie_info_row.dart';
import '../widgets/movie_button.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  static const routeName = '/movie-detail-screen';

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetail movie;

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  loadMovies() async {
    var movieInfo = await getMoviesById();

    MovieDetail movieDetail = MovieDetail(
      id: movieInfo['imdbID'],
      title: movieInfo['Title'],
      genre: movieInfo['Genre'],
      rating: movieInfo['imdbRating'],
      rottenTomatoes: movieInfo['Ratings'][1]['Value'],
      metacritic: movieInfo['Ratings'][2]['Value'],
      year: movieInfo['Year'],
      runtime: movieInfo['Runtime'],
      language: movieInfo['Language'],
      plot: movieInfo['Plot'],
      directors: movieInfo['Director'].split(','),
      actors: movieInfo['Actors'].split(','),
      writers: movieInfo['Writer'].split(','),
      poster: movieInfo['Poster'],
      country: movieInfo['Country'],
    );
    movie = movieDetail;
  }

  @override
  Widget build(BuildContext context) {
    // final movieId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.network(
                    movie.poster,
                    height: 600,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                        // overflow: TextOverflow.ellipsis,
                        // softWrap: false,
                        // maxLines: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        movie.genre,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: Colors.white.withOpacity(0.2),
                          height: 70,
                          width: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/icons/eva_arrow-ios-back-fill.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                children: const [
                  MovieButton(imagePath: 'assets/icons/Vector 27.png'),
                  Expanded(
                    child: Text(''),
                  ),
                  MovieButton(imagePath: 'assets/icons/Path-1.png'),
                  Expanded(
                    child: Text(''),
                  ),
                  MovieButton(imagePath: 'assets/icons/Path.png'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedBox(
              child: Column(
                children: [
                  StarRating(rating: movie.rating),
                  const SizedBox(
                    height: 20,
                  ),
                  RatingRow(
                    name: 'Internet Movie Database',
                    rating: movie.rating + '/10',
                  ),
                  const SizedBox(height: 10),
                  RatingRow(
                    name: 'Rotten Tomatoes',
                    rating: movie.rottenTomatoes,
                  ),
                  const SizedBox(height: 10),
                  RatingRow(
                    name: 'Metacritic',
                    rating: movie.metacritic,
                  ),
                ],
              ),
            ),
            RoundedBox(
              child: Column(
                children: [
                  MovieInfoRow(
                    imagePath: 'assets/icons/Group 357.png',
                    info: movie.year,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MovieInfoRow(
                    imagePath: 'assets/icons/Vector.png',
                    info: movie.country,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MovieInfoRow(
                    imagePath: 'assets/icons/Group 356.png',
                    info: movie.runtime,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MovieInfoRow(
                    imagePath: 'assets/icons/Group 358.png',
                    info: movie.language,
                  ),
                ],
              ),
            ),
            RoundedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Plot',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  movie.plot,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 18,
                  ),
                  // textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Director',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                PersonCard(persons: movie.directors),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Actor',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                PersonCard(persons: movie.actors),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Writer',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                PersonCard(persons: movie.writers),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
