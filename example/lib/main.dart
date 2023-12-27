import 'package:flutter/material.dart';
import 'package:simple_item_selector/simple_item_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(body: Home()),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ItemSelector(
        direction: Direction.vertical,
        activeBackgroundColor: Colors.amberAccent,
        inactiveBackgroundColor: Colors.grey[300],
        itemMargin: const EdgeInsets.all(2.0),
        itemPadding: const EdgeInsets.all(15.0),
        itemBorderRadius: const BorderRadius.all(Radius.circular(5.0)),
        itemsCount: 4, // should be <= items.length
        items: const [Text('a1'), Text('a2'), Text('a3'), Text('a4')], // any arbitrary widget list
        onSelected: (index) {
          // you can access selected item index here!
          print(index);
        },
      ),
    );
  }
}
