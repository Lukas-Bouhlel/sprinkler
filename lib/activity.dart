import 'package:flutter/material.dart';
import '../styles.dart'; // Importation des styles
import 'parametre.dart';
import 'home.dart';
import 'built.dart';
import 'main.dart';

class MyActivity extends StatefulWidget {
  @override
  Activity createState() => Activity();
}

class Activity extends State<MyActivity> {
  bool matin = false;
  bool midi = false;
  bool soir = false;

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Lancer l'arrosage manuellement :",
                  style: AppStyles.subtitle),
              SizedBox(height: 20),

              // Bouton Lancer
              buildLancementButton("LANCER", () {
                mqtt.publishMessage('arrosage/manuel', 'GO');
              }),

              SizedBox(height: 20),
              Text("Lancement automatique :", style: AppStyles.subtitle),
              SizedBox(height: 20),

              // Boutons Matin, Midi, Soir (les uns en dessous des autres)
              buildLancementButton("MATIN", () {
                if (matin == false) {
                  mqtt.publishMessage('arrosage/matin/off', 'STOP');
                } else {
                  mqtt.publishMessage('arrosage/matin/on', 'START');
                }
              }),
              SizedBox(height: 10),
              buildLancementButton("MIDI", () {
                if (midi) {
                  mqtt.publishMessage('arrosage/midi/off', 'STOP');
                } else {
                  mqtt.publishMessage('arrosage/midi/on', 'START');
                }
              }),
              SizedBox(height: 10),
              buildLancementButton("SOIR", () {
                if (soir) {
                  mqtt.publishMessage('arrosage/soir/off', 'STOP');
                } else {
                  mqtt.publishMessage('arrosage/soir/on', 'START');
                }
              }),

              SizedBox(height: 20),
              Text("Activité de l'arrosage :", style: AppStyles.subtitle),
            ],
          ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyParametre()), // Ouvre ParametrePage
                );
              }),

              SizedBox(width: 70), // Espacement entre les deux boutons

              // Bouton Retour
              buildImageButton('assets/img/retour.png', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage()), // Ouvre HomePage
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
