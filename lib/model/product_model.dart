import 'package:flutter/material.dart';
import 'package:shopin/util/color_converter.dart';

class ProductModel {
  String productName;
  String productCompany;
  String productImage;
  String productDescription;
  List <String> productSize;
  String productPrice;
  List <String> productColor;

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
    productSize = List.from(map['size']);
    productPrice = map['price'];
    productColor = List.from(map['color']);
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
