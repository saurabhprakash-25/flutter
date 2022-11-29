import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class RandomWord extends StatefulWidget {
  const RandomWord({Key? key}) : super(key: key);

  @override
  State<RandomWord> createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final _suggestions = <WordPair> [];
  final _biggerfont  = const TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title : const Text ("Startup Namer")
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions () {

    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int i) {

          if (i.isOdd) {

            return const Divider ();
          }

          final index = i ~/2;

          if (index >= _suggestions.length) {

            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow (_suggestions[index]);
        }
    );
  }

  Widget _buildRow (WordPair pair) {

    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerfont),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Startup Namer',
      home: RandomWord (),
    );
  }
}
