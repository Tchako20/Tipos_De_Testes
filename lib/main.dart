import 'package:flutter/material.dart';
import 'package:testes_alura/data/bank_http.dart';
import 'package:testes_alura/screens/home.dart';
import 'package:testes_alura/themes/purple_theme.dart';

import 'data/bank_inherited.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: purpleTheme,
      home: BankInherited(child: Home(api: BankHttp().dolarToReal(),)),
    );
  }
}