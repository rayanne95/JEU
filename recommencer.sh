#!/bin/bash

# Nom des fichiers à nettoyer
FICHIER_TIMER=".game_timer"
FICHIER_REPONSE="reponse.txt"

echo "=== Réinitialisation du jeu ==="

# 1. Suppression du fichier du chronomètre
if [ -f "$FICHIER_TIMER" ]; then
    rm "$FICHIER_TIMER"
    echo "✅ Chronomètre réinitialisé : Le fichier '$FICHIER_TIMER' a été supprimé."
else
    echo "ℹ️ Remarque : Le chronomètre était déjà arrêté (fichier '$FICHIER_TIMER' introuvable)."
fi

# 2. Suppression du fichier de réponse du joueur
if [ -f "$FICHIER_REPONSE" ]; then
    rm "$FICHIER_REPONSE"
    echo "✅ Réponse du joueur effacée : Le fichier '$FICHIER_REPONSE' a été supprimé."
else
    echo "ℹ️ Remarque : Le fichier '$FICHIER_REPONSE' n'existait pas."
fi

echo ""
echo "Jeu réinitialisé. Vous pouvez lancer une nouvelle partie avec : ./start.sh"
