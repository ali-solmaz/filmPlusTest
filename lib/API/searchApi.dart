import 'dart:convert';
// import 'dart:developer';
import 'package:filmplus/constants.dart';
import 'package:filmplus/models/movie.dart';
import 'package:http/http.dart' as http;

class SearchApi{
  // late String query;
  SearchApi();
  static String queryy = queryy ?? "matrix";
  static String searchingMoviesUrl = "https://api.themoviedb.org/3/search/movie?query=${queryy}&api_key=${Constants.apiKey}";//queryynin yanına değer atanacak

  Future<List<Movie>> getMovies (String url, String query) async {
    final response = await http.get((Uri.parse(url)));
    if(response.statusCode == 200){
      queryy= query;
      final decodedData=json.decode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception("Something happened");
    }
  }
}