# Valorant API

Atividade de treino em Dart para consumir API externa, usando a [Valorant API](https://valorant-api.com) com recursos feitos por mim: menu interativo no terminal, classe `Agente` personalizada e busca por nome.

> A API é pública e não foi criada por mim.

## O que o programa faz

- **Listar** — busca todos os agentes jogáveis na API e exibe nome, descrição, função e habilidades no console.
- **Pesquisar** — filtra agentes pelo nome digitado no terminal.
- **Filtro automático** — ignora personagens não jogáveis (`isPlayableCharacter == false`).
- **Classe `Agente`** — encapsula os dados da API e formata a saída com `exibirDetalhes()` e `toJson()`.

## Como executar

O código principal fica na pasta `bin/`. Com Dart instalado:

```bash
cd valorantapi
dart run
```

> É necessário conexão com a internet para as requisições à API.

## Estrutura do projeto

```
apis/
├── bin/
│   └── apis.dart       # Ponto de entrada, menu e lógica principal
├── lib/
│   └── apis.dart       # Classe Agente
```
