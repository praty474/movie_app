import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/widgets/movies_slider.dart';
import 'package:movie_app/widgets/trending_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'res/images/netflix.png',
            height: 40,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trending Movies',
                  style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
                const SizedBox(
                  height: 32,
                ),
                const TrendingSlider(),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Top rated movies',
                  style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
                const SizedBox(
                  height: 32,
                ),
                const MoviesSlider(),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Upcoming movies',
                  style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
                const SizedBox(
                  height: 32,
                ),
                const MoviesSlider(),
              ],
            ),
          ),
        ));
  }
}
