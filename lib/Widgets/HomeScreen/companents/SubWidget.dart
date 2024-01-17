import 'package:filmplus/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmplus/constants.dart';
import '../DetailScreen/DetailsWidget.dart';

class SubWidget extends StatelessWidget {
  const SubWidget({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    double mH = MediaQuery.of(context).size.height;
    double mW = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      movie: snapshot.data[index],
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: mH*0.2,
                  width: mW*0.3,
                  child: DecoratedBox(decoration: BoxDecoration(color: Colors.black38),
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${Constants.imagePath}${snapshot.data![index].posterPath}',
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*class SubWidget extends StatelessWidget {
  const SubWidget({super.key, this.movies,this.snapshot});

  final List<Movie>? movies;
  final AsyncSnapshot? snapshot;


  @override
  Widget build(BuildContext context) {
    double mH = MediaQuery.of(context).size.height;
    double mW = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [SizedBox(
        child: Builder(
          builder: (context) {
            if (movies == null) {
              return Center(child: Text('Empty List'));
            } else if (movies!.isNotEmpty) {
              //final data = snapshot.data;
              return SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                  onPressed: () {
                  },
                  child: CarouselSlider.builder(
                    itemCount: 20,
                    itemBuilder: (context, itemIndex, pageViewIndex) {
                      if (movies == null) return const Center(child: CircularProgressIndicator(),);
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsWidget(movie: snapshot!.data[itemIndex])));
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              width: mW*0.3,
                              //width: 200,
                              child: Image.network(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  "${Constants.imagePath}${movies![itemIndex].posterPath}"
                              ),
                            )),
                      );
                    },
                    options: CarouselOptions(
                      height: mH*0.2,
                      //height: 300,
                      //autoPlay: true,
                      //enlargeCenterPage: true,
                      viewportFraction: mW*0.0009,
                      //viewportFraction: 0.55,
                      //pageSnapping: true,
                      //autoPlayCurve: Curves.fastOutSlowIn,
                      //autoPlayAnimationDuration: const Duration(seconds: 2),
                    ),),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),


      ],
    );
  }
}*/
