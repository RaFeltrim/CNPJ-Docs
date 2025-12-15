# CI/CD e deploy — como validar e executar (smarthub)

Este documento descreve como validar os workflows de CI/CD que configuramos para a estratégia `smarthub`.

1) Pré-requisitos
- Secrets configurados em cada repositório: `DOCKER_USERNAME`, `DOCKER_PASSWORD`, `PRODUCTION_HOST`, `PRODUCTION_USER`, `PRODUCTION_SSH_KEY`, `PRODUCTION_DEPLOY_PATH`.
- `gh` CLI instalada e autenticada para operações locais.

2) Validar build/push de imagens (GHCR)
- Trigger: push na branch `smarthub` ou executar o workflow `Publish Docker images` manualmente (`workflow_dispatch`).
- Verifique estas etapas no log do workflow:
  - `Login to GHCR` — sucesso de autenticação
  - `Build & push Dockerfile.multi artifacts` — imagens publicadas com tag `:smarthub`

3) Validar deploy remoto (staging)
- Configure `PRODUCTION_*` secrets apontando para um droplet/staging controlado.
- Execute `Deploy` workflow manualmente ou faça push em `smarthub`.
- O workflow usa `scripts/production-deploy.sh` para executar `docker compose pull` e `docker compose up -d` no host remoto.

4) Testes pós-deploy
- Use o `monitoring/health-check.py` ou `curl` para validar endpoints de health.
  - Exemplo:
  ```bash
  python monitoring/health-check.py --url https://staging.seu-host.com/health
  ```

5) Rollback manual
- Se algo der errado, conecte-se ao host e rode:
  ```bash
  docker compose logs --tail 200
  docker compose up -d --force-recreate
  ```

6) Automação adicional (recomendada)
- Adicionar step que verifica a existência da imagem antes do deploy e notifica em caso de falha (Slack/Telegram).
- Incluir um job `canary` que faz deploy em um subset de serviços antes do rollout completo.
