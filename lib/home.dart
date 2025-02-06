import 'package:flutter/material.dart';
import 'styles.dart';
import 'activity.dart';
import 'built.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arrosage des Plantes',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // fleur en haut à droite
          Positioned(
            top: 50,
            right: 0, // Coller à droite
            child: Image.asset(
              'assets/img/flower.png',
              fit: BoxFit.cover, // Remplit bien l'espace
              width: 128, // Largeur de l'image
              height: 128, // Hauteur de l'image
            ),
          ),

          // Contenu principal centré
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, // Centre les éléments horizontalement
                children: [
                  Text(
                    'BIENVENUE SUR SPRINKLER',
                    style: AppStyles.title,
                    textAlign: TextAlign.center, // Centre le texte
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Offrez à vos plantes l'arrosage parfait, sans effort ! Découvrez l’arrosoir paramétrable qui s’adapte à tous vos besoins.",
                    textAlign: TextAlign.center, // Centre le texte
                    style: AppStyles.subtitle,
                  ),
                  SizedBox(height: 32),

                  // Utilisation de la fonction buildLancementButton depuis built.dart
                  buildLancementButton("LANCER L'APPLICATION", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Activity()), // Ouvre ActivityPage
                    );
                  }),
                ],
              ),
            ),
          ),

          // grandeGoutte en bas à gauche
          Positioned(
            bottom: 80, // Position en bas
            left: 10, // Coller à gauche
            child: Image.asset(
              'assets/img/grandeGoutte.png',
              fit: BoxFit.cover,
              width: 83,
              height: 83,
            ),
          ),

          // petiteGoutte en dessous de la grande goutte
          Positioned(
            bottom: 20, // Positionne la petite goutte sous la grande goutte
            left: 70, // Optionnel : Décalage pour un meilleur alignement
            child: Image.asset(
              'assets/img/petiteGoutte.png',
              fit: BoxFit.cover,
              width: 54,
              height: 54,
            ),
          ),
        ],
      ),
    );
  }
}