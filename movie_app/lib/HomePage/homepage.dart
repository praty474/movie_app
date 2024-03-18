import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/apilinks/allapi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> trendingListhome() async {
    var trendingweekresponse = await http.get(Uri.parse(trendingweekurl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
