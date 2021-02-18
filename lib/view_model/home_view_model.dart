import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/model/product_model.dart';
import 'package:shopin/model/categories_model.dart';
import 'package:shopin/service/home_screen_service.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoriesModel> get categoryModel => _categoryModel;
  List<CategoriesModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  HomeViewModel() {
    getCategories();
    getBestSellingProducts();
  }

  getCategories() async {
    _loading.value = true;
    HomeScreenService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
          CategoriesModel.fromJson(
            value[i].data(),
          ),
        );
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeScreenService().getBestSellingProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
          ProductModel.fromJson(
              value[i].data(),
          ),
        );
        _loading.value = false;
      }
      update();
    });
  }

}
