import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CinemasWidget extends StatefulWidget {
  final int filmeId;

  const CinemasWidget({Key? key, required this.filmeId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CinemasWidgetState();
  }
}

class _CinemasWidgetState extends State<CinemasWidget> {
  late String sinopse = "";
  late String titulo = "";
  late String filmeCinepolis = "";
  late String filmeCinemark = "";

  @override
  void initState() {
    super.initState();
    if (widget.filmeId == 0) {
      setState(() {
        titulo = 'Guardiões da Galáxia';
        filmeCinepolis = '12502-guardioes-da-galaxia-volume-3.html';
        filmeCinemark = 'guardioes-da-galaxia-vol-3';
      });
    }
    if (widget.filmeId == 1) {
      setState(() {
        titulo = 'Velozes e Furiosos';
        filmeCinepolis = '14755-velozes-e-furiosos-10.html';
        filmeCinemark = 'velozes-e-furiosos-10';
      });
    }

    if (widget.filmeId == 2) {
      setState(() {
        titulo = 'Homem Aranha';
        filmeCinepolis = '14458-homem-aranha-atraves-do-aranhaverso.html';
        filmeCinemark = 'homem-aranha-atraves-do-aranhaverso';
      });
    }

    if (widget.filmeId == 3) {
      setState(() {
        titulo = 'Transformers';
        filmeCinepolis = '8029-transformers-o-despertar-das-feras.html';
        filmeCinemark = 'transformers-o-despertar-das-feras';
      });
    }

    if (widget.filmeId == 4) {
      setState(() {
        titulo = 'Flash';
        filmeCinepolis = '7791-the-flash.html';
        filmeCinemark = 'flash';
      });
    }

    if (widget.filmeId == 5) {
      setState(() {
        titulo = 'Mario';
        filmeCinepolis = '14794-super-mario-bros--o-filme-.html';
        filmeCinemark = 'super-mario-bros-o-filme';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Image(
                    image: AssetImage(
                      'assets/filme_${widget.filmeId}.png',
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _abrirNavegador(
                          'https://www.cinepolis.com.br/filme/$filmeCinepolis');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text('Cinepolis 3.5km'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _abrirNavegador(
                          'https://www.cinemark.com.br/filme/$filmeCinemark');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text('Cinemark 500m'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            tooltip: 'Página inicial',
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            tooltip: 'Sobre',
            icon: Icon(Icons.menu),
            label: 'Sobre',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
          } else if (index == 2) {
            _sobre(context);
          }
        },
      ),
    );
  }

  Future<void> _abrirNavegador(url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> _sobre(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre o\nCinema Por\nMenos'),
          content: const Text('Somos um aplicativo voltado '
              'ao conforto dos usuários onde '
              'possibilitamos que os usuários '
              'tenham a liberdade de localizar '
              'o cinema mais próximo ou dar a '
              'opção para que vejam a '
              'programação de diversos '
              'cinemas e deixar que assim o '
              'cliente escolha a melhor opção '
              'para atendê-lo.\n\n'
              'Para que você não precise ter '
              '10 ou mais aplicativos, venha para '
              'o Cinema Por Menos!'),
          actions: <Widget>[
            TextButton(
              child: const Text('Voltar'),
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
