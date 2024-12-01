// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/main.dart';

Future<void> tapButtonAndVerify(tester, input) async{
  await tester.tap(find.text('$input'));
  await tester.pump();
  expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('$input'), isTrue);

  await tester.tap(find.text('C'));
  await tester.pump();
  String res = find.byKey(Key('userQuestion')).evaluate().single.widget.toString();
  expect(res[24], '\"');
  expect(res[25], '\"');
}

Future<void> verifyExpression(tester, input, answer) async {
  for (int i = 0; i < input.length; i++) {
    String char = input[i];
    await tester.tap(find.text(char));
    await tester.pump();
    String res = find.byKey(Key('userQuestion')).evaluate().single.widget.toString();
    String test_string = res.substring(0 + 'Text-[<\'userQuestion\'>]('.length, res.length - ', inherit: true, color: Color(0xff311b92), size: 48.0, weight: 700)'.length);
    String current_last_char = test_string[test_string.length - 2];
    expect(current_last_char, '$char');
  }

  await tester.tap(find.text('='));
  await tester.pump();

  String res = find.byKey(Key('userAnswer')).evaluate().single.widget.toString();

  String test_string = res.substring(1 + 'Text-[<\'userAnswer\'>]('.length, res.length - ', inherit: true, color: Color(0xff311b92), size: 48.0, weight: 700)'.length - 1);
  expect(test_string, '$answer');

  await tester.tap(find.text('C'));
  await tester.pump();
  String res2 = find.byKey(Key('userQuestion')).evaluate().single.widget.toString();
  expect(res2[24], '\"');
  expect(res2[25], '\"');}

Future<void> verifyANS(tester, input) async {
  for (int i = 0; i < input.length; i++) {
    String char = input[i];
    await tester.tap(find.text(char));
    await tester.pump();
    String res = find.byKey(Key('userQuestion')).evaluate().single.widget.toString();
    String test_string = res.substring(0 + 'Text-[<\'userQuestion\'>]('.length, res.length - ', inherit: true, color: Color(0xff311b92), size: 48.0, weight: 700)'.length);
    String current_last_char = test_string[test_string.length - 2];
    expect(current_last_char, '$char');
  }

  await tester.tap(find.text('='));
  await tester.pump();

  await tester.tap(find.text('ANS'));
  await tester.pump();

  String question = find.byKey(Key('userQuestion')).evaluate().single.widget.toString();
  String answer = find.byKey(Key('userAnswer')).evaluate().single.widget.toString();

  String test_string = question.substring(1 + 'Text-[<\'userQuestion\'>]('.length, question.length - ', inherit: true, color: Color(0xff311b92), size: 48.0, weight: 700)'.length - 1);
  String test_string2 = answer.substring(1 + 'Text-[<\'userAnswer\'>]('.length, answer.length - ', inherit: true, color: Color(0xff311b92), size: 48.0, weight: 700)'.length - 1);
  expect(test_string, test_string2);

  await tester.tap(find.text('C'));
  await tester.pump();
  String res = find.byKey(Key('userQuestion')).evaluate().single.widget.toString();
  expect(res[24], '\"');
  expect(res[25], '\"');
}

Future<void> delAndVerify(tester) async{
  await tester.tap(find.text('1'));
  await tester.pump();
  expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1'), isTrue);

  await tester.tap(find.text('2'));
  await tester.pump();
  expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('12'), isTrue);

  await tester.tap(find.text('DEL'));
  await tester.pump();
  String res = find.byKey(Key('userQuestion')).evaluate().single.widget.toString();
  expect(res[24], '\"');
  expect(res[25], '1');
  expect(res[26], '\"');
}

void main() {
  testWidgets('Test number buttons', (WidgetTester tester) async {

    await tester.pumpWidget(const MyApp());


    List<String> buttons = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.', '+', '-', '*', '/', '(', ')', '%'];
for (String button in buttons) {
  await tapButtonAndVerify(tester, button);
}

    await verifyExpression(tester, "(1/2)+(10-3)-(2*2)", "3.5");
    await verifyANS(tester, "(1/2)+(10-3)-(2*2)");

    await delAndVerify(tester);


  });
}
