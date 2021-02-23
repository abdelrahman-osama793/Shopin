import 'package:flutter/material.dart';

const Color purpleColor = Color(0xFF996FAF);
const Color blue = Color(0xFF360DFF);
const Color grayBlack = Color(0xFF3C3D3E);
const Color darkBlue = Color(0xFF2C2D69);

const BoxShadow imageShadow = BoxShadow(
  color: Colors.black26,
  offset: Offset(0.0, 2.0),
  blurRadius: 6.0,
);

// Database variables
final String cartTableName = 'cartItems';
final String columnName = 'productName';
final String columnImage = 'productImage';
final String columnPrice = 'productPrice';
final String columnQuantity = 'productQuantity';
final String columnId = 'productId';
final dbVersion = 1;
final dbName = 'CartProducts.db';

