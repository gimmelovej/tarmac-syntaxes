# Tarmac Syntax Highlighting

Extensão do VS Code que adiciona *syntax highlighting* para [Tarmac](https://github.com/gimmelovej/tarmac), uma linguagem de baixo nível compilada para *assembly* x86-64.

Esta extensão **não** inclui compilador, *linter* ou *debugger* — apenas coloração de sintaxe e configuração básica de edição (comentários, fechamento automático de parênteses/aspas). Para compilar e executar código Tarmac, use o [compilador oficial](https://github.com/gimmelovej/tarmac).

## Recursos

Reconhece os arquivos `.tm` e `.tarmac` e destaca:

- Palavras-chave de controle: `if`, `else`, `return`
- Tipos: `string`, `char`, `int64`, `int`, `bool`, `float`
- Literais: números (`123`, `3.14`), strings (`"texto"`, com escapes `\n`, `\t`, `\"`, `\\`), caracteres (`'a'`) e booleanos (`true`, `false`)
- Comentários de linha (`// ...`)
- Chamadas de função, incluindo as nativas do runtime (`print`, `atoi`, `mmap_alloc`, `mmap_free`, `brk_alloc`)
- Operadores aritméticos (`+ - * /`), de comparação (`== < > <= >=`) e de atribuição (`=`)

A gramática é mantida em sincronia com o que o *lexer* do compilador realmente aceita — recursos que a linguagem ainda não suporta (funções definidas pelo usuário, `while`/`for`, `%`, `&&`/`||`, hexadecimais etc.) não são destacados, para não sugerir uma sintaxe que ainda não compila.

## Instalação

### Opção 1 — Marketplace (assim que publicada)

A extensão ainda não está publicada, por hora, tente a opção listada abaixo.

### Opção 2 — Instalar manualmente a partir de um `.vsix`

Útil se você baixou o arquivo `.vsix` de uma [release no GitHub](https://github.com/gimmelovej/tarmac-syntaxes/releases) em vez de usar o Marketplace:

```bash
code --install-extension tarmac-syntax-0.0.1.vsix
```

Ou pela interface: **Extensions** → menu `...` no topo → **Install from VSIX...** → selecione o arquivo.

### Opção 3 — Rodar a partir do código-fonte (desenvolvimento)

```bash
git clone https://github.com/gimmelovej/tarmac-syntaxes.git
cd tarmac-syntaxes
code .
```

Dentro do VS Code, pressione `F5` (ou **Run and Debug** → **Extension**). Isso abre uma segunda janela do VS Code ("Extension Development Host") com a extensão já carregada — abra ou crie um arquivo `.tm` nela para testar o highlight.

## Estrutura do projeto

```
tarmac-syntaxes/
├── package.json                       # manifesto da extensão
├── language-configuration.json        # comentários, auto-fechamento de pares
├── syntaxes/
│   └── tarmac.tmLanguage.json         # gramática TextMate do highlight
└── main.tm                            # arquivo de exemplo para testar o highlight
```

## Contribuindo

Sugestões e *pull requests* são bem-vindos — principalmente para manter a gramática atualizada conforme o [compilador Tarmac](https://github.com/gimmelovej/tarmac) ganha novos recursos (`while`/`for`, funções definidas pelo usuário, novos operadores etc.).

## Licença

[MIT](LICENSE)
