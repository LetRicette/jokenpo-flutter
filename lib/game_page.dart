import 'package:flutter/material.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var _imagemApp = AssetImage("assets/images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage('assets/images/pedra.png');
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage('assets/images/papel.png');
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage('assets/images/tesoura.png');
        });
        break;
    }
    //Validação do ganhador
    //Usuario ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou :D";
      });
      //App ganhador
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = "Poxa!!! Você perdeu :(";
      });
    } else {
      setState(() {
        this._mensagem = "Empate :p";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JoKenPo'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                'Escolha do App:',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Image(
                image: this._imagemApp,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Text(
                this._mensagem,
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada('pedra'),
                    child: Image.asset(
                      'assets/images/pedra.png',
                      height: 95,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada('papel'),
                    child: Image.asset(
                      'assets/images/papel.png',
                      height: 95,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada('tesoura'),
                    child: Image.asset(
                      'assets/images/tesoura.png',
                      height: 95,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
