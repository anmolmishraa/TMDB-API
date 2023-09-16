import 'package:flutter/material.dart';
import 'package:tmdb/secret/keys.dart';


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
   List trendingmovies = [];
   List trendingtype = [];
  List searchList = [];
  TextEditingController controller = new TextEditingController();


  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(Keys().apikey, Keys().readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
Map trendintypes = await tmdbWithCustomLogs.v3.genres.getMovieList();
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
   
    
  

    setState(() {
 trendingtype= trendintypes['genres'];
      trendingmovies = trendingresult['results'];
     
    });
   

    
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("The Movies" ),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            //   TV(tv: tv),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 0),
              child: TextFormField
              
              (
                
                controller: controller,
                style: TextStyle(color: Colors.black),
                decoration: new InputDecoration(
                  
                 fillColor: Colors.transparent,
                 filled: true,
                
                 hintStyle: TextStyle(color: Colors.black),
                    hintText: 'Search'),
                onChanged: onSearchTextChanged,
              ),
            ),
       
              searchList.isNotEmpty
                  ? TrendingMovies(
                      trending: searchList,
                    )
                  : Column(
                    children: [
                      TrendingMovies(
                          trending: trendingmovies,
                          type: "Adventure",
                          trendingtype: trendingtype,
                        ),
                          TrendingMovies(
                          trending: trendingmovies,
                          type: "Fantasy",
                        ),
                          TrendingMovies(
                          trending: trendingmovies,
                          type: "Animation"
                         ),
                    ],
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
