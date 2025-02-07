📘 **Cours : Les Formulaires en Flutter**
Les formulaires sont très importants dans les applications mobiles. Ils permettent à l’utilisateur de saisir des données, comme un nom d’utilisateur, un mot de passe, ou encore une adresse e-mail.

Flutter offre un système de gestion de formulaire très puissant à l’aide du widget `Form`, qui permet de :

✔️ Organiser plusieurs champs de saisie.

✔️ Gérer la validation (vérifier que les champs sont bien remplis).

✔️ Soumettre les données entrées par l’utilisateur.

---

1️⃣ Structure d’un Formulaire en Flutter
Un formulaire en Flutter est généralement structuré ainsi :

1. Un widget Form : Il regroupe les champs de saisie et permet de gérer leur validation.
2. **Une clé** `GlobalKey<FormState>` : Elle permet d’accéder et de contrôler l’état du formulaire.
3. **Des champs de saisie** `TextFormField` : Ce sont les éléments où l’utilisateur entre ses informations.
4. **Un bouton pour soumettre les données**.
Voyons tout cela en détail.

---

2️⃣ Création d’un Formulaire de Base
📌 Étape 1 : Créer un `Form` avec une clé globale
Pour gérer le formulaire, on a besoin d’une clé globale (`GlobalKey<FormState>`). Elle nous permet de :
🔹 Accéder au formulaire.
🔹 Vérifier si les champs sont valides.
🔹 Soumettre les données.

Exemple :

```dart

import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>(); // Clé pour gérer le formulaire

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mon Formulaire')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Associe la clé au formulaire
          child: Column(
            children: [
              Text('Formulaire de base'),
            ],
          ),
        ),
      ),
    );
  }
}

```
👉 Ce qu’on a fait ici :
✅ Création d’un widget `Form`.
✅ Association d’une clé `_formKey` pour le gérer.

À ce stade, notre formulaire est **vide**, mais prêt à recevoir des champs !
---
📌 **Étape 2 : Ajouter des Champs de Saisie**
Les champs de saisie dans un formulaire sont des `TextFormField`.
Chaque champ doit avoir une validation pour s’assurer que l’utilisateur entre des données correctes.

Ajoutons deux champs :

* Un champ pour le nom.
* Un champ pour l’email (avec validation du format).
  
```dart
TextFormField(
  decoration: InputDecoration(
    labelText: 'Nom',
    border: OutlineInputBorder(),
  ),
  validator: (value) { 
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre nom';
    }
    return null;
  },
),

```

🔹 Explication :

* `labelText` : Affiche un texte descriptif au-dessus du champ.
* `border: OutlineInputBorder()` : Ajoute une bordure autour du champ.
* `validator` : Vérifie si le champ est vide et affiche un message d’erreur.

📌 **Ajoutons un champ e-mail avec validation du format**

```dart
TextFormField(
  decoration: InputDecoration(
    labelText: 'Email',
    border: OutlineInputBorder(),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Veuillez entrer un email valide';
    }
    return null;
  },
),

```

👉 Ce qu’on a ajouté ici :
✔️ Vérification si l’e-mail est vide.
✔️ Vérification si l’e-mail a un format valide (`@` et un domaine `.com`).
---

📌 **Étape 3 : Ajouter un Bouton de Soumission**
On va maintenant ajouter un **bouton pour soumettre le formulaire**.
Quand l’utilisateur appuie sur le bouton, on doit :
✅ Vérifier si tous les champs sont bien remplis.
✅ Afficher un message si la validation réussit.

Voici comment faire :

```dart
ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) { // Vérifie si le formulaire est valide
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Formulaire validé !')),
      );
    }
  },
  child: Text('Envoyer'),
),

```

🔹 Explication :

* `_formKey.currentState!.validate()` : Vérifie si tous les champs respectent leur validation.
* `ScaffoldMessenger.of(context).showSnackBar(...)` : Affiche un message temporaire si tout est bon.

