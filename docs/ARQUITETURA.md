# Arquitetura Platform One

## Visão Geral

```
┌─────────────────────────────────────────────────────────────┐
│                   PLATFORM ONE - HUB CENTRAL                │
│              (Novo Repositório Principal)                   │
│  - Orquestrador de microsserviços                           │
│  - API Gateway                                              │
│  - Database centralizado                                    │
│  - Frontend unificado                                       │
└────────────┬──────────────────┬──────────────────┬───────────┘
             │                  │                  │
    ┌────────▼────────┐ ┌───────▼──────┐ ┌────────▼────────┐
    │  Test Hub MS    │ │  Fabrica MS  │ │  Analytics MS   │
    │  (Executor)     │ │  (E2E Tests) │ │  (Dashboard)    │
    │                 │ │              │ │                 │
    │ - Pytest        │ │ - Playwright │ │ - Trends        │
    │ - Cypress       │ │ - E2E Suite  │ │ - Trends        │
    │ - Others        │ │ - Reports    │ │ - Failure       │
    └─────────────────┘ └──────────────┘ │ - Analysis      │
                                         │ - Real-time     │
                                         │ - Webhooks      │
                                         └─────────────────┘
```

## Componentes
- **API Gateway:** Entrada única, roteamento, autenticação, integração frontend.
- **Orchestrator:** Orquestra execuções, decide para qual MS enviar.
- **Test Hub MS:** Executor de testes unitários/integração (Pytest, etc).
- **Fabrica MS:** Executor de E2E (Playwright, Cypress).
- **Analytics MS:** Métricas, tendências, histórico.
- **Frontend:** Dashboard React, WebSocket, gráficos.
- **Banco Central:** PostgreSQL, schemas separados.
- **Redis:** Cache, mensageria, pub/sub.

## Fluxo de Execução
1. Usuário aciona execução via frontend/API Gateway.
2. Orchestrator decide e envia para o MS correto.
3. MS executa, reporta via webhook.
4. API Gateway atualiza status/resultados.
5. Analytics MS processa métricas.
6. Frontend exibe dados em tempo real.

## Observações
- Todos os serviços rodam em containers Docker.
- Comunicação via HTTP/REST e WebSocket.
- Banco centralizado, schemas por serviço.
- CI/CD automatizado (GitHub Actions).
