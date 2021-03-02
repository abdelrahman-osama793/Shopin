import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopin/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _usersCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUsersToFireStoreDB(UserModel userModel) async {
    return await _usersCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}
