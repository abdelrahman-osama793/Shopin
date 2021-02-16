import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/model/categories_model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoriesModel> get categoryModel => _categoryModel;
  List<CategoriesModel> _categoryModel = [];

  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Categories');

  HomeViewModel() {
    getCategories();
  }

  getCategories() async {
    _loading.value = true;
    await _categoryCollectionRef.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        _categoryModel.add(
          CategoriesModel.fromJson(
            value.docs[i].data(),
          ),
        );
        _loading.value = false;
      }
      update();
    });
  }
}
