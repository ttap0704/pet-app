import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/views/accommodation/index.dart';
import 'package:pet_app/views/index.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Named Routes Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/accommodation': (context) => AccommodationIndex(),
        },
      ),
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
