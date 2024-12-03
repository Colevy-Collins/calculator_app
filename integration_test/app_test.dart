// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/main.dart';
import 'package:integration_test/integration_test.dart';
import 'package:calculator/base_project/command_export.dart';

Future<void> tapButtonAndVerify(tester, input) async {
  await tester.tap(find.widgetWithText(MyButton, input));
  await tester.pumpAndSettle();
   

  expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('$input'), isTrue);
}

void main() async {

  await IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() {
    // Cleanup actions after each test
    TestWidgetsFlutterBinding.ensureInitialized().reset();
  });

    testWidgets('Test just square root', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      //Test just square root
      await tester.tap(find.text('√'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sqrt('), isTrue);

      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('5.0'), isTrue);


    });
    testWidgets('Test square root with expression and without operator', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '1');
        await tester.pumpAndSettle();
  


      await tester.tap(find.text('√'));
        await tester.pumpAndSettle();
  


      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');


      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('5.0'), isTrue);
      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1*sqrt(25)'), isTrue);



    });
    testWidgets('Test nested square root', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('√'));
        await tester.pumpAndSettle();
  

      await tester.tap(find.text('√'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sqrt('), isTrue);

      await tapButtonAndVerify(tester, '6');
      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  


      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('5.0'), isTrue);


    });
    testWidgets("Test square root with nested expression", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('√'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sqrt('), isTrue);

      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('5.0'), isTrue);


    });
    testWidgets("Test unclosed square root", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('√'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sqrt('), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Unmatched parenthesis'), isTrue);


    });
    testWidgets("Test square root invalid expression", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('√'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, ")");

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sqrt()'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);


    });

    testWidgets('Test just power', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '2');

      await tester.tap(find.text('xʸ'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '2');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('^'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('4.0'), isTrue);



    });
    testWidgets('Test power with expressions', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '*');
      await tapButtonAndVerify(tester, '2');


      await tester.tap(find.text('xʸ'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '2');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('88.0'), isTrue);



    });
    testWidgets('Test nested power', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '2');

      await tester.tap(find.text('xʸ'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '2');

      await tester.tap(find.text('xʸ'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '2');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('16.0'), isTrue);



    });
    testWidgets('Test power with nest expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '2');

      await tester.tap(find.text('xʸ'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '2');

      await tapButtonAndVerify(tester, '+');

      await tapButtonAndVerify(tester, '2');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('6.0'), isTrue);



    });
    testWidgets('Test power expression error', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('xʸ'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('^'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);



    });

  testWidgets('Test pie and ±', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('π'));
    await tester.pump();

    await tester.tap(find.text('='));
    await tester.pump();

    await tester.tap(find.text('±'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('-3.141592653589793'), isTrue);
    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('3.141592653589793'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });

    testWidgets('Test just ln', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('ln('));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('ln('), isTrue);

      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('3.2188758248682006'), isTrue);


    });
    testWidgets('Test single ln', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('ln('));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('ln('), isTrue);

      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('ln('));
        await tester.pumpAndSettle();
  

      expect(RegExp(r'ln\(').allMatches(find.byKey(Key('userQuestion')).evaluate().single.widget.toString()).length == 1, isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('3.2188758248682006'), isTrue);


    });
    testWidgets('Test ln with expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '1');
      await tester.tap(find.text('ln('));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('ln('), isTrue);

      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '5');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1ln(25)+5'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1*ln(25)+5'), isTrue);

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('8.218875824868201'), isTrue);


    });
    testWidgets('Test ln with nested expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('ln('));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('ln('), isTrue);

      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('1.9459101490553132'), isTrue);


    });
    testWidgets('Test ln with invalid expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('ln('));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('ln('), isTrue);

      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);


    });

    testWidgets('Test just n!', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('!('));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('!'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('120.0'), isTrue);


    });
    testWidgets('Test n! with expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '1');

      await tester.tap(find.text('!('));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');

      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '5');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('!'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('125.0'), isTrue);


    });
    testWidgets('Test n! nested', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.widgetWithText(MyButton, "!("));
        await tester.pumpAndSettle();
  

      await tester.tap(find.widgetWithText(MyButton, "!("));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '3');
      await tapButtonAndVerify(tester, ')');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('720.0'), isTrue);


    });
    testWidgets('Test n! with nested expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('!('));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '3');
      await tapButtonAndVerify(tester, ')');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('!'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('120.0'), isTrue);


    });
    testWidgets('Test n! with invalid expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('!('));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, ')');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('!'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);


    });

    testWidgets('Test just Log10', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('Log10()'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('Log10('), isTrue);

      await tapButtonAndVerify(tester, '1');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('Log10(10)'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('1.0'), isTrue);


    });
    testWidgets('Test Log10 with expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '1');

      await tester.tap(find.text('Log10()'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('Log10('), isTrue);

      await tapButtonAndVerify(tester, '1');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '5');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1Log10(10)+5'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('6.0'), isTrue);


    });
    testWidgets('Test Log10 nested', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('Log10()'));
        await tester.pumpAndSettle();
  

      await tester.tap(find.text('Log10()'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '1');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');
      await tapButtonAndVerify(tester, '*');
      await tapButtonAndVerify(tester, '1');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('1.0'), isTrue);


    });
    testWidgets('Test Log10 with nested expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('Log10()'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '3');
      await tapButtonAndVerify(tester, ')');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('Log10(2+3)'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.6989700043360187'), isTrue);


    });
    testWidgets('Test Log10 with invalid expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('Log10()'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, ')');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('Log10('), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);


    });

    testWidgets('Test e', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('1'));

      await tester.tap(find.text('e'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('e'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('2.718281828459045'), isTrue);
    });
    testWidgets('Test errors with e', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('e'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('e'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);
    });

    testWidgets('Test just squared', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '2');

      await tester.tap(find.text('x²'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('^2'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('4.0'), isTrue);



    });
    testWidgets('Test squared with expressions', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '*');
      await tapButtonAndVerify(tester, '2');


      await tester.tap(find.text('x²'));
        await tester.pumpAndSettle();
  

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('88.0'), isTrue);



    });
    testWidgets('Test nested squared', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '2');

      await tester.tap(find.text('x²'));
        await tester.pumpAndSettle();
  

      await tester.tap(find.text('x²'));
        await tester.pumpAndSettle();
  

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('16.0'), isTrue);



    });
    testWidgets('Test squared with nest expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '2');

      await tester.tap(find.text('x²'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '+');

      await tapButtonAndVerify(tester, '2');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('6.0'), isTrue);



    });
    testWidgets('Test squared expression error', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('x²'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('^2'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);



    });

    testWidgets('Test just sin', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('sin'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sin('), isTrue);

      await tapButtonAndVerify(tester, '9');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.8939966636005579'), isTrue);


    });
    testWidgets('Test sin with expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '1');

      await tester.tap(find.text('sin'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sin('), isTrue);

      await tapButtonAndVerify(tester, '9');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '5');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1sin(90)+5'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1*sin(90)+5'), isTrue);

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('5.893996663600558'), isTrue);


    });
    testWidgets('Test nested sin', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('sin'));
        await tester.pumpAndSettle();
  

      await tester.tap(find.text('sin'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '9');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.77958108276669'), isTrue);


    });
    testWidgets('Test sin with nest expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('sin'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '9');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.683261714736121'), isTrue);


    });
    testWidgets('Test sin with invalid expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('sin'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, ')');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sin()'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);


    });

    testWidgets('Test just cos', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('cos'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('cos('), isTrue);

      await tapButtonAndVerify(tester, '9');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('-0.4480736161291701'), isTrue);


    });
    testWidgets('Test cos with expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '1');

      await tester.tap(find.text('cos'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('cos('), isTrue);

      await tapButtonAndVerify(tester, '9');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '5');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1cos(90)+5'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  
      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1*cos(90)+5'), isTrue);

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('4.55192638387083'), isTrue);


    });
    testWidgets('Test nested cos', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('cos'));
        await tester.pumpAndSettle();
  

      await tester.tap(find.text('cos'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '9');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.9012833416649748'), isTrue);


    });
    testWidgets('Test cos with nest expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('cos'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '9');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.7301735609948197'), isTrue);


    });
    testWidgets('Test cos with invalid expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('cos'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, ')');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('cos()'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);


    });

    testWidgets('Test just tan', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('tan'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('tan('), isTrue);

      await tapButtonAndVerify(tester, '9');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('-1.995200412208242'), isTrue);


    });
    testWidgets('Test tan with expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '1');

      await tester.tap(find.text('tan'));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('tan('), isTrue);

      await tapButtonAndVerify(tester, '9');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '5');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1tan(90)+5'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1*tan(90)+5'), isTrue);

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('3.0047995877917577'), isTrue);


    });
    testWidgets('Test nested tan', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('tan'));
        await tester.pumpAndSettle();
  

      await tester.tap(find.text('tan'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '9');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, ')');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('2.2130485494893297'), isTrue);


    });
    testWidgets('Test tan with nest expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('tan'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, '9');
      await tapButtonAndVerify(tester, '0');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '5');
      await tapButtonAndVerify(tester, ')');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.9357524720632393'), isTrue);


    });
    testWidgets('Test tan with invalid expression', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('tan'));
        await tester.pumpAndSettle();
  

      await tapButtonAndVerify(tester, ')');

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('tan()'), isTrue);

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);


    });

    testWidgets('Test M+', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tapButtonAndVerify(tester, '2');
      await tapButtonAndVerify(tester, '+');
      await tapButtonAndVerify(tester, '2');

      await tester.tap(find.text('='));
        await tester.pumpAndSettle();
  

      await tester.tap(find.text('M+'));
        await tester.pumpAndSettle();
  

      await tester.tap(find.text('+'));
        await tester.pumpAndSettle(); 
  

      await tester.tap(find.text('M+'));
        await tester.pumpAndSettle();

      await tester.tap(find.text('='));
      await tester.pumpAndSettle();
  

      expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('2+2+4.0'), isTrue);

      expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('8.0'), isTrue);


    });

    testWidgets('Test settings pop up', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    expect(find.text('Change Menu Color to Blue'), findsOneWidget);
  });
    testWidgets('Test settings change color', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Change Menu Color to Blue'));
    await tester.pumpAndSettle();

    expect((tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor), equals(Colors.blue.withOpacity(0.2)));
  });
    testWidgets('Test settings with expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    await tester.tap(find.text("Change Menu Color to Blue"));
    await tester.pumpAndSettle();

    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('='));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('4.0'), isTrue);
  });
}