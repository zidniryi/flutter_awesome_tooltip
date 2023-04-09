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
