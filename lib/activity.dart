import 'package:flutter/material.dart';
import '../styles.dart'; // Importation des styles

class Activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SPRINKLER',
          style: AppStyles.header,
        ),
        centerTitle: true, // Centrer le titre de l'AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Lancer l'arrosage manuellement :", style: AppStyles.subtitle),
            SizedBox(height: 20), // Espacement entre les éléments
            // Bouton Lancer
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                // Action à effectuer lors du clic
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text(
                  "LANCER",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20), // Espacement entre les boutons
            Text("Lancement automatique :", style: AppStyles.subtitle),
            SizedBox(height: 20),
            // Row pour aligner les boutons Matin et Soir côte à côte
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Bouton Matin
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    // Action à effectuer lors du clic
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text(
                      "MATIN",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 20), // Espacement entre les deux boutons
                // Bouton Soir
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    // Action à effectuer lors du clic
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text(
                      "SOIR",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Activité de l'arrosage :", style: AppStyles.subtitle),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primary, // Fond de la couleur primary
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Centrer les boutons
            children: [
              // Premier bouton
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // Action à effectuer lors du clic
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    "Bouton 1",
                    style: TextStyle(fontSize: 14, color: AppColors.primary),
                  ),
                ),
              ),
              SizedBox(width: 20), // Espacement entre les deux boutons
              // Deuxième bouton
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // Action à effectuer lors du clic
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    "Bouton 2",
                    style: TextStyle(fontSize: 14, color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


