import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'home.dart';
import 'cadastro.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }

}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cinema Por Menos'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 16.0),
                Text('\n\n\nBem vindo de volta\n\nAcesse sua conta agora',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Usuário',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Senha',
              ),
              obscureText: true,
            ),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Entrar'),
                  onPressed: () {
                    _login();

                  },
                ),
                TextButton(
                  child: const Text('Esqueceu a senha?'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
              ],
            ),
            TextButton(
              child: const Text('\n\n\nInscreva-se',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CadastroPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

    // void _login() async {
    //   final response = await http.post(Uri.parse('http://10.0.2.2:8081/login'));
    //   print(jsonDecode(response.body));
    //   print(_usernameController.text);
    //   print(_passwordController.text);
    // }

  void _login() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8081/login'),
      body: {'email': _usernameController.text, 'senha': _passwordController.text},
    );
    if(response != null){
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()),
      );
    }
    print(jsonDecode(response.body));
  }

}
