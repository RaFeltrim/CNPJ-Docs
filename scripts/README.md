# Scripts — helpers do projeto

Contém utilitários para configurar secrets e deploys locais/CI.

Principais scripts:

- `update-github-secrets.sh`: publica `DOCKER_USERNAME`, `DOCKER_PASSWORD` e `PRODUCTION_*` como GitHub Actions Secrets usando a CLI `gh`. Execute localmente definindo variáveis de ambiente — não armazene tokens no código.

Uso recomendado:

```bash
export DOCKER_USERNAME=rafeltrim
export DOCKER_PASSWORD="SEU_NOVO_TOKEN"
export PRODUCTION_HOST="203.0.113.10"      # opcional
export PRODUCTION_USER="deploy"            # opcional
export PRODUCTION_DEPLOY_PATH="/home/deploy/app" # opcional
./scripts/update-github-secrets.sh
```

Notas de segurança:
- Sempre rotacione tokens expostos.
- Use `gh auth login` para autenticar a CLI antes de rodar o script.
