import 'package:flutter/material.dart';
import 'package:pet_app/views/accommodation/index.dart';
import 'package:pet_app/views/index.dart';
import 'package:pet_app/widgets/layout/layout_default.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/accommodation': (context) => AccommodationIndex(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Text('Flutter D2emo');
  }
}
