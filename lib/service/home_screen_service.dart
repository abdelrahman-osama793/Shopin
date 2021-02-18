import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreenService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _bestSellingProductsCollectionRef =
  FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var categoryResponse = await _categoryCollectionRef.get();
    return categoryResponse.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSellingProducts() async {
    var bestSellingProductsResponse = await _bestSellingProductsCollectionRef.get();
    return bestSellingProductsResponse.docs;
  }

}
