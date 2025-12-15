#!/usr/bin/env bash
set -euo pipefail

# update-github-secrets.sh
# Helper para publicar GitHub Actions Secrets em vários repositórios usando CLI `gh`.
# Não armazena valores no repositório — você deve executar localmente passando variáveis de ambiente.
# Uso exemplo:
# DOCKER_USERNAME=rafeltrim DOCKER_PASSWORD=xxxx ./scripts/update-github-secrets.sh

REPOS=(
  "RaFeltrim/platform-one"
  "RaFeltrim/fabrica-de-testes"
  "RaFeltrim/qa-dash-visualization"
)

required=(DOCKER_USERNAME DOCKER_PASSWORD)

if ! command -v gh >/dev/null 2>&1; then
  echo "gh CLI não encontrado. Instale e autentique com 'gh auth login'" >&2
  exit 1
fi

for var in "${required[@]}"; do
  if [ -z "${!var:-}" ]; then
    echo "Variável de ambiente $var não definida. Ex.: export $var=..." >&2
    exit 2
  fi
done

echo "Will set secrets for: ${REPOS[*]}"

for repo in "${REPOS[@]}"; do
  echo "--- $repo"
  gh secret set DOCKER_USERNAME --body "${DOCKER_USERNAME}" --repo "$repo"
  gh secret set DOCKER_PASSWORD --body "${DOCKER_PASSWORD}" --repo "$repo"

  if [ -n "${PRODUCTION_HOST:-}" ]; then""
    gh secret set PRODUCTION_HOST --body "${PRODUCTION_HOST}" --repo "$repo"
  fi
  if [ -n "${PRODUCTION_USER:-}" ]; then
    gh secret set PRODUCTION_USER --body "${PRODUCTION_USER}" --repo "$repo"
  fi
  if [ -n "${PRODUCTION_DEPLOY_PATH:-}" ]; then
    gh secret set PRODUCTION_DEPLOY_PATH --body "${PRODUCTION_DEPLOY_PATH}" --repo "$repo"
  fi
  if [ -n "${PRODUCTION_SSH_KEY:-}" ]; then
    gh secret set PRODUCTION_SSH_KEY --body "${PRODUCTION_SSH_KEY}" --repo "$repo"
  fi

  echo "Secrets updated for $repo"
done

echo "All done. Não esqueça de rotacionar tokens expostos publicamente." 
