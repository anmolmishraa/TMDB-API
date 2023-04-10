import 'package:flutter/material.dart';
import 'package:tmdb/utils/text.dart';

import 'package:tmdb/widgets/trending.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '1be91b13091b203bd28fbffefe732335';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmU5MWIxMzA5MWIyMDNiZDI4ZmJmZmVmZTczMjMzNSIsInN1YiI6IjY0MzQyMWZmZTkyZDgzMDExMzA4ODNhZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RniAqYb22WV8ZVRuP4BTzY12Q7Cnm7zRsPmkEj_Vozs';
  List trendingmovies = [];
  List searchList = [];
  TextEditingController controller = new TextEditingController();


  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: modified_text(text: 'TMDB UI'),
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: [
            //   TV(tv: tv),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
              child: TextField(
                controller: controller,
                decoration: new InputDecoration(
                    hintText: 'Search', border: InputBorder.none),
                onChanged: onSearchTextChanged,
              ),
            ),
            // if (noDAta)
            //   Text("No result found!")
            // else
              searchList.isNotEmpty
                  ? TrendingMovies(
                      trending: searchList,
                    )
                  : TrendingMovies(
                      trending: trendingmovies,
                    ),
          ],
        ));
  }

  onSearchTextChanged(String text) async {
    searchList.clear();
    if (text.isEmpty) {
      setState(() {

      });
      return;
    }
    setState(() {});
    trendingmovies.forEach((movieDetail) {
      if (movieDetail['title'] != null) {
        if (movieDetail['title'].toLowerCase().contains(text.toLowerCase())) {
          searchList.add(movieDetail);

          if (controller.text.isNotEmpty) {

            setState(() {});
          }
          setState(() {});
        }

      }
    });

    setState(() {});
  }
}
