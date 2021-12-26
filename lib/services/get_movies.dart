import 'package:http/http.dart' as http;
import 'dart:convert';

String id = '';
String name = 'avengers endgame';
String apiKey = '4c0b9c85';

String moviesUrlByName = 'http://www.omdbapi.com/?apikey=$apiKey&t=$name';
String moviesUrlById = 'http://www.omdbapi.com/?apikey=$apiKey&i=$id';

Future<dynamic> getMoviesByName(movieName) async {
  name = movieName;
  http.Response response = await http.get(Uri.parse(moviesUrlByName));

  if (response.statusCode == 200) {
    var body = response.body;
    return jsonDecode(body);
  } else {
    print('Failed to load data.');
  }
}

Future<dynamic> getMoviesById() async {
  http.Response response = await http.get(Uri.parse(moviesUrlById));

  if (response.statusCode == 200) {
    var body = response.body;

    return jsonDecode(body);
  } else {
    print('Failed to load data.');
  }
}

getId(movieId) {
  id = movieId;
}
