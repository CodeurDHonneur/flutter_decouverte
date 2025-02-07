import 'package:app_stateful/controllers/user_controller.dart'
    as user_controller;
import 'package:flutter/material.dart';
import 'package:app_stateful/components/counterLogique/counter_logique.dart';



class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameOrEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  user_controller.UserController userController =
      user_controller.UserController();

  String nameOrEmail = "";

  bool _matchPasswordForUser(String password) {
    String nameOrEmail = _nameOrEmailController.text.trim();
    return userController.matchPasswordForUser(nameOrEmail, password);
  }

  void clearInput() {
    _nameOrEmailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
              controller: _nameOrEmailController,
              decoration: InputDecoration(
                labelText: 'Nom ou Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Veuillez entrer votre nom ou email !";
                }

                value = value.trim();

                if (!userController.checkUserExist(value)) {
                  return "Utilisateur introuvable !";
                }

                nameOrEmail = value;
                return null;
              }),
          SizedBox(height: 15),
          TextFormField(
              controller: _passwordController,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Veuillez entrer votre 'mot de passe !";
                }

                if (value.length < 8) {
                  return "Le mot de passe doit contenir au moins 8 caractères !";
                }

                value = value.trim();

                if (!_matchPasswordForUser(value)) {
                  return "Mot de passe incorrect !";
                }
                return null;
              }),
          SizedBox(height: 15),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Connexion réussie !")));
                  clearInput();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ParentWidget()),
                  );
                }
              },
              child: Text("Se connecter"))
        ]),
      ),
    );
  }
}
