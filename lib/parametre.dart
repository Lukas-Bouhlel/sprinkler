import 'package:flutter/material.dart';
import '../styles.dart'; // Importation des styles
import 'activity.dart';
import 'built.dart';

class Parametre extends StatelessWidget {
  // Liste des boutons à générer dynamiquement (peut venir d'un fichier ou d'une source de données)
  final List<String> buttonLabels = ['MATIN', 'MIDI', 'SOIR'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Supprime la flèche de retour
        title: Text(
          'SPRINKLER',
          style: AppStyles.header,
        ),
        centerTitle: true, // Centrer le titre de l'AppBar
      ),
      body: Center( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center, // Centrer les éléments verticalement
          children: [
            // Texte + Champ texte
            Text("Identifiez votre arrosage :", style: AppStyles.subtitle),
            SizedBox(height: 10),
            Container(
              width: 300,  // Spécifie la largeur
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Identifiant",
                  hintText: "Entrez votre identifiant",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Espacement entre les boutons

            Text("Lancement automatique :", style: AppStyles.subtitle),
            SizedBox(height: 20),

            // Boutons Matin, Midi, Soir (les uns en dessous des autres)
              buildLancementButton("MATIN", () {}),
              SizedBox(height: 10),
              buildLancementButton("MIDI", () {}),
              SizedBox(height: 10),
              buildLancementButton("SOIR", () {}),
            SizedBox(height: 20),

            // Texte et checkbox alignés
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centrer le texte et la checkbox
              children: [
                Text("Activer l'arrosage automatique :", style: AppStyles.subtitle),
                SizedBox(width: 10), // Espacement entre le texte et la checkbox
                Expanded(
                  child: Checkbox(
                    value: false, // La valeur de la checkbox
                    onChanged: (bool? newValue) {
                      // Action à effectuer lorsque la checkbox est cliquée
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: AppColors.primary, // Fond de la couleur primary
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Centrer les boutons
            children: [
              // Bouton Paramètres
              buildImageButton('assets/img/parametres.png', () {
              }),

              SizedBox(width: 70), // Espacement entre les deux boutons

              // Bouton Retour
              buildImageButton('assets/img/retour.png', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Activity()), // Ouvre HomePage
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