📌 **Étape 4 : Code Complet du Formulaire**
Voici le code final d’un formulaire indépendant en Flutter 👇

```dart

import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>(); // Clé pour gérer le formulaire

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mon Formulaire')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Associe la clé au formulaire
          child: Column(
            children: [
              // Champ Nom
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Email
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Veuillez entrer un email valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Bouton de soumission
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Formulaire validé !')),
                    );
                  }
                },
                child: Text('Envoyer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
---
📌 **Qu’est-ce qu’un TextArea en Flutter ?**
En Flutter, il n’existe pas directement un TextArea comme en HTML. À la place, on utilise un TextFormField avec plusieurs lignes (maxLines), ce qui permet d’écrire du texte sur plusieurs lignes, comme dans un champ de commentaire ou une description.
---

1️⃣ **Ajouter un Champ TextArea dans notre Formulaire**
On ajoute un champ de texte qui permet d’écrire un commentaire sur plusieurs lignes 👇

```dart
TextFormField(
  decoration: InputDecoration(
    labelText: 'Commentaire',
    border: OutlineInputBorder(),
    alignLabelWithHint: true, // Aligner le label en haut à gauche
  ),
  maxLines: 4, // Permet d'avoir plusieurs lignes comme un TextArea
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un commentaire';
    }
    if (value.length < 10) {
      return 'Le commentaire doit contenir au moins 10 caractères';
    }
    return null;
  },
),

```

📌 **Explication**
✅ `maxLines: 4` → Permet d’écrire sur plusieurs lignes (comme un TextArea).
✅ `alignLabelWithHint: true` → Aligne le label en haut à gauche pour un meilleur affichage.
✅ **Validation** :

* Vérifie que le champ n’est pas vide.
* Vérifie que le texte contient au moins **10 caractères**.
--- 

2️⃣ Code Complet avec TextArea
Voici notre formulaire mis à jour avec un champ TextArea 👇

```dart

