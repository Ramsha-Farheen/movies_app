import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String title;
  final String description;
  bool isFavourite;

  Movie({
    required this.title,
    required this.description,
    this.isFavourite = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'isFavourite': isFavourite,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String,
      description: map['description'] as String,
      isFavourite: map['isFavourite'] as bool,
    );
  }

  @override
  List<Object?> get props => [title, description, isFavourite];
}
