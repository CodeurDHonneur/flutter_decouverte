📌 **Qu’est-ce que la navigation en Flutter ?**
La navigation en Flutter consiste à déplacer un utilisateur d'une page à une autre dans une application. Flutter offre plusieurs mécanismes pour gérer cette transition entre les pages. La navigation permet non seulement de gérer les écrans, mais aussi de passer des données d’un écran à un autre.
---

📍 **Les différents types de navigation en Flutter**

1️⃣ Navigation par **pile** ou **Stack-based Navigation** (`Navigator.push()` et `Navigator.pop()`)

Cette approche s’apparente à une **pile d’appels**, où chaque nouvel écran est empilé par-dessus le précédent.

* `Navigator.push()` ajoute un nouvel écran à la pile.
* `Navigator.pop()` retire le dernier écran ajouté (revenir à l’écran précédent).
Cela permet de créer des transitions entre des pages de manière simple, et on peut **empiler autant d'écrans que nécessaire**.

```dart
// Aller à une nouvelle page
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NouvellePage()),
);

// Revenir à la page précédente
Navigator.pop(context);
```

En plus de `push` et `pop`, Flutter propose d'autres façons de gérer la pile de navigation.

* `Navigator.pushReplacement()` → Remplacer une page dans la pile

Supprime l’écran actuel et le remplace par un nouvel écran (utile pour la connexion).

```dart

Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => PageAccueil()),
);
```
👉 Exemple d’utilisation :

* Après la connexion, on veut remplacer l’écran de connexion par l’accueil, pour éviter que l’utilisateur puisse revenir en arrière avec le bouton retour.
---  

* `Navigator.pushAndRemoveUntil()` → Supprimer plusieurs pages d’un coup
Ajoute un nouvel écran et supprime toutes les pages précédentes jusqu'à une condition donnée.

```dart

Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => PageAccueil()),
  (route) => false, // Supprime toutes les pages précédentes
);
```
👉 Exemple d’utilisation :

* Après la connexion, on veut effacer complètement l’écran de connexion et empêcher l’utilisateur d’y retourner.

Si on veut garder certaines pages, on peut modifier la condition :

```dart

Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => PageArticles()),
  (route) => route.isFirst, // Garde uniquement la première page
);
```

👉 Cas d’usage :

* Un utilisateur termine un tutoriel (PageTutoriel), et on veut le renvoyer à l’accueil sans qu’il puisse revenir au tutoriel.
---

Navigator.popUntil() → Revenir en arrière jusqu’à une certaine page
Supprime toutes les pages au-dessus d’une page spécifique dans la pile.

```dart
Navigator.popUntil(context, ModalRoute.withName('/accueil'));
```

👉 Exemple d’utilisation :

* On a une page Accueil > Articles > Détails, et on veut revenir directement à l’Accueil, peu importe le nombre de pages empilées.

### Mise en pratique