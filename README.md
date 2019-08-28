# rogeriopradoj/cntlm-proxy-windows - **Versão ExperTI**

--

*Versão ExperTI*: Esta versão disponível neste branch foi feita especialmente para facilitar uso no ambiente ExperTI.

Caso esteja buscando a solução geral, [acesse o branch principal no GitHub](https://github.com/rogeriopradoj/cntlm-proxy-windows).

--

Rode, no Windows, um proxy HTTP de maneira fácil.

- [cntlm](http://cntlm.sourceforge.net/) (necessário digitar seu usuário e password no momento da execução)

## .env

Confirme que você tem um arquivo `.env` na raiz do projeto. Se precisar
de um arquivo de exemplo, use o `.env.example`

## 1. Como iniciar o proxy cntlm

Execute o `cntlm_start.bat` e siga as orientações em tela, colocando usuário e senha.

## 2. Como usar, depois do proxy ligado

### 2.1. Como usar no navegador

Ir nas configurações de rede do navegador e configurar:

- endereço: localhost
- porta: 3128

### 2.2. Como utilizar no seu terminal

1. Abra outro terminal (cmd ou bash):
    1. **cmd**: arraste o arquivo `proxy_set_cmd.bat` e execute
    2. **bash**: escreva `source`, coloque um espaço, arraste o arquivo `proxy_set_bash.sh`, e execute
2. Nesse mesmo terminal que está, execute os comandos que precisam do proxy

## 3. Como interromper o proxy cntlm

Quando terminar, feche:

- o terminal e o navegador que estiver trabalhando
- a outra tela, que está rodando o cntlm_start.bat
