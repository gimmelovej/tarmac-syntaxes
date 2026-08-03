# Changelog

Todas as mudanças notáveis deste projeto são documentadas aqui. Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/); este projeto ainda está em **beta** (pré-1.0), então a numeração `0.x` pode incluir mudanças incompatíveis entre versões menores.

## [0.1.0] - 2026-08-03

Atualiza a gramática para acompanhar a linguagem Tarmac atual — que passou a compilar de ponta a
ponta funções, `while`, `return`, `buffer` e métodos.

### Adicionado
- Palavra-chave de controle `while` e `return` (agora reconhecidos e consumidos pelo parser do
  compilador, com nó de AST próprio).
- Declaração de função (`function`): a palavra-chave e o **nome definido** (`function dobro(...)`)
  ganham escopos próprios (`storage.type.function` e `entity.name.function`).
- Tipo `buffer`.
- Funções nativas com escopo próprio (`support.function.builtin`): `print`, `atoi`, `read_buf`,
  `emit_note`, `mmap_alloc`, `mmap_free`, `brk_alloc`, `brk_free` — distintas de chamadas a funções
  do usuário.
- Acessor de método (`.`) e destaque do nome do método em `buf.str()`/`buf.len()`.
- `fixtures/showcase.tm` reescrito para exercitar a sintaxe atual (funções, globais, `while`,
  `buffer`, métodos) e snapshot regravado.

### Alterado
- `return` voltou à lista de palavras-chave de controle (na 0.0.2 tinha sido removido porque o parser
  ainda não o consumia; agora consome).
- Documentação (`README.md`, `CONTRIBUTING.md`) atualizada para o estado atual da linguagem e para o
  fluxo de branches do projeto.

## [0.0.2] - 2026-07-22

### Corrigido
- Strings da gramática (`syntaxes/tarmac.tmLanguage.json`) agora param no fim da linha (`(?=\n)`) além de em `"` — uma aspa esquecida enquanto se digita não vaza mais o escopo de string pelo resto do arquivo.
- Removido `return` da lista de palavras-chave destacadas: o lexer do compilador reconhece o token, mas nenhuma regra do parser o consome hoje (não existe nem um protótipo, como existe para `function`). Reintroduzir quando houver uma regra real, para manter a promessa do README de não sugerir sintaxe que ainda não compila.

### Adicionado
- Escopos de pontuação (`;`, `,`, `{`, `}`, `(`, `)`) — antes não tinham nenhum escopo TextMate.
- Escopos separados para inteiros (`constant.numeric.integer.tarmac`) e ponto flutuante (`constant.numeric.float.tarmac`), antes unificados.
- `indentationRules` e `onEnterRules` em `language-configuration.json` (indentação após `{`/`}` e continuação automática de `// `).
- Campos de manifesto para o Marketplace: `icon`, `homepage`, `bugs`, `capabilities.untrustedWorkspaces`/`virtualWorkspaces`.
- Ícone da extensão (`images/icon.png`).
- Testes de gramática automatizados (`vscode-tmgrammar-snap`, ver `tests/`) e workflows de CI/release no GitHub Actions.
- `fixtures/showcase.tm` como exemplo curado (sem `function`, que ainda não compila) usado nos testes de gramática.

### Alterado
- Ordem da alternância de operadores de comparação (`>=|<=|==|<|>`) reescrita para não depender da coincidência de que operadores de 2 caracteres já apareciam antes do de 1 caractere equivalente.

## [0.0.1] - 2026-07-20

### Adicionado
- Primeira versão: highlight de tipos, palavras-chave de controle, literais, comentários, chamadas de função e operadores para arquivos `.tm`/`.tarmac`.
