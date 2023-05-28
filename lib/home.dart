import 'package:cinema_app/filme.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cinema Por Menos'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return GestureDetector(
            onTap: () => _navigateToMenu(index),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Image(
                  image: AssetImage('assets/filme_$index.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: <IconButton>[
          IconButton(
            tooltip: 'Pagina inicial',
            icon: const Icon(Icons.home),
            selectedIcon: const Icon(Icons.home_outlined),
            onPressed: () => _homePage(context),
          ),
          IconButton(
            tooltip: 'Sobre',
            icon: const Icon(Icons.menu),
            selectedIcon: const Icon(Icons.menu_book_outlined),
            onPressed: () => _sobre(context),
          ),
        ],
      ),
    );
  }

  Future<void> _homePage(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pagina Atual'),
          content: const Text('Você está na Pagina Home.'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Entendi'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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

  void _navigateToMenu(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilmePage(filmeId: index)),
    );
  }
}
