# Segurança e gerenciamento de Secrets

Resumo rápido e procedimentos recomendados depois da inserção de credenciais de teste no repositório.

1) Rotacionar imediatamente
- Revogue o token exposto no GitHub: Settings → Developer settings → Personal access tokens (ou Tokens fin‑grained) → Revoke/Delete.
- Gere novo token com scope mínimo: `read:packages` e `write:packages` para GHCR (ou `packages:write` se usar PAT clássico).

2) Remover credenciais do repositório
- Nunca deixe secrets em arquivos rastreados pelo Git. Remova-os e faça commit com mensagem descritiva, por exemplo:

```bash
git add scripts/update-github-secrets.sh
git commit -m "chore(security): remove credenciais hardcoded"
git push origin <sua-branch>
```

- Se as credenciais apareceram no histórico, use `git filter-repo` ou BFG para limpar o histórico e rotacione os tokens novamente.

3) Publicar como GitHub Actions Secrets
- Use a interface web ou a CLI `gh` (recomendado para automação). Evite colar tokens em chats.

Exemplo (local):
```bash
export DOCKER_USERNAME=rafeltrim
export DOCKER_PASSWORD="SEU_NOVO_TOKEN"
./scripts/update-github-secrets.sh
```

4) Teste e validação
- Após publicar os secrets, dispare manualmente os workflows (`workflow_dispatch`) ou dê push na branch `smarthub` para validar `publish.yml` e `deploy.yml`.
- Verifique logs de `Login to GHCR` e `Build & push`.

5) Checklist de segurança (pre-deploy)
- Tokens rotacionados e com escopo mínimo
- Secrets salvos no GitHub Actions (não no código)
- Acesso a secrets restringido por equipe/permissões
- Scanning de commits configurado

6) Recursos e recuperação
- Caso o token tenha sido comprometido, além de revogar: verifique logs de actions e atividades suspeitas, e considere regenerar imagens/artefatos se necessário.
