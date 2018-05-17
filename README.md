# docker-iota-testnet
Docker da testnet da IOTA.

## Primeiros passos

Antes de tudo, baixe esse repositório e entre no diretório:

    $ git clone https://github.com/daemonio/docker-iota-testnet
    $ cd docker-iota-testnet

## Configuração do Snapshot (optativo)

O Snapshot é o arquivo que contém as carteiras (SEED's) do Tangle para a testnet. Basicamente, se você quiser testar carteiras terá que usar as SEEDs do Snapshot.

Esse projeto já vem com um Snapshot default nos arquivos `Snapshot.txt` e `Snapshot.log`. Caso você queira gerar outro Snapshot é preciso executar:

     $ java -jar iota-testnet-tools-0.1-SNAPSHOT-jar-with-dependencies.jar SnapshotBuilder
     
 Preencha as linhas com valores para as carteiras, e aperte `ENTER` duas vezes para terminar.

## Build & Execução do docker
    
    $ docker build -t="docker-iota-testnet" .
    $ docker run --rm -d -p 14265:14265 docker-iota-testnet
    
Espere um pouco, o servidor demora para subir. Você pode testar se o servidor está funcionando, digitando:

    $ curl -H "X-IOTA-API-Version: 1.4.1.6" -X POST -d '{"command":"getNodeInfo"}' http://localhost:14265
 
Se aparecer `"curl: (56) Recv failure: Connection reset by peer"` é porque o servidor ainda não subiu. Se aparecer informações JSON é porque está tudo ok.

    {
    "appName": "IRI",
    "appVersion": "1.4.1.6",
    "jreAvailableProcessors": 1,
    "jreFreeMemory": 160628072,
    "jreVersion": "1.8.0_151",
    "jreMaxMemory": 8303607808,
    "jreTotalMemory": 259522560,
    "latestMilestone": "999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    "latestMilestoneIndex": 243000,
    "latestSolidSubtangleMilestone": "999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    "latestSolidSubtangleMilestoneIndex": 243000,
    "neighbors": 0,
    "packetsQueueSize": 0,
    "time": 1516205078378,
    "tips": 0,
    "transactionsToRequest": 0,
    "duration": 27
    }

## Instalação da carteira

Obtenha sua wallet:

    $ wget https://github.com/iotaledger/wallet/releases/download/v2.5.7/iota_2.5.7_amd64.deb
    $ sudo dpkg -i iota_2.5.7_amd64.deb
    
Se aparecer erro, execute:

    $ sudo apt -f install

## Uso da carteira

Primeiramente escolha um SEED no `Snapshot.txt`.

    $ head Snapshot.txt
    EDLETIIQYYAIEBXJQVQ9RTWNTSLLXJWJYI9RDVXGOEDFEGH9CYKFZXAFGVEQKZ9GRQDFBB9KDDUXACTSC;1000000000
    ESFFNEAEDKCPGRNLVGBWO9P9ZP999NPXCOO9OOPZQUNZCJGEF9NMWTCZ9CQGUO9MQKEN9JWIVMRMKQDDW;1000000000
    WZCCWAQVKGWSMWXQNRYQYBOCENQMHTHAIJCNHFVGDINKR9MCMCOYNLSL9IREKSIOKKJSBGHXLTOIMDLBW;1000000000
    HOYVQIHUOGICECJUPXYWXJZSAOMFBETRLFTXCCABEIXVOUCZTUYVWEZZJDJDBAHOWOWNDSVABRWAHAHKC;1000000000
    SXPGNCHTE9JSMHEMH9YGDDJYNMPCLQKZAQFIKDETNVMQFMWNTDMTEJCDBDSOZYVXTMLOJVPFQPPVNEXGZ;1000000000
    UVBSHHMSLTWZSJTOMQZRCEHWJNYACOBVZXBQGEYDZ9ATSZFUCJBOGHXQMAGMEP9XGZKNFLJGVLWHKTGHB;1000000000
    EQUXKXWZLJHDEUMCBGTBK9KZW9TFUWUSIRTHKVWEAUCGYGITLBWMNPDXXJWLDROUHKGKGVEITLQFLNRKZ;1000000000
    VIACCVOHYTWXKLCXJPBWOWKSSWMXQOPAGVHUSAWFXELRTQIKUFPHFBLVFGQNEXKCOPDMAJBIPYPQYNRKC;1000000000
    AHS9NQYNKUDKOQGFXOOWFNUUXEZ9GQUAGQPCVVPAADBJFUYIVTRWZQBSVOWCHZINTNHQOY9UZGJQDH9UD;1000000000
    AMNXUSEUGUHS9THNXVBSXWVOBQZOFECZOWKOX9LYJXUNTXRIVTOUPICZHQPQGIKKAP9BOIAPAXTH9JKIZ;1000000000

Vamos escolher a SEED:

    EDLETIIQYYAIEBXJQVQ9RTWNTSLLXJWJYI9RDVXGOEDFEGH9CYKFZXAFGVEQKZ9GRQDFBB9KDDUXACTSC

Abra a carteira:

    $ iota

Configure a conexão no node. `Tools->Edit Node Configuration->Custom`. Digite: `http://endereco-do-node:14265`. Para logar, digite a SEED escolhida.

Vai aparecer `Balance = 0`. Vá para `Receive` e clique na opção `Attach To Tangle`. Espere um pouco, pois pode demorar dependendo da velocidade do node. Quando aparecer `"Address Attached"` cheque o `Balance` novamente.
