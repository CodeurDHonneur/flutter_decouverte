import 'package:flutter/material.dart';
import 'components/counterLogique/counter_logique.dart' as counter_logique;
import './formulaire/formulaire.dart' as formulaire;
import './formulaire/login_form.dart' as login_form;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Zouglou Dance",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Zouglou un jour, Zouglou toujours !"),
            ),
            body: Center(
              child: login_form.LoginForm()
             
              ))
              );
  }
}


/**
 * 
 */