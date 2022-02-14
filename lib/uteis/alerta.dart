import 'package:flutter/material.dart';

class Alerta extends StatelessWidget {
  String titulo;
  String mensagem;
  String confirmacao;

  Alerta(this.titulo, this.mensagem, {this.confirmacao});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.titulo),
      content: Text(this.mensagem),
      actions: <Widget>[
        TextButton(
          child: Text(this.confirmacao != null ? this.confirmacao : 'Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
