class Person {
  int id;
  final String name;
  final String characterName;
  final String? imageURL;
  Person({
    required this.id,
    required this.name,
    required this.characterName,
    this.imageURL,
  });

  Person copyWith({
    String? name,
    String? characterName,
    String? imageURL,
    int? id,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      characterName: characterName ?? this.characterName,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  factory Person.fromJson(Map<String, dynamic> map) {
    return Person(
      id:map['id'],
      name: map['name'],
      characterName: map['character'],
      imageURL: map['profile_path'],
    );
  }
}
