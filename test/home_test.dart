import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:testes_alura/components/box_card.dart';
import 'package:testes_alura/data/bank_http.mocks.dart';
import 'package:testes_alura/data/bank_inherited.dart';
import 'package:testes_alura/screens/home.dart';

void main() {
  final MockBankHttp httpMock = MockBankHttp();
  //TESTES DE WIDGETS
  testWidgets('My widget has a text "Spent"', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: Home(api: httpMock.dolarToReal())),
    ));
    final spentFinder = find.text('Spent');

    expect(spentFinder, findsOneWidget);
  });
  testWidgets('finds a LinearProgressIndicator', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: Home(api: httpMock.dolarToReal())),
    ));
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });
  testWidgets('finds AccountStatus', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api: httpMock.dolarToReal()),
      ),
    ));
    expect(find.byKey(Key('testKey')), findsOneWidget);
  });
  testWidgets('finds 5 BoxCards ', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api: httpMock.dolarToReal()),
      ),
    ));
    expect(find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      } else {
        return false;
      }
    }), findsNWidgets(5));
  });
  testWidgets('My widget has a text Deposit ', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));
    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));
    await tester.pumpAndSettle();

    expect(find.text('\$10.0'), findsOneWidget);
  });
  testWidgets('Testing MockHttp dolarToReal', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));
    verify(httpMock.dolarToReal()).called(6);
  });
}
