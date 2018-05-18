# docker-iota-testnet
Docker da testnet da IOTA.

## Primeiros passos

Antes de tudo, baixe esse repositório e entre no diretório:

    $ git clone https://github.com/daemonio/docker-iota-testnet
    $ cd docker-iota-testnet

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

Primeiramente escolha um SEED no `Snapshot.log`.
    
    $ grep Seed Snapshot.log | head
    Seed: WSHQRZICNFQUQPAPYWKFPWKTWWBPQNMTDNBYSGFZURGBWONDQEBPLNUXJVQTPYNFJKKTFATIVJTBSAWUX
    Seed: WXBTI9EVKNBEMBWMQUVOKALPQZGURKXQUUOZMGLIPIPU99RCYSPPIOQN9SJSPTDZVIIXKPRJQIVQARINL
    Seed: G9OJZJEJFHFDRET9VBMSJEQEJSMPJHTSEZHYSXIFASRQFHDWMQHVGBSHHKIVXBTVDOLBYZCQJMFYEWTEB
    Seed: PPVZXUUKOYLLIVWDEWKHXUQIPVTFRZDDESIDDXOWRDZ9SSZKPEGISTWMJDMTVVYTX9FFZBRECPJNXXGSO
    Seed: SBCDYY9UCBAGKCCWUYCBRJXLNUNOQCXCHUOXCNL9OZNUQYXQNVCAZFZSZHES9CBEYISQM9IPPECDXYVGN
    Seed: UCJJIWRGQXXJWLJFWRACJKMYWLFEZQROBFWHRWGZRVWGPBZMRZCMHMAYEIHCPYGAIIDUUHFKXLZZVNIAQ
    Seed: YIRZRQQUKSOKCAEMZ9DJRFGNYLICXMIFUXAXMXMFFHNSHTRRONKPBRSFOHDIFXBBDENHLYJUYBI9WWVBQ
    Seed: TWLKWEKNRPQOBAKADXCYEQAYTJRFNAPRREYZE9JVYUMIAXLVUBOOMKQINKRPFYGAAEJWWISPBCHM9RJIA
    Seed: IYETTWUZHYSJZPMYWMOYNHDAWOQRCLZBQQWSHEWMPZRIL9NKCFZQIHHWDKFMVRFAD9YFYUMMCWBYYLOTO
    Seed: 9ZWG9PYDMWDPUZ9LOXZPIYCKZFOBAOEFPDYZXGHOXTLV9DWYFSBREURIMWPZMJZWV9RHUPUAQTBKXTIAN

Vamos escolher a SEED:

    WSHQRZICNFQUQPAPYWKFPWKTWWBPQNMTDNBYSGFZURGBWONDQEBPLNUXJVQTPYNFJKKTFATIVJTBSAWUX

Abra a carteira:

    $ iota

Configure a conexão no node. `Tools->Edit Node Configuration->Custom`. Digite: `http://endereco-do-node:14265`. Para logar, digite a SEED escolhida.

Vai aparecer `Balance = 0`. Vá para `Receive` e clique na opção `Attach To Tangle`. Espere um pouco, pois pode demorar dependendo da velocidade do node. Quando aparecer `"Address Attached"` cheque o `Balance` novamente.
