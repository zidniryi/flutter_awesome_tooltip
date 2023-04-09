library flutter_awesome_tooltip;

import 'package:flutter/material.dart';

enum LibraryTooltipDirection {
  top,
  bottom,
  left,
  right,
}

class FlutterAwesomeTooltip extends StatelessWidget {
  final String message;
  final Widget child;
  final LibraryTooltipDirection direction;
  final TextStyle textStyle;
  final Color backgroundColor;
  final double borderRadius;
  final double padding;
  final double margin;

  const FlutterAwesomeTooltip({
    Key? key,
    required this.message,
    required this.child,
    this.direction = LibraryTooltipDirection.top,
    this.textStyle = const TextStyle(fontSize: 14),
    this.backgroundColor = Colors.grey,
    this.borderRadius = 8,
    this.padding = 8,
    this.margin = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      textStyle: textStyle,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.all(padding),
      margin: EdgeInsets.all(margin),
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              final RenderBox renderBox =
                  context.findRenderObject() as RenderBox;
              final Offset offset = renderBox.localToGlobal(Offset.zero);
              final Size size = renderBox.size;
              final center = Offset(
                  offset.dx + size.width / 2, offset.dy + size.height / 2);
              showCustomTooltip(context, center);
            },
            child: child,
          );
        },
      ),
    );
  }

  void showCustomTooltip(BuildContext context, Offset center) {
    final overlayState = Overlay.of(context)!;
    final theme = Theme.of(context);
    final bgColor = backgroundColor ?? theme.backgroundColor;
    final borderColor = theme.dividerColor;
    final borderRadius = BorderRadius.circular(this.borderRadius);

    final tooltip = OverlayEntry(
      builder: (BuildContext context) {
        return SizedBox(
          width: 0,
          height: 0,
          child: Align(
            alignment: direction == LibraryTooltipDirection.bottom
                ? Alignment.topCenter
                : direction == LibraryTooltipDirection.top
                    ? Alignment.bottomCenter
                    : direction == LibraryTooltipDirection.right
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: borderRadius,
                  border: Border.all(
                    color: borderColor,
                  ),
                ),
                padding: EdgeInsets.all(padding),
                child: Text(
                  message,
                  style: textStyle,
                ),
              ),
            ),
          ),
        );
      },
    );

    overlayState.insert(tooltip);
  }
}
