#!/bin/bash

# Nom de l'environnement virtuel
ENV_NAME="dev-alex"
PORT=${1:-8000}

# Créer l'environnement virtuel s'il n'existe pas
if [ ! -d "$ENV_NAME" ]; then
    echo "⚙️  Création de l'environnement virtuel $ENV_NAME..."
    python3 -m venv $ENV_NAME
    echo "✅ Environnement virtuel créé."
fi

# Activer l'environnement virtuel
echo "🔄 Activation de l'environnement virtuel $ENV_NAME..."
source $ENV_NAME/bin/activate

# Vérifier que l'environnement est activé
if [ -z "$VIRTUAL_ENV" ]; then
    echo "❌ Erreur: Impossible d'activer l'environnement virtuel"
    exit 1
fi

echo "✅ Environnement virtuel activé: $VIRTUAL_ENV"

# Lancer le serveur HTTP Python
echo ""
echo "🚀 Démarrage du serveur Python sur le port $PORT..."
echo "🌐 Accédez au serveur sur: http://localhost:$PORT"
echo "⏹️  Appuyez sur Ctrl+C pour arrêter le serveur"
echo ""
python -m http.server $PORT
