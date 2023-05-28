import 'package:flutter/material.dart';
import 'package:cinema_app/cadastro.dart';
import 'home.dart';
import 'login.dart';

class CinemaApp extends StatelessWidget {
  const CinemaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CinemaApp',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/home': (BuildContext context) => const Home(),
        '/cadastro': (BuildContext context) => const CadastroPage(),
      },
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}
