import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/* Stateless Widget
 * Immutable하여 속성들이 변하지 않는다. 즉, 해당 value들은 모두 final 변수이다.
 * 변하는 widget을 만들고 싶으면 Stateful widget을 이용해야 한다.
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

/*
 * Stateful widget
 * Create Stateful widget with stful keyword
 */

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggetions = <WordPair>[];
  final _biggetFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggetions.length) {
          _suggetions.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _suggetions[index].asPascalCase,
            style: _biggetFont,
          ),
        );
      },
    );
  }
}
