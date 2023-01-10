import 'dart:convert';

class NewsModel {
  static List<News> newsDetails = [
    News(
        id: "1",
        title: "Bipul Chettri in Nepal",
        imageUrl:
            "https://images.unsplash.com/photo-1601544359642-c76c4f7c3221?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80",
        desc: "Nepal",
        color: "#ffffff"),
    News(
        id: "2",
        title: "Bipul Chettri in Nepal",
        imageUrl:
            "https://images.unsplash.com/photo-1601544359642-c76c4f7c3221?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80",
        desc: "Nepal",
        color: "#ffffff"),
  ];
}

class News {
  String id;
  String title;
  String imageUrl;
  String desc;
  String color;

  News({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.desc,
    required this.color,
  });
  News copyWith({
    String? id,
    String? title,
    String? imageUrl,
    String? desc,
    String? color,
  }) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      desc: desc ?? this.desc,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'desc': desc});
    result.addAll({'color': color});

    return result;
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'],
      title: map['title'],
      imageUrl: map['imageUrl'],
      desc: map['desc'],
      color: map['color'],
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(id: $id, title: $title, imageUrl: $imageUrl, desc: $desc, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is News &&
        other.id == id &&
        other.title == title &&
        other.imageUrl == imageUrl &&
        other.desc == desc &&
        other.color == color;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        imageUrl.hashCode ^
        desc.hashCode ^
        color.hashCode;
  }
}
