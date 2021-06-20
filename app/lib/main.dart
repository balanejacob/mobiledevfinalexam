import 'package:app/pages/Login.dart';
import 'package:app/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor:Colors.teal[700],
      accentColor: Colors.yellow[800],
      textTheme: TextTheme(
        headline5: TextStyle(
          fontSize: 72.0,
          fontWeight: FontWeight.bold
        ),
        headline6: TextStyle(
          fontSize: 36.0,
          fontStyle: FontStyle.italic,
        ),
        bodyText2: TextStyle(
          fontSize: 18.0
        ),
      ),
    ),
    routes: routes,
    home: Login(),
  ));
}
