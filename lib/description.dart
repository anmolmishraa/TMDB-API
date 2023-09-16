import 'package:flutter/material.dart';



class Description extends StatelessWidget {
  final String ?name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key ?key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
        Container(
            height: 250,
            child: Stack(children: [
              Positioned(
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  child: Text( '⭐ Average Rating - ' + vote!)),
            ])),
        SizedBox(height: 15),
        Container(
            padding: EdgeInsets.all(10),
            child: Text(
                 name != null ? (name ?? '') : 'Not Loaded', style: TextStyle(fontSize: 24,color: Colors.black),)),
        Container(
            padding: EdgeInsets.only(left: 10),
            child:
                Text( 'Releasing On - ' + launch_on!, style: TextStyle(fontSize: 18,color: Colors.black),)),
        Row(
          children: [
            Container(
              height: 200,
              width: 100,
              child: Image.network(posterurl!),
            ),
            Flexible(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text( description??"", style: TextStyle(fontSize: 18,color: Colors.black))),
            ),
          ],
        )
      ]),
    );
  }
}
