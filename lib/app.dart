import 'package:flutter/material.dart';
import 'package:cinema_app/cadastro.dart';
import 'package:cinema_app/filme_1.dart';
import 'package:cinema_app/filme_2.dart';
import 'package:cinema_app/filme_3.dart';
import 'package:cinema_app/filme_4.dart';
import 'package:cinema_app/filme_5.dart';
import 'package:cinema_app/filme_6.dart';

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
        '/cadastro' : (BuildContext context) => const CadastroPage(),
        '/filme_0' : (BuildContext context) => const FilmePageOne(),
        '/filme_1' : (BuildContext context) => const FilmePageTwo(),
        '/filme_2' : (BuildContext context) => const FilmePageThree(),
        '/filme_3' : (BuildContext context) => const FilmePageFour(),
        '/filme_4' : (BuildContext context) => const FilmePageFive(),
        '/filme_5' : (BuildContext context) => const FilmePageSix(),
      },
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}