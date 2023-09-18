import 'dart:convert';

class Item {
  String title;
  String imageSrc;
  Item({
    required this.title,
    required this.imageSrc,
  });

  Item copyWith({
    String? title,
    String? imageSrc,
  }) {
    return Item(
      title: title ?? this.title,
      imageSrc: imageSrc ?? this.imageSrc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageSrc': imageSrc,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      title: map['title'] as String,
      imageSrc: map['imageSrc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Item(title: $title, imageSrc: $imageSrc)';

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.title == title && other.imageSrc == imageSrc;
  }

  @override
  int get hashCode => title.hashCode ^ imageSrc.hashCode;
}
