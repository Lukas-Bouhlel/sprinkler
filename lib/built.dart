import 'package:flutter/material.dart';
import '../styles.dart'; // Importation des styles

// Fonction pour générer un bouton de lancement automatique (Matin, Midi, Soir)
Widget buildLancementButton(String text, VoidCallback onPressed) {
  return SizedBox(
    width: 300, // Largeur des boutons
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          text,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    ),
  );
}

// Fonction pour générer un bouton avec une image (paramètres, retour)
Widget buildImageButton(String imagePath, VoidCallback onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    onPressed: onPressed,
    child: Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: 30,
      height: 30,
    ),
  );
}