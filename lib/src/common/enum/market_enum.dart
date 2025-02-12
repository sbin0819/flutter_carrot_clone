enum ProductCategoryType {
  none("카테고리 선택", ''),
  food("음식", 'PT1'),
  drink("음료", 'PT2'),
  snack("간식", 'PT3'),
  life("생활/주방", 'PT4'),
  digital("디지털/가전", 'PT5'),
  fashion("패션", 'PT6'),
  beauty("뷰티", 'PT7'),
  baby("육아", 'PT8'),
  pet("반려동물", 'PT9'),
  game("게임", 'PT10'),
  book("도서", 'PT11'),
  ticket("티켓", 'PT12'),
  hobby("취미", 'PT13'),
  etc("기타", 'PT14');

  const ProductCategoryType(
    this.name,
    this.code,
  );

  final String name;
  final String code;

  static ProductCategoryType? findByCode(String code) {
    var result = ProductCategoryType.values.where(
      (element) => element.code == code,
    );
    return result.isNotEmpty ? result.first : null;
  }
}
