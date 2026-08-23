# Contribuindo

A gramática desta extensão deve refletir exatamente o que o *lexer* do [compilador Tarmac](https://github.com/gimmelovej/tarmac) aceita — nunca o que está planejado. Antes de destacar um recurso novo, confirme no `checkKeyword`/scanner do lexer (ou no README do compilador, seção "Estado do desenvolvimento") que ele já é reconhecido, mesmo que ainda não compile de ponta a ponta.

## Fluxo de branches e Pull Requests

- **`main`** — linha estável; recebe só *merges* de release (cada release ganha uma tag `vX.Y.Z`,
  que dispara o workflow de publicação). Sem *commit* direto.
- **`develop`** — linha de integração, base do dia a dia.
- ***feature branches*** — toda mudança sai de `develop` (`feat/...`, `fix/...`, `docs/...`,
  `chore/...`) e volta via **Pull Request** para `develop`. O [CI](.github/workflows/ci.yml) roda no
  PR (testes de gramática + `lint:json` + empacotamento).

## Rodando localmente

```bash
npm install
npm test          # roda os testes de gramática (fixtures/*.tm)
npm run lint:json # valida os três arquivos JSON do projeto
```

Pressione `F5` no VS Code para abrir uma janela de "Extension Development Host" com a extensão carregada.

## Atualizando a gramática

1. Edite `syntaxes/tarmac.tmLanguage.json`.
2. Se o exemplo em `fixtures/showcase.tm` não cobrir o caso novo, adicione uma linha nele.
3. Rode `npm run test:update` para regravar o snapshot esperado e **revise o diff do snapshot manualmente** — ele é a prova de que a mudança foi intencional.
4. Descreva a mudança em `CHANGELOG.md`.

## Ordem importa

Três armadilhas conhecidas nesta gramática (documentadas com `"comment"` no próprio JSON):

- `numbers`: o padrão de `float` precisa vir antes do de `integer`, senão a parte decimal de `3.14` é cortada.
- `operators`: operadores de comparação de 2 caracteres (`>=`, `<=`, `==`) precisam vir antes de qualquer operador de 1 caractere que os "contenha" (`<`, `>`), porque o motor de regex testa alternativas em ordem de leitura, não por comprimento.
- `operators`: pela mesma regra, as atribuições compostas (`+=`, `-=`, `*=`, `/=`) precisam vir antes dos aritméticos de 1 caractere — senão o `+` de `+=` é consumido sozinho e sobra um `=` de atribuição simples.
