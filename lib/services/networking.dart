import 'package:clima/uteis/alerta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AssistenteNetwork {
  AssistenteNetwork(this.api);

  String api;

  Future buscarDados() async {
    var url = Uri.parse(api);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      String dados = response.body;
      return convert.jsonDecode(dados);
    } else {
      return response.statusCode;
    }
  }
}
