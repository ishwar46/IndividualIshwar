class Source {
  String id;
  String name;

  //Constructor
  Source({required this.id, required this.name});

  //Factory Function to map the json
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
