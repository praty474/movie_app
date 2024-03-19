import 'dart:convert';
import 'dart:js_interop';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/apilinks/allapi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> trendingList = [];
  Future<void> trendingListHome() async {
    var trendingWeekResponse = await http.get(Uri.parse(trendingweekurl));
    if (trendingWeekResponse.statusCode == 200) {
      var tempData = jsonDecode(trendingWeekResponse.body);
      var trendingWeekJson = tempData['results'];
      for (var i = 0; i < trendingWeekJson.length;) {
        trendingList.add({
          'id': trendingWeekJson[i]['id'],
          'poster_path': trendingWeekJson[i]['poster_path'],
          'vote_averge': trendingWeekJson[i]['vote_averge'],
          'media_type': trendingWeekJson[i]['media_type'],
          'indexNo': i,
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            toolbarHeight: 60,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: FutureBuilder(
                future: trendingListHome(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval:const  Duration(seconds: 2),
                        height: MediaQuery.of(context).size.height,
                      ),
                      items: trendingList.map((i) {
                        return Builder(
                          builder: ((context) {
                            return GestureDetector();
                          }),
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    );
                  }
                },
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Trending',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 16),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const Center(
              child: Text('Sample'),
            )
          ]))
        ],
      ),
    );
  }
}
