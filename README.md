# Tarmac Syntax Highlighting (beta)

Extensão do VS Code que adiciona *syntax highlighting* para [Tarmac](https://github.com/gimmelovej/tarmac), uma linguagem de baixo nível compilada para *assembly* x86-64.

Esta extensão **não** inclui compilador, *linter* ou *debugger* — apenas coloração de sintaxe e configuração básica de edição (comentários, fechamento automático de parênteses/aspas). Para compilar e executar código Tarmac, use o [compilador oficial](https://github.com/gimmelovej/tarmac).

> ⚠️ **Beta, em desenvolvimento ativo.** A extensão está na versão `0.2.0` e sua gramática acompanha
> a linguagem, que ainda evolui — recursos podem ser adicionados ou ajustados entre versões. O Tarmac
> (linguagem/compilador, hoje reescrito em C) também está em beta: compila de ponta a ponta funções
> (com parâmetros e `return`), variáveis locais e globais, `if`/`else`, o laço `while`, o método
> `len()`, menos unário, atribuições compostas (`+=`, `-=`, `*=`, `/=`) e arrays (novo, em
> desenvolvimento) — mas ainda tem limitações conhecidas (veja [Estado do desenvolvimento](https://github.com/gimmelovej/tarmac#estado-do-desenvolvimento)
> no repositório do compilador).
>
> Esta extensão apenas **destaca** a sintaxe reconhecida pelo *lexer* do Tarmac — ela não valida se o
> programa compila, nem se o recurso já está implementado ponta a ponta no *parser*/*codegen*.

## Recursos

Reconhece os arquivos `.tm` e `.tarmac` e destaca:

- Palavras-chave de controle: `if`, `else`, `while`, `return`
- Declaração de função (`function`) — a palavra-chave e o nome definido (`function dobro(...)`)
- Tipos: `string`, `char`, `int64`, `int`, `bool`, `float`, `buffer` (este último ainda é reconhecido pelo *lexer* como palavra-chave, embora o *parser* atual não o consuma)
- Literais: números inteiros e de ponto flutuante (`123`, `3.14`, com escopos separados), strings (`"texto"`, com escapes `\n`, `\t`, `\r`, `\0`, `\"`, `\'`, `\\` — o mesmo conjunto validado pelo *lexer*), caracteres (`'a'`, inclusive com escape: `'\n'`) e booleanos (`true`, `false`)
- Comentários de linha (`// ...`)
- Funções nativas do runtime, com escopo próprio (`print`, `atoi`, `len`, `emit_note`, `mmap_alloc`, `mmap_free`, `brk_alloc`, `brk_free`), distintas de chamadas a funções do usuário — `len` é um método (`nome.len()`)
- Chamadas de função e de método (`dobro(...)`, `nome.len()`), com o acessor `.` destacado
- Operadores aritméticos (`+ - * /`), de comparação (`== < > <= >=`), de atribuição (`=`) e as atribuições compostas (`+= -= *= /=`, com escopo próprio)
- Arrays (novo na linguagem): colchetes do tamanho na declaração (`int[3] v`) e da indexação (`v[0]`) com escopos de pontuação próprios
- Pontuação estrutural (`;`, `,`, `{`/`}`, `(`/`)`, `[`/`]`, `.`) com escopos próprios

A gramática é mantida em sincronia com o que o *lexer* do compilador realmente aceita — construções que a linguagem ainda **não** tem (o laço `for`, os operadores `%` e `!=`, `&&`/`||`/`!`, literais hexadecimais etc.) não são destacadas, para não sugerir uma sintaxe que ainda não existe. Veja [`CONTRIBUTING.md`](CONTRIBUTING.md) para as armadilhas de ordenação de regex que valem atenção ao editar a gramática.

## Instalação

### Opção 1 — Marketplace / Open VSX (assim que publicada)

Ainda não publicada — por ora, a distribuição oficial é o `.vsix` anexado às [releases no GitHub](https://github.com/gimmelovej/tarmac-syntaxes/releases) (Opção 2 abaixo). Quando a publicação sair, vai estar disponível em dois lugares (mesmo `.vsix`, dois registros diferentes):

- [Visual Studio Marketplace](https://marketplace.visualstudio.com/) — VS Code oficial.
- [Open VSX Registry](https://open-vsx.org/) — VSCodium, code-server, Gitpod, Cursor, Windsurf e outros forks sem acesso ao Marketplace da Microsoft.

### Opção 2 — Instalar manualmente a partir de um `.vsix`

Útil se você baixou o arquivo `.vsix` de uma [release no GitHub](https://github.com/gimmelovej/tarmac-syntaxes/releases) em vez de usar o Marketplace (troque `X.Y.Z` pela versão baixada — hoje `0.2.0`):

```bash
code --install-extension tarmac-syntax-X.Y.Z.vsix
```

Ou pela interface: **Extensions** → menu `...` no topo → **Install from VSIX...** → selecione o arquivo.

### Opção 3 — Rodar a partir do código-fonte (desenvolvimento)

```bash
git clone https://github.com/gimmelovej/tarmac-syntaxes.git
cd tarmac-syntaxes
npm install
code .
```

Dentro do VS Code, pressione `F5` (ou **Run and Debug** → **Extension**). Isso abre uma segunda janela do VS Code ("Extension Development Host") com a extensão já carregada — abra `fixtures/showcase.tm` nela (ou crie seu próprio `.tm`) para testar o highlight.

## Testes

A gramática tem testes automatizados via [`vscode-tmgrammar-test`](https://github.com/PanAeon/vscode-tmgrammar-test), rodando em CI a cada *push*/*pull request* (veja [`.github/workflows/ci.yml`](.github/workflows/ci.yml)):

```bash
npm test          # compara fixtures/*.tm contra o escopo esperado em fixtures/*.tm.snap
npm run test:update  # regrava o snapshot depois de uma mudança intencional na gramática
npm run lint:json    # valida os três arquivos JSON do projeto
```

## Estrutura do projeto

```
tarmac-syntaxes/
├── package.json                       # manifesto da extensão
├── language-configuration.json        # comentários, indentação, auto-fechamento de pares
├── CHANGELOG.md
├── CONTRIBUTING.md
├── syntaxes/
│   └── tarmac.tmLanguage.json         # gramática TextMate do highlight
├── fixtures/
│   └── showcase.tm                    # exemplo curado, usado no teste de gramática
├── images/
│   └── icon.png
└── .github/workflows/                 # CI (testes) + release (publica no Marketplace/Open VSX)
```

## Contribuindo

Sugestões e *pull requests* são bem-vindos — principalmente para manter a gramática atualizada conforme o [compilador Tarmac](https://github.com/gimmelovej/tarmac) ganha novos recursos (o laço `for`, novos operadores, `break`/`continue` etc.). Veja [`CONTRIBUTING.md`](CONTRIBUTING.md) para o fluxo de branches e de teste local.

## Licença

[MIT](LICENSE)
