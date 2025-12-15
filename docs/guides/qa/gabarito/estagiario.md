# Gabarito — Estagiário

Modelos e respostas esperadas:

1. Exemplo de bug report (template):
   - Título: Campo CNPJ aceita 13 dígitos
   - Ambiente: Staging
   - Passos:
     1. Acessar /cadastro
     2. Inserir `1122233300018` no campo CNPJ
     3. Submeter
   - Resultado esperado: Validação impede submissão e mostra "CNPJ incompleto. São necessários 14 dígitos." 
   - Resultado observado: Formulário aceitou e retornou erro de backend
   - Evidências: screenshot.png, console.log

2. Checklist preenchido: exemplo com sim/não para pré-condições e ambiente.

3. Exemplo de evidência: screenshot + timestamps + logs (quando aplicável).