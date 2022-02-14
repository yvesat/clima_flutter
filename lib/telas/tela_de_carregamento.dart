import 'package:clima/services/clima.dart';
import 'package:clima/telas/tela_localizacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TelaDeCarregamento extends StatefulWidget {
  @override
  _TelaDeCarregamentoState createState() => _TelaDeCarregamentoState();
}

class _TelaDeCarregamentoState extends State<TelaDeCarregamento> {
  void carregarDados() async {
    var dadosClima = await ModeloClima().buscarDadosLocalizacao();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TelaLocalizacao(
        localizacaoClima: dadosClima,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitFadingCircle(
        color: Colors.white,
        size: 100.0,
      ),
    ));
  }
}
