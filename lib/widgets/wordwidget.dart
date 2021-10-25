import 'package:flutter/material.dart';
import 'package:post/classes/words.dart';
import 'package:provider/provider.dart';

class Wordcard extends StatelessWidget {
  const Wordcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Word _word = Provider.of(context);
    return ListTile(
      title: Text(_word.eng),
      subtitle: Text(_word.ar),
      trailing: IconButton(
        onPressed: () {
          Provider.of<Words>(context, listen: false).removeword(_word.id);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
