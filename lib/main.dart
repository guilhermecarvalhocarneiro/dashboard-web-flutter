import 'package:flutter/material.dart';

import 'apps/ui/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nuvols Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IndexPage(),
    );
  }
}
