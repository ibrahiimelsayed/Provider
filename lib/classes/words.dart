import 'package:flutter/cupertino.dart';

class Word with ChangeNotifier {
  String eng, ar;
  int id;
  Word({
    required this.id,
    required this.eng,
    required this.ar,
  });
}

class Words with ChangeNotifier {
  final List<Word> _words = [Word(id: 1, eng: 'eng', ar: 'ar')];
  List<Word> get words => [..._words];

  void removeword(int id) {
    _words.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void addword(int id, String eng, String ar) {
    _words.add(Word(id: id, eng: eng, ar: ar));
    notifyListeners();
  }
}
