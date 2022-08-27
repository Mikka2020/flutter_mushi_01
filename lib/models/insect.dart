class Insect {
  final int id;
  final String name;
  final String description;
  // final String imagePath;

  Insect({
    required this.id,
    required this.name,
    required this.description,
    // required this.imagePath,
  });

  factory Insect.fromJson(Map<String, dynamic> json) {
    return Insect(
        id: json['results'][0]['id'],
        name: json['results'][0]['insect_name'],
        description: json['results'][0]['insect_text']);
    // imagePath: json['imagePath']);
  }
}
