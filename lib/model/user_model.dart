class UserModel {
  String userId;
  String name;
  String email;
  String profilePic;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.profilePic,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map){
    if(map == null){
      return ;
    }
    userId = map['userId'];
    name = map['name'];
    email = map['email'];
    profilePic = map['profilePic'];
  }

  toJson(){
    return {
      'userId' : userId,
      'name' : name,
      'email' : email,
      'profilePic' : profilePic,
    };
  }
}
