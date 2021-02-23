import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/model/cart_model.dart';
import 'package:shopin/service/database/cart_database.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartModel> _cartModel = [];

  List<CartModel> get cartModel => _cartModel;

  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  var cartDBInstance = CartDatabase.db;

  CartViewModel() {
    getAllItems();
  }

  // Add product to database method
  addProduct(CartModel cartModel) async {
    for (int i = 0; i < _cartModel.length; i++) {
      if (_cartModel[i].productId == cartModel.productId) {
        Get.snackbar(
          'Error',
          'This item is already in your cart',
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          borderRadius: 10,
          animationDuration: Duration(seconds: 2),
          duration: Duration(seconds: 5),
          margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
          isDismissible: true,
        );
        return;
      }
    }
    await cartDBInstance.insert(cartModel);
    _cartModel.add(cartModel);
    _totalPrice +=
        (double.parse(cartModel.productPrice) * cartModel.productQuantity);
    Get.snackbar(
      'Successful',
      'Item added to your cart',
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      borderRadius: 10,
      animationDuration: Duration(seconds: 2),
      duration: Duration(seconds: 4),
      margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
      isDismissible: true,
    );
    update();
  }

  // Get all items from database method
  getAllItems() async {
    _loading.value = true;
    _cartModel = await cartDBInstance.getAllItems();
    _loading.value = false;
    getTotalPrice();
    update();
  }

  // Calculate total price method
  getTotalPrice() {
    for (int i = 0; i < _cartModel.length; i++) {
      _totalPrice += (double.parse(_cartModel[i].productPrice) *
          _cartModel[i].productQuantity);
      update();
    }
  }

  // Increase quantity method and update the quantity in the database
  increaseQuantity(int index) async {
    _cartModel[index].productQuantity++;
    _totalPrice += (double.parse(_cartModel[index].productPrice));
    await cartDBInstance.updateCartItems(_cartModel[index]);
    update();
  }
  // Decrease quantity and update the quantity in the database
  decreaseQuantity(int index) async {
    _cartModel[index].productQuantity--;
    _totalPrice -= (double.parse(_cartModel[index].productPrice));
    await cartDBInstance.updateCartItems(_cartModel[index]);
    update();
  }
}
