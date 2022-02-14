import 'package:clima/services/networking.dart';
import 'package:clima/services/localizacao.dart';

const chaveApi = "d906f0dec54daacf15321640420e5aac";
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class ModeloClima {
  Future<dynamic> buscarDadosCidade(String nomeCidade) async {
    AssistenteNetwork assistenteNetwork = AssistenteNetwork('$openWeatherMapURL?q=$nomeCidade&units=metric&appid=${chaveApi}');

    var dadosClima = await assistenteNetwork.buscarDados();

    return dadosClima;
  }

  Future<dynamic> buscarDadosLocalizacao() async {
    Localizacao localizacao = Localizacao();

    await localizacao.buscarLocalizacaoAtual();

    AssistenteNetwork assistenteNetwork = AssistenteNetwork('$openWeatherMapURL?lat=${localizacao.latitude}&lon=${localizacao.longitude}&units=metric&appid=${chaveApi}');
    var dadosClima = await assistenteNetwork.buscarDados();
    print(dadosClima);

    return dadosClima;
  }

  String carregarIconeClima(int condicao) {
    if (condicao < 300) {
      return '🌩';
    } else if (condicao < 400) {
      return '🌧';
    } else if (condicao < 600) {
      return '☔️';
    } else if (condicao < 700) {
      return '☃️';
    } else if (condicao < 800) {
      return '🌫';
    } else if (condicao == 800) {
      return '☀️';
    } else if (condicao <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String carregarMensagem(int temp) {
    if (temp > 25) {
      return 'Clima bom para tomar um 🍦';
    } else if (temp > 20) {
      return 'Clima de shorts e 👕';
    } else if (temp < 10) {
      return 'Você irá precisar de 🧣 e 🧤';
    } else {
      return 'Leve um 🧥 por precaução';
    }
  }
}
