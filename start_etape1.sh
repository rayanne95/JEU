#!/usr/bin/env bash
# start_etape1.sh — Étape 1 avec compte à rebours 1:30 + setup du défi
# Objectif : dans etape1/texte.txt, compter le nombre de 'a' (minuscules)
#            et écrire la réponse (juste le nombre) dans etape1/reponse.txt

set -euo pipefail

ETAPEDIR="etape1"
mkdir -p "$ETAPEDIR"

# Crée le texte de travail (tu peux le modifier si tu veux un autre contenu)
cat > "$ETAPEDIR/texte.txt" <<'TXT'
Un jeu d’Halloween en terminal où tu explores la maison de Granny,
apprends/pratiques des commandes Linux (cd, ls, cat, grep, find, sed, tar, mv, cp, rm),
fouilles des fichiers et archives pour accomplir 5 étapes avec un seul essai chacune,
un système de vies (3 au final, −1 par échec, 0 si réussi) et une vérification automatique.
TXT

# Fichier de réponse (à remplir par toi)
: > "$ETAPEDIR/reponse.txt"

# Init des vies si absent (style simple)
LIVES_FILE=".lives"
if [[ ! -f "$LIVES_FILE" ]]; then
  echo "LIVES=3" > "$LIVES_FILE"
fi

# Timer 4 min (240 s) : on stocke une DEADLINE epoch dans le dossier d'étape
DEADLINE_FILE="$ETAPEDIR/.deadline"
END=$(( $(date +%s) + 240 ))
echo "$END" > "$DEADLINE_FILE"

cat <<'MSG'
=== ÉTAPE 1 — Compter les 'a' (minuscules) ===
1) Ouvre le fichier :  etape1/texte.txt
2) Calcule le NOMBRE TOTAL de lettres 'a' (minuscules seulement).
3) Écris ce nombre, seul, dans :  etape1/reponse.txt

⏳ Tu as 4 minutes. Quand tu es prêt, lance :
   ./verification_etape1.sh

Astuce (optionnelle) pour compter :  grep -o 'a' etape1/texte.txt | wc -l
(MSG)

printf "Timer lancé jusqu'à : %s\n" "$(date -d "@$END" 2>/dev/null || date)"
echo "Démarre l'exercice !"
