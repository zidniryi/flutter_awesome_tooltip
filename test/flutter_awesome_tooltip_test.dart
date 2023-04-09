import 'package:flutter/material.dart';
import 'package:flutter_awesome_tooltip/flutter_awesome_tooltip.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LibraryTooltip should show a tooltip on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FlutterAwesomeTooltip(
            message: 'This is a tooltip message',
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );

    // The tooltip should not be visible initially
    expect(find.byType(Tooltip), findsNothing);

    // Tap on the child widget to show the tooltip
    await tester.tap(find.byType(Container));
    await tester.pumpAndSettle();

    // The tooltip should now be visible
    expect(find.byType(Tooltip), findsOneWidget);

    // Dismiss the tooltip by tapping on the screen
    await tester.tap(find.byType(Material));
    await tester.pumpAndSettle();

    // The tooltip should be hidden again
    expect(find.byType(Tooltip), findsNothing);
  });
}
