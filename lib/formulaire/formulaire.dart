import 'package:flutter/material.dart';


class MyForm extends StatefulWidget {
  @override 
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Mon formulaire")),
      body: Padding(  
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
             TextFormField(  
              decoration: InputDecoration(
                labelText: 'Nom',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                print("Valeur du champ : $value");
                if(value == null || value.isEmpty || value.trim() == ""){
                  return "Veuillez entrer votre nom !";
                }
                return null;
              },
             ),
              SizedBox(height: 15),
              TextFormField(  
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if(value == null || value.isEmpty || value.trim() == ""){
                    return "Veuillez entrer votre email !";
                  }
                  if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                    return "Veuillez entrer un email valide !";
                  }
                  return null;
                }
              ),
              SizedBox(height: 15),
              TextFormField(  
                decoration: InputDecoration(  
                  labelText: 'Commentaire',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true
                ),
                maxLines: 6,
                validator: (value) {
                  if(value == null || value.isEmpty || value.trim() == ""){
                    return "Veuillez entrer votre commentaire !";
                  }
                  if(value.length < 10){
                    return "Votre commentaire doit contenir au moins 10 caractères !";
                  }
                  return null;
                }
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Traitement en cours...")));
                  }
                }, 
                child: Text("Valider"),
              )
            ],
            ))
      )
    );
  }
}