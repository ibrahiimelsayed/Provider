import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Words {
  String eng, ar;
  Words({
    required this.eng,
    required this.ar,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Words',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WordsApp(),
    );
  }
}

class WordsApp extends StatefulWidget {
  const WordsApp({Key? key}) : super(key: key);

  @override
  State<WordsApp> createState() => _WordsAppState();
}

class _WordsAppState extends State<WordsApp> {
  List words = [Words(eng: 'Cat', ar: 'قط'), Words(eng: 'Dog', ar: 'كلب')];
  TextEditingController engController = TextEditingController();
  TextEditingController arController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        itemBuilder: (context, index) {
          return ListTile(
            trailing: IconButton(
                onPressed: () => setState(() {
                      words.remove(words[index]);
                    }),
                icon: const Icon(Icons.delete)),
            title: Text(words[index].eng),
            subtitle: Text(words[index].ar),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
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
                        onPressed: () => setState(() {
                              words.add(Words(
                                  eng: engController.text,
                                  ar: arController.text));
                              Navigator.pop(context);
                            }))
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
