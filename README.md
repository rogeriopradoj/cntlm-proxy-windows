# rogeriopradoj/cntlm-proxy-windows

Rode, no Windows, um proxy HTTP de maneira fácil.

Útil para acessar por linha de comando ferramentas de gestão de dependências (ex. composer, npm, nuget, pip, conda, mamba) com URLs que são acessíveis via navegador mas não funcionam via terminal (wget, curl).

Agora, em duas versões de proxy, (muito obrigado [@la-costa](https://github.com/la-costa) por compartilhar sobre o px):

- [cntlm](http://cntlm.sourceforge.net/) (necessário digitar seu password no momento da execução)
- [px](https://github.com/genotrance/px) (não é necessário fazer nenhuma configuração, pega os dados da sua sessão do Windows automaticamente)

## .env

O .env é necessário em ambos os formatos, seja com cntlm ou px. Existem variáveis específicas lá dentro, CNTLM_* e PX_*.

Confirme que você tem um arquivo `.env` na raiz do projeto. Se precisar
de um arquivo de exemplo, use o `.env.example`

## Como iniciar o proxy

### Com o px (mais simples, recomendado)

1. Execute o `start_px.bat` e siga as orientações em tela até aparecer a mensagem `Serving at :3128 proc MainProcess`;

### Com o cntlm (tem um passo a mais, digitar sua senha)

1. Execute o `start_cntlm.bat` e siga as orientações em tela até colocar a senha;

## Depois do proxy ligado (cntlm ou px), como utilizar no seu terminal

1. Abra outro terminal (cmd ou bash):
    1. **cmd**: arraste o arquivo `proxy_set_cmd.bat` e execute
    2. **bash**: escreva `source`, coloque um espaço, arraste o arquivo `proxy_set_bash.sh`, e execute
    1. **powershell**: arraste o arquivo `proxy_set_powershell.ps1` e execute
2. Nesse mesmo terminal que está, execute os comandos que precisam do proxy

## Como interromper

Quando terminar, feche:

- esse terminal que está trabalhando
- a outra tela, que está rodando o start_cntlm.bat ou o start_px.bat
