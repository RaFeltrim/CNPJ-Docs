# Exemplos de Uso da API Platform One

## Criar Projeto
```http
POST /api/v1/projects
Content-Type: application/json
{
  "name": "Projeto Exemplo",
  "description": "Projeto de testes automatizados",
  "test_types": ["pytest", "e2e"],
  "config": {}
}
```

## Listar Projetos
```http
GET /api/v1/projects
```

## Iniciar Execução de Testes
```http
POST /api/v1/executions
Content-Type: application/json
{
  "project_id": "<id do projeto>",
  "test_type": "pytest"
}
```

## Consultar Execuções
```http
GET /api/v1/executions?project_id=<id>&status=passed
```

## Webhook de Resultado (enviado pelo MS)
```http
POST /api/v1/webhooks/test-hub
Content-Type: application/json
{
  "execution_id": "<id>",
  "status": "passed",
  "results": { "total": 10, "passed": 10, "failed": 0 }
}
```

## Consultar Analytics
```http
GET /api/v1/analytics/overview
GET /api/v1/analytics/trends
```
