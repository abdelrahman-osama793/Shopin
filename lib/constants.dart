import 'package:flutter/material.dart';

const Color purpleColor = Color(0xFF996FAF);
const Color grayBlack = Color(0xFF3C3D3E);
const Color darkBlue = Color(0xFF2C2D69);
const scaffoldBackgroundColor = Color(0xFFF3F5f9);

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

// SharedPreference variables
const CachedUserData = 'CACHED_USER_DATA';

// Checkout variables
const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}

enum DeliveryTypes{
  StandardDelivery,
  EmergencyDelivery,
  LazyDelivery,
}

const String StandardDeliveryInfo = "\nOrder will be delivered within 5 - 10 business days";
const String EmergencyDeliveryInfo = "\nOrder will be delivered within 2 - 3 business days";
const String LazyDeliveryInfo = "\nOrder will be delivered within 15 - 20 business days";
