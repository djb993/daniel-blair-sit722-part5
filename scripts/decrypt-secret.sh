#!/bin/sh

# Decrypt the file
mkdir -p $HOME/secrets

echo "decrypt-secret.sh has run"
# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$LARGE_SECRET_PASSPHRASE" \
--output $HOME/secrets/kubekubeconfig.txt kubeconfig.txt.gpg