import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cinema_app/login.dart';

import 'package:http/http.dart' as http;

class CadastroPage extends StatefulWidget{
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CadastroPage();
  }
}

class _CadastroPage extends State<CadastroPage> {
  final _usernameController = TextEditingController();
  final _datanascimentoController = TextEditingController();
  final _cpfContrroller = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmacaoemailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmacaosenhaController = TextEditingController();
  
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
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Nome',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _datanascimentoController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Data de Nascimento',
                  ),
                ),
               const SizedBox(height: 12),
                TextField(
                  controller: _cpfContrroller,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'CPF',
                  ),
                ),
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
                  controller: _confirmacaoemailController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Confirmação do E-mail',
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
                TextField(
                  controller: _confirmacaosenhaController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Confirme a senha',
                  ),
                  obscureText: true,
                ),
                OverflowBar(
                  alignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text('Entrar'),
                      onPressed: () {
                        cadastro();
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => const LoginPage())
                          );
                      },
                    ),
                    TextButton(
                      child: const Text('CANCEL'),
                      onPressed: () {
                        _usernameController.clear();
                        _datanascimentoController.clear();
                        _cpfContrroller.clear();
                        _emailController.clear();
                        _confirmacaoemailController.clear();
                        _senhaController.clear();
                        _confirmacaosenhaController.clear();
                      },)
                  ],
                )
              ],
            )
          ],
        )),
    );
  }

  void cadastro() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8081/login'),
      body: {'email': _usernameController.text, 'senha': _senhaController.text},
    );
    print(jsonDecode(response.body));
  }

}
