import '../models/user_model.dart' as user_model;
import '../bdd/user_data.dart' as user_data;

class UserController {
  final List<user_model.UserModel> _users = [...user_data.usersData];

  // méthode pour vérifier la présence de données en bdd
  bool checkUsersData() => _users.isNotEmpty;


  Map<String, dynamic> getAllData(){
    if(checkUsersData()){
      return {
        "status": 200,
        "message": "Données récupérées avec succès",
        "data": _users
      };
    } else {
      return {
        "status": 404,
        "message": "Aucun utilisateur trouvé",
        "data": []
      };
    }
  }

  ///méthode pour vériier si un utilisateur existe
  ///on vérifie si l'utilisateur existe en fonction de son nom ou de son email
  ///on retourne 'true' si oui et false si 'non'
  bool checkUserExist(String nameOrEmail){
    return _users.any((user) => user.name == nameOrEmail || user.email == nameOrEmail);
  }

  bool matchPasswordForUser(String nameOrEmail, String password){
    
     return _users.any((user) => (user.name == nameOrEmail || user.email == nameOrEmail ) && user.password == password);  
    
  }
}