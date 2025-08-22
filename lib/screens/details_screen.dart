import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swiss_streaming/colours.dart';
import 'package:swiss_streaming/constants.dart';
import 'package:swiss_streaming/models/movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.movie,
    });

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: CustomScrollView(slivers:[
        SliverAppBar.large(
          leading: Container(
            height: 70,
            width: 70, margin: const EdgeInsets.only(top: 16, left: 16),
            decoration: BoxDecoration(
              color: Colours.scaffoldBgColor,
              borderRadius: BorderRadius.circular(8),),
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded,)
              ),
            ),
            backgroundColor: Color.fromARGB(255, 18, 85, 201),
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
            title: Text(
              movie.title,
              style: GoogleFonts.belleza(
                fontSize: 17, 
                fontWeight: FontWeight.w600
                ),
            ),
            background: Image.network(
            '${Constants.imagePath} ${movie.backDropPath}',
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}