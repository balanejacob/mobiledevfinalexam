
import 'package:app/pages/Dashboard.dart';
import 'package:app/pages/Login.dart';
import 'package:app/pages/Registration.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (BuildContext context) => Login(), 
  Registration.routeName: (BuildContext context) => Registration(), 
  Dashboard.routeName: (BuildContext context) => Dashboard(), 
};