// vitrine da sintaxe do Tarmac reconhecida pela extensão.
// exercita os escopos da gramática (não é um programa para compilar).

int contador = 0;                 // variável global
string mensagem = "ola, tarmac\n";

// função definida pelo usuário, com parâmetro e retorno
int function dobro(int n) {
    return n + 2;
}

int function main() {
    int64 endereco = 4096;
    float pi = 3.14;
    bool ativo = true;
    char inicial = 'T';

    contador = contador + 1;

    if (contador > 0) {
        print(mensagem);
    } else {
        print("zero ou negativo\n");
    }

    int i = 0;
    while (i < 3) {
        print(i);
        i = i + 1;
    }

    buffer conteudo = read_buf("dados.txt");
    string texto = conteudo.str();
    int64 tamanho = conteudo.len();
    print(texto);

    print(dobro(contador));
    print(atoi("42"));
    emit_note(440, 4000, 200);
    return 0;
}
