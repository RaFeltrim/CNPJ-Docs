# Gabarito — Pleno

1. Exemplo básico de workflow GitHub Actions (unit + integration):

```yaml
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.10'
      - name: Install
        run: pip install -r requirements.txt
      - name: Run tests
        run: pytest -q
```

2. Exemplo k6 script (esqueleto):

```js
import http from 'k6/http';
import { check } from 'k6';

export default function () {
  let res = http.post('https://staging/api/validar', { cnpj: '11222333000181' });
  check(res, { 'status 200': (r) => r.status === 200 });
}
```

3. Instruções para E2E: executar Cypress com base em fixtures e configurar ambiente de staging.  

4. Pipeline deve gerar artefatos: relatórios de teste e coverage.