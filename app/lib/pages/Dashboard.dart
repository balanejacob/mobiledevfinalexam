import 'package:app/pages/Login.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  static const String routeName = "dashboard";
  String url = "";

  @override
  // ignore: override_on_non_overriding_member
  final futureAlbum = fetchAlbum();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                url = snapshot.data.url;
                if(url.substring(url.length - 3) == "mp4"){
                  update(context);
                }
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
      ),
      floatingActionButton: Wrap( //will break to another line on overflow
        direction: Axis.horizontal, //use vertical to show  on vertical axis
        children: <Widget>[
          Container( 
            margin:EdgeInsets.all(10),
            child: FloatingActionButton(
              onPressed: (){logout(context);},
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.login_outlined),
            )
          ),
          Container( 
            margin:EdgeInsets.all(10),
            child: FloatingActionButton(
              onPressed: (){update(context);},
              backgroundColor: Colors.tealAccent,
              child: Icon(Icons.filter_center_focus_rounded ),
            )
          ), 
        ],
      ),
    );
  }

  void logout(BuildContext context){
    Navigator.pushNamed(context, Login.routeName);
  }

  void update(BuildContext context){
    Navigator.pushNamed(context, Dashboard.routeName);
  }

  void checkUrl(String url){
    if(url.substring(url.length - 3) == "jpg" || url.substring(url.length - 3) == "png"){
      url = url;
    }else{

    }
  }
}

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://random.dog/woof.json');
  
  // Appropriate action depending upon the
  // server response
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
  
class Album {
  final String url;
  
  Album({this.url});
  
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      url: json['url'],
    );
  }
}