import 'package:filmplus/API/api.dart';
import 'package:filmplus/models/movie.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'Widgets/RowWidgetx.dart';
import 'package:filmplus/Widgets/HomeScreen/companents/MainWidget.dart';
import 'package:filmplus/Widgets/HomeScreen/companents/SubWidget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // late Future<List<Movie>>? trendingMovies;
  // late Future<List<Movie>>? topRatedMovies;
  // late Future<List<Movie>>? popularTvShow;
  // late Future<List<Movie>>? upComingMovies;
  // late Future<List<Movie>>? nowPlayingMovies;
  // late Future<List<Movie>>? popularMovies;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   Api api = Api();
  //   Future.delayed(Duration.zero, () async{
  //       trendingMovies = api.getMovies(Api.trendingUrl);
  //       topRatedMovies = api.getMovies(Api.topRatedUrl);
  //       popularTvShow = api.getMovies(Api.popularTvShowUrl);
  //       upComingMovies = api.getMovies(Api.upComingMoviesUrl);
  //       nowPlayingMovies = api.getMovies(Api.nowPlayingUrl);
  //       popularMovies = api.getMovies(Api.popularMoviesUrl);
  //
  //     setState(() {});
  //   });
  // }
//MAIN PAGE

  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            children: [
              WidgetController(),
            ],
          ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 5 ,),
      SizedBox(child: Text("$title", style: TextStyle(fontSize: 20),textAlign: TextAlign.left),width: 350,)

    ],);
  }
}

class MainPageFutureAndController extends StatelessWidget {

  late Future? futureName;
  late int WidgetIndex;

  MainPageFutureAndController({super.key,required this.futureName, this.WidgetIndex = 1});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      child: FutureBuilder(
        future: futureName,
        builder: (context, snapshot) {
          var sellectedWidget = <Widget>[MainWidget(snapshot: snapshot), SubWidget(snapshot: snapshot)];
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return  sellectedWidget[WidgetIndex];
          }
            else {
            return const Center();
          }
        },
      ),
    );
  }
}

class WidgetController extends StatefulWidget {

  WidgetController({super.key,});

  @override
  State<WidgetController> createState() => _WidgetControllerState();
}

class _WidgetControllerState extends State<WidgetController> {
  late Future<List<Movie>>? trendingMovies;
  late Future<List<Movie>>? topRatedMovies;
  late Future<List<Movie>>? popularTvShow;
  late Future<List<Movie>>? upComingMovies;
  late Future<List<Movie>>? nowPlayingMovies;
  late Future<List<Movie>>? popularMovies;


  @override
  void initState() {
    super.initState();
    Api api = Api();
    Future.delayed(Duration.zero, () async{
      trendingMovies = api.getMovies(Api.trendingUrl);
      topRatedMovies = api.getMovies(Api.topRatedUrl);
      popularTvShow = api.getMovies(Api.popularTvShowUrl);
      upComingMovies = api.getMovies(Api.upComingMoviesUrl);
      nowPlayingMovies = api.getMovies(Api.nowPlayingUrl);
      popularMovies = api.getMovies(Api.popularMoviesUrl);

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      child: FutureBuilder(
        future: trendingMovies,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return  Column(children: [
              MainPageFutureAndController(futureName: trendingMovies, WidgetIndex: 0),
              Title(title: "Films Now Playing",),
              MainPageFutureAndController(futureName: nowPlayingMovies,),
              Title(title: "Coming Soon Films",),
              MainPageFutureAndController(futureName: upComingMovies,),
              Title(title: "Top Rated Films",),
              MainPageFutureAndController(futureName: topRatedMovies,),
              Title(title: "Popular Films",),
              MainPageFutureAndController(futureName: popularMovies,),
              Title(title: "Popular TV Show",),
              MainPageFutureAndController(futureName: popularTvShow,)
            ],);
          } else {
            return const Center(child: Column(children: [SizedBox(height: 25,),CircularProgressIndicator()],));
          }
        },
      ),
    );
  }
}