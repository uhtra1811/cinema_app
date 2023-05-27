import 'package:flutter/material.dart';
import 'cinemas.dart';

class FilmePageSix extends StatefulWidget {
  const FilmePageSix({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FilmePageSixState();
  }
}

class _FilmePageSixState extends State<FilmePageSix> {
  final leftColum = Container(
    padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
    child: const Image(image: AssetImage('assets/filme_5.png')),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intocáveis'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 600,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 440,
                  child: leftColum,
                ),
                const Text('Sinopse: '
                    'Um milionário tetraplégico contrata um homem da periferia '
                    'para ser o seu acompanhante, apesar de sua aparente falta '
                    'de preparo. No entanto, a relação que antes era profissional '
                    'cresce e vira uma amizade que mudará a vida dos dois.'),
              ],
            ),
          ),
        ),
      ),
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
