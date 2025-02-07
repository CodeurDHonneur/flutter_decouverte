

class UserModel {
  final int _id = DateTime.now().microsecondsSinceEpoch;
  String name;
  String email;
  String password;

  UserModel({
    required this.name,
    required this.email, 
    required this.password
  });
 
 int get id => _id;
}