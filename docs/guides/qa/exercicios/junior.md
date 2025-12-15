# Exercícios — Júnior

Objetivo: implementar validação automatizada, testes unitários e cobrir casos reais.

Tarefas:

1. Implementar `validarCNPJ()` (TypeScript ou Python) conforme `CNPJ-Docs/docs/guides/guia-implementacao.md`.
2. Escrever uma suite de testes unitários cobrindo:
   - Casos happy-path (CT-001 a CT-005)
   - Formatos inválidos (CT-006 a CT-010)
   - Dígitos verificadores (CT-011 a CT-015)
   - Edge-cases (CT-016 a CT-018)
3. Criar fixture com 100 CNPJs mistos (válidos/inválidos) e rodar os testes.
4. Gerar relatório de cobertura (meta mínima: definida pela equipe, ex.: 80%).
5. Entrega: PR com código + `README.md` explicando como rodar os testes localmente.

Critério de aceitação:
- Implementação com testes automatizados e relatório de cobertura.
- Passar no CI local (ex.: `pytest` ou `npm test`).

Tempo estimado: 2–4 dias.