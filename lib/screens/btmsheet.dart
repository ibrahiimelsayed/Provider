import 'package:flutter/material.dart';
import 'package:post/classes/words.dart';
import 'package:provider/provider.dart';

class Btmsheet extends StatefulWidget {
  final int id;
  const Btmsheet(this.id, {Key? key}) : super(key: key);

  @override
  State<Btmsheet> createState() => _BtmsheetState();
}

class _BtmsheetState extends State<Btmsheet> {
  var engController = TextEditingController();
  var arController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'ADD NEW WORD',
            style: TextStyle(fontSize: 35),
          ),
          TextField(
            controller: engController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('ENG'),
                hintText: 'ENTER ENG WORD'),
          ),
          TextField(
              controller: arController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('AR'),
                  hintText: 'ENTER AR WORD')),
          MaterialButton(
              minWidth: double.infinity,
              color: Colors.blue,
              child: const Text('ADD'),
              onPressed: () {
                Provider.of<Words>(context, listen: false).addword(
                    widget.id + 1, engController.text, arController.text);
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
