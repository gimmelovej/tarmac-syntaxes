// vitrine da sintaxe do Tarmac reconhecida pela extensão.
// exercita os escopos da gramática (não é um programa para compilar).

int contador = 0;                 // variável global
string mensagem = "ola, tarmac\n";
string escapes = "tab:\t cr:\r nulo:\0 aspas:\" apostrofo:\' barra:\\";

// função definida pelo usuário, com parâmetro e retorno
int function dobro(int n) {
    return n * 2;
}

int function main() {
    int64 endereco = 4096;
    float pi = 3.14;
    bool ativo = true;
    char inicial = 'T';
    char quebra = '\n';           // literal de caractere com escape

    contador = contador + 1;

    // parênteses na condição são opcionais (mas continuam aceitos)
    if contador > 0 {
        print(mensagem);
    } else {
        print("zero ou negativo\n");
    }

    int i = 0;
    while (i <= 3) {
        print(-i);                // menos unário
        i += 1;                   // atribuição composta
    }

    // arrays (novo): tamanho colado ao tipo, inicializador só na declaração
    int[3] medidas = { 10, 20, 30 };
    medidas[1] = 99;
    medidas[0] += 100;
    print(medidas[2]);

    char[2] iniciais = { 'T', 'm' };
    print(iniciais[0]);

    // método de tipo: len() devolve o comprimento em bytes
    int64 tamanho = mensagem.len();
    if tamanho >= 6 {
        print(tamanho);
    }

    // as demais atribuições compostas
    contador -= 1;
    contador *= 2 + 3;
    contador /= 4;

    // nativas do runtime e chamada a função do usuário
    print(dobro(contador));
    print(atoi("42"));
    emit_note(440, 4000, 200);

    int64 bloco = brk_alloc(64);
    brk_free(bloco);
    int64 regiao = mmap_alloc(4096);
    mmap_free(regiao, 4096);

    return 0;
}
