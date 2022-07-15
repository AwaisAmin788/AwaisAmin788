import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'View All Tasbeeh';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: null,
            child: const Text('لَا إِلَٰهَ إِلَّا ٱللَّٰهُ'),
          ),
          ElevatedButton(
            style: style,
            onPressed: null,
            child: const Text('لَا إِلَٰهَ إِلَّا ٱللَّٰهُ'),
          ),
          ElevatedButton(
            style: style,
            onPressed: null,
            child: const Text('لَا إِلَٰهَ إِلَّا ٱللَّٰهُ'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text(' سبحان الله'),
          ),
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('  الحمد لله'),
          ),
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('الله أكبر'),
          ),
          ElevatedButton(
            style: style,
            onPressed: null,
            child: const Text('لَا إِلَٰهَ إِلَّا ٱللَّٰهُ'),
          ),
          ElevatedButton(
            style: style,
            onPressed: null,
            child: const Text('لَا إِلَٰهَ إِلَّا ٱللَّٰهُ'),
          ),
          ElevatedButton(
            style: style,
            onPressed: null,
            child: const Text('لَا إِلَٰهَ إِلَّا ٱللَّٰهُ'),
          ),
        ],
      ),
    );
  }
}
