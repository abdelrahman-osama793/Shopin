class ProductModel {
  String productName;
  String productCompany;
  String productImage;
  String productDescription;
  String productSize;
  String productPrice;
  String productColor;

  ProductModel(
      {this.productName,
      this.productImage,
      this.productDescription,
      this.productSize,
      this.productPrice,
      this.productCompany,
      this.productColor});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productName = map['name'];
    productCompany = map['company'];
    productImage = map['image'];
    productDescription = map['description'];
    productSize = map['size'];
    productPrice = map['price'];
    productColor = map['color'];
  }

  toJson() {
    return {
      'name': productName,
      'company': productCompany,
      'image': productImage,
      'description': productDescription,
      'size': productSize,
      'price': productPrice,
      'color': productColor,
    };
  }
}
