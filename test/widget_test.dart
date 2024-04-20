import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_t/main.dart'; // Make sure this import matches your project structure

void main() {
  testWidgets('Greeting Page smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the greeting message is displayed.
    expect(find.text('Welcome to the Flutter Tools App!'), findsOneWidget);

    // You might want to test navigation to another page; for example, let's assume there is a button that leads to the Calculator page.
    // First, find the button by key or by text if there's no specific key.
    final buttonFinder = find.text('Go to Calculator');
    expect(buttonFinder, findsOneWidget);

    // Tap the button and trigger a frame.
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle(); // Wait for any animations to complete.

    // Verify that after navigation, you're now on the Calculator page.
    // This assumes you have some identifiable text or widget on the Calculator page.
    expect(find.text('Calculator'), findsOneWidget);
  });
}
