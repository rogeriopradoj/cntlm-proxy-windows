# rogeriopradoj/cntlm-proxy-windows

Rode, no Windows, um proxy HTTP de maneira fácil.

Útil para acessar por linha de comando ferramentas de gestão de dependências (ex. composer, npm, nuget) com URLs que são acessíveis via navegador mas não funcionam via terminal (wget, curl).

## .env

Confirme que você tem um arquivo `.env` na raiz do projeto. Se precisar
de um arquivo de exemplo, use o `.env.example`

## Como rodar

1. Execute o `cntlm_start.bat` e siga as orientações em tela até colocar a senha;
2. Abra outro terminal (cmd ou bash):
    1. **cmd**: arraste o arquivo `proxy_set_cmd.bat` e execute
    2. **bash**: escreva `source`, coloque um espaço, arraste o arquivo `proxy_set_bash.sh`, e execute
3. Nesse mesmo terminal que está, execute os comandos que precisam do proxy cntlm

## Como interromper

Quando terminar, feche:

* esse terminal que está trabalhando
* a outra tela, que está rodando o cntlm_start.bat
