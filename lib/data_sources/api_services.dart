import 'package:bai_tap_buoi_7/data_sources/api_urls.dart';
import 'package:bai_tap_buoi_7/models/Cast.dart';
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

  Future<List<Cast>> fetchCast(int idMovie) async {
    List<Cast> castList = [];
    var castListUrl = Uri.parse(
        "https://api.themoviedb.org/3/movie/$idMovie/credits?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi- VN");
    var response;
    try {
      response = await http.get(castListUrl);
    } catch (e) {
      print("Error cast loading " + e.toString());
    }

    var jsonBody = json.jsonDecode(response.body);
    List jsonList = jsonBody['cast'];
    for (var json in jsonList) {
      Cast castModel = Cast.fromJson(json);
      castList.add(castModel);
    }

    return castList;
  }
}
