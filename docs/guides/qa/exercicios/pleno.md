# Exercícios — Pleno

Objetivo: projetar e implementar pipelines de testes e E2E realistas.

Tarefas:

1. Criar pipeline (GitHub Actions) que execute: unit tests → integration tests → E2E (quando aplicável).
2. Implementar 2 cenários E2E (Cypress ou Playwright) cobrindo fluxo de cadastro com CNPJ e feedback de validação.
3. Criar um teste de carga simples com `k6` (meta: P95 < X ms — defina X com a equipe).
4. Projetar massa de dados realista a partir de `casos-teste-realistas.md` e automatizar a geração de fixtures.
5. Entrega: repositório/branch com pipeline, scripts `k6` e instruções de execução.

Critério de aceitação:
- Pipeline acionado em PRs e commits na branch `main`.
- E2E reproduzíveis em ambiente de staging.

Tempo estimado: 3–6 dias.