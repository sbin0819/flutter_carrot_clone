import 'package:bamtol_market_app/src/common/enum/market_enum.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? title;
  final ProductCategoryType? categoryType;

  const Product({
    this.title,
    this.categoryType = ProductCategoryType.none,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'categoryType': categoryType?.code,
    };
  }

  factory Product.fromJson(String docId, Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      categoryType: json['categoryType'] != null
          ? ProductCategoryType.findByCode(json['categoryType'])
          : ProductCategoryType.none,
    );
  }

  Product copyWith({
    String? title,
    ProductCategoryType? categoryType,
  }) {
    return Product(
      title: title ?? this.title,
      categoryType: categoryType ?? this.categoryType,
    );
  }

  @override
  List<Object?> get props => [title, categoryType];
}
