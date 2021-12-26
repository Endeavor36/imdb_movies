import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/movies_list_screen.dart';
import './screens/movie_detail_screen.dart';
import 'providers/movie_list_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => MovieListProvider(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF453955),
          ),
          backgroundColor: const Color(0xFF17082A),
        ),
        home: const MoviesListScreen(),
        routes: {
          MoviesListScreen.routeName: (ctx) => const MoviesListScreen(),
          MovieDetailScreen.routeName: (ctx) => MovieDetailScreen(),
        },
      ),
    );
  }
}
