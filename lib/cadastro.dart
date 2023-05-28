import 'package:flutter/material.dart';
import 'package:cinema_app/login.dart';

import 'package:http/http.dart' as http;

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CadastroPage();
  }
}

class _CadastroPage extends State<CadastroPage> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  String _selectedPergunta =
      'Qual é o nome do seu pet?'; // Variável para armazenar a pergunta selecionada
  String _respostaRecuperacao = '';

  final List<String> perguntas = [
    'Qual é o nome do seu pet?',
    'Qual é o seu time de futebol?',
    'Qual é a sua cidade natal?',
    'Qual é o seu melhor amigo?',
    'Qual é o seu filme favorito?'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Cadastro'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(height: 12),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'E-mail',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _senhaController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Crie uma senha',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _selectedPergunta,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Pergunta secreta',
                  ),
                  items: perguntas.map((pergunta) {
                    return DropdownMenuItem<String>(
                      value: pergunta,
                      child: Text(pergunta),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPergunta = value!;
                    });
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Resposta para recuperar senha',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _respostaRecuperacao = value;
                    });
                  },
                ),
                OverflowBar(
                  alignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text('Cadastrar'),
                      onPressed: () {
                        cadastro();
                      },
                    ),
                    TextButton(
                      child: const Text('CANCEL'),
                      onPressed: () {
                        _emailController.clear();
                        _senhaController.clear();
                      },
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> cadastro() async {
    var url = Uri.parse('http://192.168.100.162:8081/cadastro');
    var response = await http.post(
      url,
      body: {
        'email': _emailController.text,
        'senha': _senhaController.text,
        'pergunta': _selectedPergunta,
        'resposta': _respostaRecuperacao
      },
    );
    if (response.body == "") {
      _showMyDialog();
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Usuário já existe!'),
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
