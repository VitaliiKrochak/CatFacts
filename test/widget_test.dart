import 'package:cat_facts_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home:Home()));
    await tester.tap(find.byKey(const Key('click')));
    final titleFinder = find.text;
    expect(titleFinder, findsOneWidget);
  });
}