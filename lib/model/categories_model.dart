class CategoriesModel {
  String categoryName;
  String categoryImage;

  CategoriesModel({
    this.categoryName,
    this.categoryImage,
  });

  CategoriesModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    categoryName = map['name'];
    categoryImage = map['image'];
  }

  toJson() {
    return {
      'name': categoryName,
      'image': categoryImage,
    };
  }
}
