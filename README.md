<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This package contains ItemSelector(), a simple scrollable item selector widget. when developers have a list of items or widgets, then they can use ItemSelector() widget to build a simple and beautiful item selector in Flutter App. 

## Features
Developers can pass any arbitrary list of widgets as items in horizontal or vertical axis directions. And Users can iteract with items and they can select one of them with a simple tap. Developer have access to the index of the selected item with onSelected attribute.

## Getting started

To use this package, add simple_item_selector as a dependency in your pubspec.yaml file. Then import the package like this:
```
import 'package:simple_item_selector/simple_item_selector.dart';
```

## Usage
This is Simple example:

```dart
ItemSelector(
  direction: Direction.horizental,
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
)
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.