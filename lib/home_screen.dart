import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swiss_streaming/api/api.dart';

import 'models/movie.dart';
import 'widgets/movies_slider.dart';
import 'widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/swiss-medical-logo-2025.png',
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Movies', //Titulo
                style: GoogleFonts.aBeeZee(fontSize: 25), //extraje el widget
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TrendingSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Top rated movies', // Titulo de la 2da fila
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(
                height: 32,
              ),
              MoviesSlider(),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Upcoming movies', // titulo de la 3ra fila copie todo de la segunda
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(
                height: 32,
              ),
              MoviesSlider(),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Saque el widget de aca creando un archivo .dart despues importe en los lugares que me marcaba material e trendind_slider
