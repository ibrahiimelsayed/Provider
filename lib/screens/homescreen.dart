import 'package:flutter/material.dart';
import 'package:post/classwords/words.dart';
import 'package:post/screens/btmsheet.dart';
import 'package:post/wordwidget.dart';
import 'package:provider/provider.dart';

class WordsApp extends StatelessWidget {
  const WordsApp({Key? key}) : super(key: key);

  void _showsheet(BuildContext context, int id) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Btmsheet(id),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Word> words = Provider.of<Words>(context).words;
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyWords'),
        ),
        body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 1,
            thickness: 2,
          ),
          itemCount: words.length,
          itemBuilder: (_, i) => ChangeNotifierProvider.value(
            value: words[i],
            child: const Wordcard(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              final id = words.length;
              _showsheet(context, id);
            }));
  }
}
