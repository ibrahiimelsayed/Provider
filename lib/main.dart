import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post/classwords/words.dart';
import 'package:post/screens/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Words(),
      child: MaterialApp(
        title: 'My Words',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WordsApp(),
      ),
    );
  }
}
