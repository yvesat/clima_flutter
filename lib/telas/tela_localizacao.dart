import 'package:clima/services/clima.dart';
import 'package:clima/telas/tela_cidade.dart';
import 'package:clima/uteis/constants.dart';
import 'package:flutter/material.dart';

class TelaLocalizacao extends StatefulWidget {
  TelaLocalizacao({this.localizacaoClima});

  final localizacaoClima;

  @override
  _TelaLocalizacaoState createState() => _TelaLocalizacaoState();
}

class _TelaLocalizacaoState extends State<TelaLocalizacao> {
  ModeloClima clima = ModeloClima();
  int temperatura;
  String iconeClima;
  String nomeCidade;
  String mensagemClima;

  @override
  void initState() {
    super.initState();
    atualizarUI(widget.localizacaoClima);
  }

  void atualizarUI(dynamic dadosClima) {
    setState(() {
      if (dadosClima == null) {
        temperatura = 0;
        iconeClima = 'Erro';
        mensagemClima = 'Não foi possível obter os dados do tempo.';
        nomeCidade = '';
        return;
      }
      double temp = dadosClima['main']['temp'];
      temperatura = temp.toInt();

      var condicao = dadosClima['weather'][0]['id'];
      iconeClima = clima.carregarIconeClima(condicao);

      nomeCidade = dadosClima['name'];
      mensagemClima = clima.carregarMensagem(temperatura);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var dadosClima = await clima.buscarDadosLocalizacao();
                      atualizarUI(dadosClima);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var nomeInserido = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TelaCidade();
                          },
                        ),
                      );
                      if (nomeInserido != null) {
                        nomeInserido.toString();
                        var dadosClima = await clima.buscarDadosCidade(nomeInserido);
                        if (dadosClima == 404) {
                          atualizarUI(dadosClima);
                        }
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 70.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperatura°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      iconeClima,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 30),
                child: Text(
                  '$mensagemClima em $nomeCidade!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
