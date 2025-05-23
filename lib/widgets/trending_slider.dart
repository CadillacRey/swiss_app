import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:swiss_streaming/constants.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        //Carrousel
        itemCount: 10,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn, //autoplay!
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12), //RENDONDEA
            child: SizedBox(
              //Le hice un Wrap al container con widget > ClipRRect
              height: 300,
              width: 200,
              child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}'),
            ),
          );
        },
      ),
    );
  }
}