import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulaire avec TextArea')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Champ Nom
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Email
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Veuillez entrer un email valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Commentaire (TextArea)
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Commentaire',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 4, // Permet d'écrire sur plusieurs lignes
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un commentaire';
                  }
                  if (value.length < 10) {
                    return 'Le commentaire doit contenir au moins 10 caractères';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Bouton Soumettre
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Formulaire validé !')),
                    );
                  }
                },
                child: Text('Envoyer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

📌 **Récupération des Données Saisies en Flutter**
🎯 Objectif
Nous allons voir comment :
✅ Utiliser TextEditingController pour récupérer la saisie de l’utilisateur.
✅ Gérer l’état d’un champ de texte et réagir aux changements.
✅ Nettoyer un champ après utilisation.
---

1️⃣ **C’est quoi un TextEditingController ?**
Un `TextEditingController` est un contrôleur qui permet de :

* Lire la valeur saisie dans un champ texte.
* Modifier la valeur du champ **depuis le code**.
* Réagir quand l’utilisateur tape quelque chose.
💡 **Chaque champ de texte** (`TextField` ou `TextFormField`) peut être lié à un `TextEditingController`.
---

2️⃣ **Comment Utiliser TextEditingController ?**
Voici un exemple simple 👇

```dart

import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // Création des contrôleurs
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // Libérer les ressources des contrôleurs
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    String name = _nameController.text; // Récupère le nom
    String email = _emailController.text; // Récupère l'email

    print("Nom: $name, Email: $email"); // Affiche dans la console

    // Nettoyer les champs après soumission
    _nameController.clear();
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulaire avec TextEditingController')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Champ Nom
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nom',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Champ Email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Bouton Soumettre
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Soumettre'),
            ),
          ],
        ),
      ),
    );
  }
}
```

📌 **Explication**
🔹 **Création des contrôleurs** TextEditingController() pour stocker les valeurs des champs.
🔹 **Récupération des valeurs** avec `.text` dans `_submitForm()`.
🔹 **Nettoyage des champs** après soumission avec `.clear()`.
🔹 **Dispose des contrôleurs** dans `dispose()` pour éviter les fuites de mémoire.

**Pourquoi dispose() est important ?**
---

En Flutter, chaque fois qu’on crée un TextEditingController, il réserve de la mémoire pour stocker les données de l’utilisateur.

💡 Problème : Si on ne libère pas cette mémoire quand le widget est détruit, Flutter garde ces données en mémoire, ce qui peut ralentir l'application et causer des fuites de mémoire.

C’est particulièrement important pour les écrans avec beaucoup de champs de texte, ou lorsqu’un utilisateur navigue souvent entre plusieurs écrans.

exemple d'utilisation : 

```dart
@override
  void dispose() {
    // Libération des ressources pour éviter les fuites de mémoire
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
```

3️⃣ Réagir aux Changements en Temps Réel
On peut aussi écouter les modifications avec un Listener :


```dart
final TextEditingController _usernameController = TextEditingController();

@override
void initState() {
  super.initState();
  _usernameController.addListener(() {
    print("Saisie actuelle : ${_usernameController.text}");
  });
}
```

💡 Cela permet par exemple d'afficher un message en direct si l’utilisateur entre un mauvais format.
---
🎯 Résumé
✔️ Un `TextEditingController` **permet de récupérer et modifier la saisie d’un champ**.
✔️ **On récupère la valeur** avec `.text`.
✔️ **On libère la mémoire avec** `.dispose()`.
✔️ **On peut écouter les changements avec** `.addListener()`.
---

Maintenant, on va intégrer toutes les notions que nous avons abordées dans ton code de l'écran de connexion, en prenant en compte l'utilisation de `TextEditingController`, la validation du formulaire, et bien sûr l'appel à `dispose()` pour libérer la mémoire.

1️⃣ **Étape 1 : Création des contrôleurs pour les champs**
D'abord, on crée les TextEditingController pour gérer les champs de texte (nom d'utilisateur et mot de passe).

2️⃣ **Étape 2 : L'ajout de la méthode dispose()**
On ajoutera la méthode dispose() pour libérer les ressources et vider les champs lorsque l'utilisateur quitte l'écran.

3️⃣ **Étape 3 : Liens avec les `TextFormField`**
Les champs de texte seront reliés aux contrôleurs pour récupérer les valeurs saisies.

Code complet avec les étapes intégrées :
Voici comment cela pourrait ressembler dans ton code :

```dart
import 'package:flutter/material.dart';
import 'todo_list_screen.dart';
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Clé du formulaire
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  // Appelé lorsque l'écran est supprimé pour libérer les ressources
  @override
  void dispose() {
    // Libération des ressources pour les contrôleurs
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Validation du formulaire
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text; // Récupère le nom d'utilisateur
      String password = _passwordController.text; // Récupère le mot de passe

      // Vérification des informations d'identification
      final user = users.firstWhere(
        (user) => user.username == username && user.password == password,
        orElse: () => User(username: '', password: ''),
      );

      if (user.username.isEmpty) {
        setState(() {
          _errorMessage = 'Login ou mot de passe incorrect.';
        });
      } else {
        // Si la connexion est réussie, rediriger vers la TodoList
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TodoListScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page de Connexion')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Associée au formulaire pour valider
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Champ Nom d'utilisateur
              TextFormField(
                controller: _usernameController, // Lié au contrôleur
                decoration: InputDecoration(
                  labelText: 'Nom d\'utilisateur',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom d\'utilisateur';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Champ Mot de passe
              TextFormField(
                controller: _passwordController, // Lié au contrôleur
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  if (value.length < 6) {
                    return 'Le mot de passe doit contenir au moins 6 caractères';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Affichage des erreurs
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 20),

              // Bouton de connexion
              ElevatedButton(
                onPressed: _login, // Soumettre le formulaire
                child: Text('Se connecter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```