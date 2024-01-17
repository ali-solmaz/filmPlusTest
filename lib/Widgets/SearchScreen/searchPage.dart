import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:filmplus/Widgets/SearchScreen/Companents/SearchedFilm.dart';
import 'package:filmplus/API/api.dart';
import 'package:filmplus/models/movie.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key,});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<List<Movie>>? searchingMovies;
  String text = "matrix";
  // late String query;


  @override
  void initState() {
    super.initState();
    var api = Api();


    // api.query = query;
    Future.delayed(Duration.zero, () async {
      searchingMovies = api.getMovies(Api.searchingMoviesUrl);
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 12),
          child: Container(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onTap: (){
                  log(text);
                },
                onChanged: (text){
                  log(text);
                  this.text = text;
                  setState(() {
                  });
                },
                  style: TextStyle(
                    color: Colors.black54,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.black54,
                  ),
                  cursorColor: Colors.black54,
                  decoration: InputDecoration(
                      icon: Icon(
                    Icons.search,
                    color: Colors.black54,
                  ))),
            ),
            decoration: BoxDecoration(
              color: Colors.amberAccent.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: Colors.amber.withOpacity(0.6), width: 5),
            ),
          ),
        ), //Search kısmıdır.
        SizedBox(
          child: FutureBuilder(
            future: searchingMovies,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return SearchedFilm(snapshot: snapshot);
              } else {
                return const Center(child: Column(children: [SizedBox(height: 25),CircularProgressIndicator()],));
              }
            },
          ),
        ), //sonuç kısmıdır.
      ]),
    );
  }
}
