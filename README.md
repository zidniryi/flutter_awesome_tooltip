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

# flutter_awesome_tooltip
easy-to-use and lightweight flutter tooltip library

## Features

Tooltip library for Flutter

## Getting started

Option | Type | Default | Description
--- | --- | --- | ---
|[`message`](#message) | `String` | `` | String text tooltip.|
|[`child`](#child) | `Widget` | `child` | for icon or others child stuff
|[`direction`](#direction) | `Enum` | `LibraryTooltipDirection` | direction for tooltip
|[`closeButtonStyle`](#closeButtonStyle) | `style` | `style` | style for input close x
|[`TextStyle`](#TextStyle) | `TextStyle` | `style` | style for text tooltip
|[`Color`](#Color) | `Color` | `Color` | Color Text


## Usage

For use this just install then follow the code below

```dart
import 'package:flutter/material.dart';
import 'package:flutter_awesome_tooltip/flutter_awesome_tooltip.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FlutterAwesomeTooltip(
        message: 'This is a tooltip',
        child: Icon(Icons.info),
        direction: LibraryTooltipDirection.top,
      ),
    );
  }
}

```

## Additional information

More information : https://github.com/zidniryi/flutter_awesome_tooltip
