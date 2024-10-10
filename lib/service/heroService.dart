import 'package:api_teste1010/models/heroModel.dart';
import 'package:dio/dio.dart';

class HeroService {
  final Dio _dio = Dio();

  static const apiKey = '6c60ce2e93f4d99e80189e7f0d586a26';
  static const apiUrl = 'https://superheroapi.com/';

  Future<List<HeroModel>> fetchHeroModel() async {
    const String allHerosUrl =
        '$apiUrl/api/$apiKey/character-id';

    try {
      final response = await _dio.get(allHerosUrl);
      if (response.statusCode == 200) {
        List<dynamic> herosList = [];

        var lists = response.data['results']['lists'] as List;
        for (var list in lists) {
          var heros = list['heros'] as List;
          herosList.addAll(heros);
        }
        return herosList.map((hero) => HeroModel.fromJson(hero)).toList();
      } else {
        throw Exception('Erro ao tentar pegar informações do herói!');
      }
    } catch (e) {
      throw Exception('Erro ao acessar api ${e}!');
    }
  }
}