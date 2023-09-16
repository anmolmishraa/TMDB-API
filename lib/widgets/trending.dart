import 'package:flutter/material.dart';

import '../description.dart';


class TrendingMovies extends StatelessWidget {
  final List? trending;
  final String ?type;
  final List? trendingtype;

  const TrendingMovies({Key? key, this.trending,this.type,this.trendingtype}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   

    return Container(
      // padding: EdgeInsets.all(10),
      child: 

          // SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(type??"",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)
              ,Container(
                  height: 270,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trending?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Description(
                                          name: trending![index]['title'],
                                          bannerurl:
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trending![index]['backdrop_path'],
                                          posterurl:
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trending![index]['poster_path'],
                                          description: trending![index]['overview'],
                                          vote: trending![index]['vote_average']
                                              .toString(),
                                          launch_on: trending![index]
                                              ['release_date'],
                                        )));
                          },
                          child: Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending![index]['poster_path']),
                                    ),
                                  ),
                                  height: 200,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Text(
                                    
                                      trending![index]['title'] != null
                                          ? trending![index]['title']
                                          : 'Loading', style: TextStyle(fontSize: 15),),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
            ],
          ));
    
  }
}
