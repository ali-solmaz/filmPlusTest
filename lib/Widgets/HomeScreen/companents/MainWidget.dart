import 'package:filmplus/Widgets/HomeScreen/DetailScreen/DetailsWidget.dart';
import 'package:filmplus/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmplus/constants.dart';
import 'package:filmplus/Widgets/HomeScreen/DetailScreen/DetailsWidget.dart';


class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    double mW = MediaQuery.of(context).size.width;
    double mH = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: mW*0.0015,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    movie: snapshot.data[itemIndex],
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: mH*0.035,
                width: mW*0.55,
                child: DecoratedBox(decoration: BoxDecoration(color: Colors.black38),
                  child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
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

