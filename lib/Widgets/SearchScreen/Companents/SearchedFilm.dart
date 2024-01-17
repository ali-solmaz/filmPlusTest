import 'package:flutter/material.dart';
import 'package:filmplus/models/movie.dart';
import 'package:filmplus/constants.dart';
import 'package:filmplus/Widgets/HomeScreen/DetailScreen/DetailsWidget.dart';
import 'package:filmplus/API/api.dart';
import 'package:filmplus/models/movie.dart';


class SearchedFilm extends StatefulWidget {
  const SearchedFilm({super.key,required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  State<SearchedFilm> createState() => _SearchedFilmState();
}

class _SearchedFilmState extends State<SearchedFilm> {
  @override

  Widget build(BuildContext context) {
    double mH = MediaQuery.of(context).size.height;
    double mW = MediaQuery.of(context).size.width;

    return SizedBox(
        height: mH*0.7265,
        width: double.infinity,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: widget.snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          movie: widget.snapshot.data[index],
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: mH * 0.2,
                      width: mW * 0.3,
                      child: DecoratedBox(decoration: BoxDecoration(color: Colors.black38),
                        child: Image.network(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          '${Constants.imagePath}${widget.snapshot.data![index].posterPath}',
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
