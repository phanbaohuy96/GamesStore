import 'package:flutter/material.dart';
import 'package:games_store/pages/LandingPage.dart';

void main() => runApp( MaterialApp(
    title: 'Games Store',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: LandingPage(),
  )
);