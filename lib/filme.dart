import 'package:flutter/material.dart';
import 'cinemas.dart';

class FilmePage extends StatefulWidget {
  final int filmeId;

  const FilmePage({Key? key, required this.filmeId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FilmePageState();
  }
}

class _FilmePageState extends State<FilmePage> {
  late String sinopse = "";
  late String titulo = "";

  @override
  void initState() {
    super.initState();
    if (widget.filmeId == 0) {
      setState(() {
        titulo = 'Guardiões da Galáxia';
        sinopse =
            'Sinopse: Em "Guardiões da Galáxia Vol. 3" nosso amado grupo de desajustados está se estabelecendo em Knowhere. Mas não demora muito até que suas vidas sejam reviradas pelo passado turbulento de Rocket. Peter Quill, ainda se recuperando da perda de Gamora, deve reunir sua equipe em uma missão perigosa para salvar a vida de Rocket - uma missão que, se não for concluída com sucesso, pode levar ao fim dos Guardiões como os conhecemos.';
      });
    }
    if (widget.filmeId == 1) {
      setState(() {
        titulo = 'Velozes e Furiosos';
        sinopse =
            'Sinopse: Ao longo de muitas missões e contra probabilidades impossíveis, Dom Toretto e sua família foram mais espertos, mais nervosos e superaram todos os inimigos em seu caminho. Agora, eles enfrentam o oponente mais letal que já enfrentaram: uma ameaça terrível emergindo das sombras do passado, alimentada por vingança de sangue e determinada a destruir esta família e destruir tudo - e todos - que Dom ama.';
      });
    }

    if (widget.filmeId == 2) {
      setState(() {
        titulo = 'Homem Aranha';
        sinopse =
            'Sinopse: Miles Morales está de volta para o próximo capítulo da saga Aranhaverso; uma aventura épica que vai transportar o protetor em tempo integral do Brooklyn e amigão da vizinhança Homem-Aranha através do multiverso, para unir forças com Gwen Stacy e um novo time de Pessoas-Aranha para enfrentar um vilão mais poderoso do que qualquer coisa que já tenham encontrado.';
      });
    }

    if (widget.filmeId == 3) {
      setState(() {
        titulo = 'Transformers';
        sinopse =
            'Sinopse: Transformers: O Despertar das Feras traz mais uma aventura épica pelo universo dos transformers. Ambientada nos anos 1990, o filme apresentará os Maximals, Predacons e Terrorcons à batalha existente na Terra entre Autobots e Decepticons.';
      });
    }

    if (widget.filmeId == 4) {
      setState(() {
        titulo = 'Flash';
        sinopse =
            'Sinopse: Mundos colidem em The Flash quando Barry usa seus superpoderes para viajar no tempo e mudar os eventos do passado. Mas quando tenta salvar sua família e acaba, sem querer, alterando o futuro, Barry fica preso em uma realidade na qual o General Zod está de volta, ameaçando colocar o mundo em risco, e não há super-heróis a quem recorrer. A não ser que que Barry consiga persuadir um Batman muito diferente a sair da aposentadoria e resgatar um kryptoniano preso… mesmo que não seja exatamente quem Batman está procurando. Para salvar o mundo em que está e retornar ao futuro que conhece, a única esperança de Barry é usar seus superpoderes para salvar sua vida. Mas, se afinal, precisar desistir dela, será seu sacrifício suficiente para reconfigurar o universo?';
      });
    }

    if (widget.filmeId == 5) {
      setState(() {
        titulo = 'Mario';
        sinopse =
            'Sinopse: Mario é um filme baseado na série de video games, Super Mario Bros, da Nintendo. Em Super Mario Bros. - O Filme, Mario (Chris Pratt) é um encanador qualquer no bairro de Brooklyn junto com seu irmão Luigi (Charlie Day). Um dia, Mario e Luigi vão para no reino dos cogumelos, governado pela Princesa Peach (Anya Taylor-Joy), mas ameaçado pelo rei dos Koopas, Bowser (Jack Black), que vai fazer de tudo para conseguir reinar todos os lugares. É então quando Luigi é raptado por Bowser e o usa para procurar Mario, o único capaz de deter o Koopa e reestabelecer a paz. Mario terá que aprender como viver nesse novo reino perigoso, passando por vários biomas, aprender a dirigir carros, utilizar itens que o fazem soltar bolas de fogo das mãos, virar um animal e andar em plataformas nada confiáveis. Também estará acompanhado de amigos, como Toad (Keegan-Michael Key) e Donkey Kong (Seth Rogan).';
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
                  Container(
                    height: 500,
                    width: 200,
                    child: Image(
                      image: AssetImage(
                        'assets/filme_${widget.filmeId}.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(sinopse),
                  const SizedBox(height: 20),
                ],
              ),
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
            tooltip: 'Cinemas',
            icon: Icon(Icons.movie),
            label: 'Cinemas',
          ),
          BottomNavigationBarItem(
            tooltip: 'Sobre',
            icon: Icon(Icons.menu),
            label: 'Sobre',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CinemasWidget(filmeId: widget.filmeId)),
            );
          } else if (index == 2) {
            _sobre(context);
          }
        },
      ),
    );
  }

  _navigateToMenu(int index) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CinemasWidget(filmeId: index)));
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
