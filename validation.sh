#!/bin/bash

CODE_CORRECT="920"
TEMPS_LIMITE=600 # 10 minutes en secondes

# 1. Vérifie si le timer est actif
if [ ! -f ".game_timer" ]; then
    echo "❌ Erreur : Le timer n'a pas ete lance. Veuillez executer './start.sh' d'abord."
    exit 1
fi

# 2. Vérifie la présence de la reponse
if [ ! -f "reponse.txt" ]; then
    echo "❌ Erreur : Le fichier 'reponse.txt' est manquant."
    exit 1
fi

# Lit le contenu de reponse.txt et le nettoie
REPONSE_JOUEUR=$(cat reponse.txt | tr -d '[:space:]')

# 3. Vérification du Temps Écoulé
HEURE_DEBUT=$(cat .game_timer)
HEURE_ACTUELLE=$(date +%s)
TEMPS_ÉCOULÉ=$((HEURE_ACTUELLE - HEURE_DEBUT))
TEMPS_RESTANT=$((TEMPS_LIMITE - TEMPS_ÉCOULÉ))

if [ "$TEMPS_ÉCOULÉ" -ge "$TEMPS_LIMITE" ]; then
    echo ""
    echo "⏰ FAUX : TEMPS ÉCOULÉ ! ($TEMPS_ÉCOULÉ secondes)"
    echo "La validation a echoue car vous etes hors delai."
    exit 1
fi

# 4. Vérification du Code (si le temps est valide)
if [ "$REPONSE_JOUEUR" == "$CODE_CORRECT" ]; then
    echo ""
    echo "✅ VRAI : SUCCÈS ! Code valide ($CODE_CORRECT) et soumis en $TEMPS_ÉCOULÉ secondes."
    echo "Il vous restait $TEMPS_RESTANT secondes. Module desactive."
    # Nettoyage des fichiers du module
    rm .game_timer start.sh reponse.txt validation.sh
    exit 0
else
    echo ""
    echo "❌ FAUX : CODE INCORRECT. La reponse trouvee dans 'reponse.txt' est '$REPONSE_JOUEUR'."
    echo "Temps ecoule : $TEMPS_ÉCOULÉ secondes."
    exit 1
fi
