# Gabarito — Júnior

1. Exemplo mínimo `validarCNPJ()` em Python (pseudocódigo):

```python
def normalizar(cnpj):
    return ''.join(filter(str.isdigit, str(cnpj))).zfill(14)

def calcular_dv(valores, pesos):
    total = sum(v*p for v,p in zip(valores, pesos))
    resto = total % 11
    return 0 if resto < 2 else 11 - resto

# uso: validar a string limpa, comparar DVs
```

2. Exemplos de testes pytest:
- `test_valid_cnpj()` para CT-001
- `test_invalid_length()` para CT-006
- `test_dv_incorrect()` para CT-011

3. Fixture de 100 CNPJs: CSV com colunas `cnpj,esperado`.

4. Comandos de execução:

```
pytest -q --maxfail=1
coverage run -m pytest && coverage report
```