import 'package:api_teste1010/models/heroModel.dart';
import 'package:flutter/material.dart';


class DetailHero extends StatelessWidget {
  DetailHero({super.key, required this.hero});

  final HeroModel hero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(hero.name.toUpperCase()),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              hero.image,
            ),
            Text(
              hero.name.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Habilidade(s): '),
                Text('${hero.powerstats} '),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Identificação: '),
                Text('${hero.name}'),
              ],
            ),

          ],
        ),
      ),
    );
  }
}