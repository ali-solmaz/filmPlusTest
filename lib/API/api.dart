import 'dart:convert';
import 'dart:developer';
import 'package:filmplus/constants.dart';
import 'package:filmplus/models/movie.dart';
import 'package:http/http.dart' as http;

class Api{
  // late String query;
  static String? query = query ?? "matrix";
  Api();

  // Api({this.query});
  // Api({String? query}){queryy=query??"matrix";}
  // void setQuery(String k){
  //   query =k;
  // }


  static const trendingUrl = "https://api.themoviedb.org/3/trending/all/day?api_key=${Constants.apiKey}";
  static const topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";
  static const popularTvShowUrl = "https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}";
  static const upComingMoviesUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";
  static const nowPlayingUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}";
  static const popularMoviesUrl = "https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}";
  static String searchingMoviesUrl = "https://api.themoviedb.org/3/search/movie?query=${query}&api_key=${Constants.apiKey}";//queryynin yanına değer atanacak

  Future<List<Movie>> getMovies (String url) async {
    final response = await http.get((Uri.parse(url)));
    if(response.statusCode == 200){
      final decodedData=json.decode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception("Something happened");
    }
  }

  // static get trendingUrl => _trendingUrl;

  // static get topRatedUrl => _topRatedUrl;
  //
  // static get popularTvShowUrl => _popularTvShowUrl;
  //
  // static get upComingMoviesUrl => _upComingMoviesUrl;
  //
  // static get nowPlayingUrl => _nowPlayingUrl;
  //
  // static get popularMoviesUrl => _popularMoviesUrl;
  //
  // static get searchingMoviesUrl => _searchingMoviesUrl;



}