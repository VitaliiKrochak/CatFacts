import 'dart:_http';

import 'package:cat_facts_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:_http';
import 'package:cat_facts_app/main.dart';
import 'package:get/get.dart';
import 'package:get_test/get_test.dart';

void main() {
  getTest(
      "test description",
      widgetTest: (tester) async {
        setUpAll(() => HttpOverrides.global = null);
        await tester.pumpWidget(GetMaterialApp(home:Home()));

        // Create the Finders.
        final titleFinder = find.text('History');

        // Use the findsOneWidget matcher provided by flutter_test to
        // verify that the Text widgets appear exactly once in the widget tree.
        expect(titleFinder, findsOneWidget);

        // final button = find.byKey(const ValueKey('History'));
        // await tester.pumpWidget(GetMaterialApp(home:Home()));
        // await tester.tap(button);
        // await tester.pump();
        // expect(find.text, findsOneWidget);

        // await tester.pumpWidget(const MyApp());
        // expect(find.text('0'), findsOneWidget);
        // expect(find.text('1'), findsNothing);
        // await tester.tap(find.byIcon(Icons.add));
        // await tester.pump();
        // expect(find.text('0'), findsNothing);
        // expect(find.text('1'), findsOneWidget);
      });
}