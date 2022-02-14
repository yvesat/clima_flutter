import 'package:clima/uteis/alerta.dart';
import 'package:clima/uteis/constants.dart';
import 'package:flutter/material.dart';

class TelaCidade extends StatefulWidget {
  @override
  _TelaCidadeState createState() => _TelaCidadeState();
}

class _TelaCidadeState extends State<TelaCidade> {
  String nomeCidade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFiledInputDecoration,
                  onChanged: (value) {
                    nomeCidade = value;
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  if (nomeCidade != null) {
                    Navigator.pop(context, nomeCidade);
                  } else {
                    return showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Alerta('Insira o nome da cidade', 'Para ver o clima da cidade, informe o nome da cidade desejada.');
                        });
                  }
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


