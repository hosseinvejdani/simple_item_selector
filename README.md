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

This is a simple item selector widget. you can pass any list of widgets as your items in horizental or vertical axis directions. user can select one of them with a simple tap.


## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
import 'package:flutter/material.dart';
import 'package:simple_item_selector/simple_item_selector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Center(
              child: ItemSelector(
                activeBackgroundColor: Colors.amberAccent,
                inactiveBackgroundColor: Colors.grey[200],
                padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.all(2.0),
                initIndex: 0,
                itemsCount: 3,
                items: [Text('a1'), Text('a2'), Text('a3')],
                onSelected: (index) {
                  // the selected index can be accessed via this mehtod!
                  // print('= = => $index');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
