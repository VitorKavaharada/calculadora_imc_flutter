# Calculadora de IMC em Flutter

## Objetivo
Desenvolver um aplicativo Flutter que permita ao usuário informar **peso** e **altura**, calcule o **IMC** e exiba a **classificação correspondente**.

---

## Contexto
O **IMC (Índice de Massa Corporal)** é calculado pela fórmula:

IMC = peso/altura^2

- **Peso** informado em quilogramas (kg)  
- **Altura** informada em metros (m)

### Classificação do IMC:

- **Abaixo de 18,5** → Abaixo do peso  
- **18,5 a 24,9** → Peso normal  
- **25,0 a 29,9** → Sobrepeso  
- **30,0 a 34,9** → Obesidade Grau I  
- **35,0 a 39,9** → Obesidade Grau II  
- **40,0 ou mais** → Obesidade Grau III  

---

## Requisitos do Aplicativo
- Dois campos de texto:  
  - Peso (kg)  
  - Altura (m)  
- Um botão **Calcular IMC**  
- Exibição:  
  - Valor do IMC (com 2 casas decimais)  
  - Classificação do IMC  
- Validação básica: impedir cálculo com campos vazios ou inválidos  
- Interface simples e amigável  

---

## Requisitos Técnicos
- Utilizar **Flutter**  
- Criar um app com **StatefulWidget**  
- Usar:  
  - `TextField`  
  - `TextEditingController`  
  - `ElevatedButton`  
  - `setState()`  

---

## Melhorias Implementadas
- Limpeza automática dos campos após o cálculo  
- Exibição de mensagens de erro com **SnackBar**  
- Alteração da cor do resultado conforme a classificação  
---

## Resultado Esperado
O usuário deve conseguir:
1. Inserir peso e altura  
2. Clicar em **Calcular IMC**  
3. Visualizar o resultado

