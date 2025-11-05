#!/bin/bash

# Nom des fichiers à réinitialiser (vider)
FICHIER_TIMER=".game_timer"
FICHIER_REPONSE="reponse.txt"

echo "=== Réinitialisation du jeu : Vidage des fichiers ==="

# 1. Réinitialisation du fichier du chronomètre
if [ -f "$FICHIER_TIMER" ]; then
    > "$FICHIER_TIMER" # Vide le fichier existant
    echo "✅ Chronomètre réinitialisé : Le contenu du fichier '$FICHIER_TIMER' a été vidé."
else
    > "$FICHIER_TIMER" # Crée le fichier vide s'il n'existe pas
    echo "✅ Chronomètre initialisé : Le fichier '$FICHIER_TIMER' a été créé vide."
fi

# 2. Réinitialisation du fichier de réponse du joueur
if [ -f "$FICHIER_REPONSE" ]; then
    > "$FICHIER_REPONSE" # Vide le fichier existant
    echo "✅ Réponse du joueur effacée : Le contenu du fichier '$FICHIER_REPONSE' a été vidé."
else
    > "$FICHIER_REPONSE" # Crée le fichier vide s'il n'existe pas
    echo "✅ Réponse du joueur initialisée : Le fichier '$FICHIER_REPONSE' a été créé vide."
fi

echo ""
echo "Jeu réinitialisé. Les fichiers d'état sont prêts. Vous pouvez lancer une nouvelle partie avec : ./start.sh"
