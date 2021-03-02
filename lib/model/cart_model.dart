class CartModel {
  String productId;
  String productName;
  String productImage;
  String productPrice;
  int productQuantity;

  CartModel(
      {this.productName,
        this.productImage,
        this.productPrice,
        this.productQuantity,
        this.productId});

  CartModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['productId'];
    productName = map['productName'];
    productImage = map['productImage'];
    productPrice = map['productPrice'];
    productQuantity = map['productQuantity'];
  }

  toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'productQuantity': productQuantity,
    };
  }
}