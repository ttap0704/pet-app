import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/store/size.dart';
import 'package:pet_app/widgets/layout/layout_default.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final sizeRead = ref.read(sizeProvider.notifier);
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;
      sizeRead.setInitSize(width, height);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const LayoutDefault();
  }
}
