# Próximos passos (plano de execução)

Resumo: com a rotação de token adiada, este plano define a sequência de ações para continuar as integrações e validações do pipeline `smarthub`.

1) Publicar secrets (quando houver novo token)
- Quem: você / infra
- Como: usar `./scripts/update-github-secrets.sh` localmente com as variáveis de ambiente definidas.
- Comando:
```bash
export DOCKER_USERNAME=rafeltrim
export DOCKER_PASSWORD="SEU_TOKEN_NOVO"
export PRODUCTION_HOST="203.0.113.10"        # opcional
export PRODUCTION_USER="deploy"               # opcional
export PRODUCTION_DEPLOY_PATH="/home/deploy/app" # opcional
./scripts/update-github-secrets.sh
```

2) Validar build & push (GHCR)
- Trigger: push em `smarthub` ou execute `Publish Docker images` via `workflow_dispatch` no GitHub Actions.
- Verificar: autenticação GHCR, etapas de buildx e push. Logs: `Login to GHCR` e `Build & push Dockerfile.multi artifacts`.

3) Validar deploy em staging
- Quem: infra / dev
- Configurar `PRODUCTION_*` secrets apontando para droplet de staging.
- Trigger: executar `Deploy` workflow manualmente ou push em `smarthub`.
- Validar serviços com `monitoring/health-check.py`.

4) Configurar monitoramento e alertas
- Criar monitors no UptimeRobot e configurar webhooks para Slack/Telegram conforme `monitoring/WEBHOOKS.md`.

5) Verificação de segurança pós-deploy
- Executar scanner de commits para detectar segredos (ex.: `truffleHog`, `detect-secrets`) se houver histórico suspeito.

6) Preparar PRs e revisão
- Criar PRs nas branches `feature/ci-smarthub` com as mudanças de workflow e documentação, solicitar revisão de colegas.

7) Post-mortem e documentação final
- Atualizar `SECURITY_SECRETS_GUIDE.md` com o resultado da rotação e qualquer lição aprendida.

Estimativas e prioridades (alta → baixa):
- Publicar secrets (alta) — quando token disponível
- Validar build/push (alta)
- Validar deploy em staging (média)
- Monitoramento e alertas (média)
- Scanner de commits + PRs (baixa)
