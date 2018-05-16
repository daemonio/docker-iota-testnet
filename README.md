# docker-iota-testnet
Docker da testnet da IOTA.

## Configurações

O arquivo `wallet-values.txt` contém 20 wallets com `10^9` iotas cada. Modifique a vontade.

## Instalação

    $ git clone https://github.com/daemonio/docker-iota-testnet
    $ cd docker-iota-testnet
    $ docker build -t="docker-iota-testnet" .
    $ docker run --rm -d -p 14265:14265 image
    
Você pode testar se o servidor está funcionando, digitando:

    $ curl -H "X-IOTA-API-Version: 1.4.1.6" -X POST -d '{"command":"getNodeInfo"}' http://localhost:14265
    
Se aparecer informações JSON é porque está tudo ok.

## Instalação da carteira

Obtenha sua wallet:

    $ wget https://github.com/iotaledger/wallet/releases/download/v2.5.7/iota_2.5.7_amd64.deb
    $ sudo dpkg -i iota_2.5.7_amd64.deb
    
Se aparecer erro, execute:

    $ sudo apt -f install

## Uso da carteira

Primeiramente escolha um SEED no `Snapshot.txt`.

    $ head Snapshot

Vamos escolher a SEED: XXX

Abra a carteira:

    $ iota

Configure a conexão no node. `Tools->yyyy->Custom`. Digite: `http://endereo-do-node:14265`

Vai aparecer `Balance = 0`. Vá para `Receive` e clique na opção. Espere um pouco e cheque o Balance novamente.
