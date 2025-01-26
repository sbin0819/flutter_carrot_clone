import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? title;

  const Product({
    this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  factory Product.fromJson(String docId, Map<String, dynamic> json) {
    return Product(
      title: json['title'],
    );
  }

  Product copyWith({
    String? title,
  }) {
    return Product(
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [title];
}
