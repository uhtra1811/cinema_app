import 'package:flutter/material.dart';
import 'cinemas.dart';

class FilmePageOne extends StatefulWidget {
  const FilmePageOne({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FilmePageOneState();
  }
}

class _FilmePageOneState extends State<FilmePageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHAZAM!'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView(
            children: const <Widget>[
              Image(image: AssetImage('assets/filme_0.png')),
              Text('Sinopse: '
                  'SHAZAM! 2 continua a história do adolescente Billy Batson '
                  'que, ao recitar a palavra mágica SHAZAM! é atingido pelo Relâmpago '
                  'Vivo dos deuses e transformado em seu alter ego de super-herói adulto, '
                  'Shazam.'),
              SizedBox(width: 217.0, height: 359),
            ],
          )),
      bottomNavigationBar: NavigationBar(
        destinations: <IconButton>[
          IconButton(
            tooltip: 'Pagina inicial',
            icon: const Icon(Icons.home),
            selectedIcon: const Icon(Icons.home_outlined),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Cinemas',
            icon: const Icon(Icons.movie),
            selectedIcon: const Icon(Icons.movie_outlined),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CinemasWidget()));
            },
          ),
          IconButton(
              tooltip: 'Sobre',
              icon: const Icon(Icons.menu),
              selectedIcon: const Icon(Icons.menu_book_outlined),
              onPressed: () => _sobre(context)),
        ],
      ),
    );
  }

  Future<void> _sobre(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre o\nCinema Por\nMenos'),
          content: const Text('Somos um aplicativo voltado '
              'ao conforto dos usuarios onde '
              'possibilitamos que os usuarios '
              'tenham a liberdade de localizar '
              'o cinema mais proximo ou dar a '
              'opção para que vejam a '
              'programação de diversos '
              'cinemas e deixar que assim o '
              'cliente escolha a melhor opção '
              'para atende-lo '
              'Para que você não tenha que ter '
              '10 ou mais aplicativos vem para '
              'o Cinema Por menos !!!!'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
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
