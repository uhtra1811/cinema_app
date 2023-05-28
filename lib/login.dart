import 'package:cinema_app/recuperar.dart';
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
                Text(
                  '\n\n\nBem vindo de volta\n\nAcesse sua conta agora',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
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
                    _recuperar();
                  },
                ),
              ],
            ),
            TextButton(
              child: const Text(
                '\n\n\nInscreva-se',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CadastroPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    var url = Uri.parse('http://192.168.100.162:8081/login');
    var response = await http.post(url, body: {
      'email': _usernameController.text,
      'senha': _passwordController.text
    });
    if (response.body == "") {
      _showMyDialog();
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    }
  }

  Future<void> _recuperar() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RecuperarPage()));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Usuário ou senha inválido, tente novamente!'),
          content: const SingleChildScrollView(),
          actions: <Widget>[
            TextButton(
              child: const Text('Tentar novamente'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
