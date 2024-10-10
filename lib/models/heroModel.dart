class HeroModel {
  final int id;
  final String name;
  final String image;
  final String powerstats;

  HeroModel({
    required this.id,
    required this.name,
    required this.image,
    required this.powerstats,
  });

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      id: json['id'],
      name: json['name'],
      image: json['sprites']['front_default'],
      powerstats: json['game_indices'][0]['version']['name'],
    );
  }
}