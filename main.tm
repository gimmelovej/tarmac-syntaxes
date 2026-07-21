// arquivo de teste visual para o highlight da extensão

int contador = 0;
int64 endereco = 4096;
float pi = 3.14;
bool ativo = true;
char inicial = 'T';
string mensagem = "ola, tarmac\n";

contador = contador + 1;

if (contador > 0) {
    print(mensagem);
    print(contador);
} else {
    print("zero\n");
}

int64 valor = atoi("1234");
int64 buffer = mmap_alloc(64);
mmap_free(buffer, 64);
