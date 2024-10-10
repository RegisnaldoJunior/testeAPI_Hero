import 'package:api_teste1010/models/heroModel.dart';
import 'package:api_teste1010/service/heroService.dart';
import 'package:api_teste1010/views/detailHero.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HeroService _heroService = HeroService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Lista de Heróis'),
      ),
      body: FutureBuilder<List<HeroModel>>(
          future: _heroService.fetchHeroModel(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erro: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final heros = snapshot.data!;
              return ListView.separated(
                itemCount: heros.length,
                itemBuilder: (context, index) {
                  final hero = heros[index];
                  return ListTile(
                    title: Text(hero.name), // Corrigido: hero.name
                    subtitle: Text(
                        'Poder: ${hero.powerstats} '), // Corrigido: hero.powerstats
                    leading: Image.network(hero.image), // Corrigido: hero.image
                    onTap: () {
                      Get.to(() => DetailHero(hero: hero));
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              );
            } else {
              return Center(child: Text('Nenhum dado disponível'));
            }
          }),
    );
  }
}
