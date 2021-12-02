import 'package:bai_tap_buoi_7/data_sources/api_urls.dart';
import 'package:bai_tap_buoi_7/models/MovieModel.dart';
import 'package:http/http.dart' as http;
import "dart:convert" as json;

class ApiServices {
  Future<List<MovieModel>> fetchMovieList() async {
    List<MovieModel> movieList = [];
    var movieListUrl = ApiUrls.POPULAR_MOVIE_URL;
    var response;
    try {
      response = await http.get(movieListUrl);
    } catch (e) {
      print("Error video loading " + e.toString());
    }

    var jsonBody = json.jsonDecode(response.body);
    List jsonList = jsonBody['results'];
    for (var json in jsonList) {
      MovieModel movieModel = MovieModel.fromJson(json);
      movieList.add(movieModel);
    }

    return movieList;
  }
}
