# docker-iota-testnet
Docker da testnet da IOTA.

## Configurações

O arquivo `wallet-values.txt` contém 20 wallets com `10^9` iotas cada. Se quiser mais wallets ou valores, modifique esse
arquivo à vontade. Caso o modifique, não se esqueça de deixar duas linhas vazias no fim do arquivo (dois ENTER's).

## Instalação

    $ git clone https://github.com/daemonio/docker-iota-testnet
    $ cd docker-iota-testnet
    $ docker build -t="docker-iota-testnet" .
    $ docker run --rm -d -p 14265:14265 docker-iota-testnet
    
Você pode testar se o servidor está funcionando, digitando:

    $ curl -H "X-IOTA-API-Version: 1.4.1.6" -X POST -d '{"command":"getNodeInfo"}' http://localhost:14265
    
Se aparecer informações JSON é porque está tudo ok.

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
    QXMWVWPOEOBDCBZYMDXUBI9NKZOGQYCBSUAOLWJYHFACTIBMLYRSNQNSGTNNB9WZBMMU9HPYLOAYATWDD;1000000
    UXIKPLHDHSNTTVTMGP9RNK9CVRHXRNFFZVTPGPHVTZMOTT9TMINEVNZHVMRJEEWCNSZYNNNITFKSSJUOC;1000000
    JUKTBTLFOITZWWLXNYENXLUCZKMAUAFXXRQRHDMNQQWGEWTGKALMXKCZWMPZWBKSVPJPMFQYPYGKEQYFA;1000000
    TQWYFTFBGQSZZQ9AWWCAMYGC9TYNTJXOPAZIPUDSMRKLWCPTPZKGN9NSPKWXSHTATBTPMDHIHCAHIYDL9;1000000
    J9VGDTX9FSRTGSG9SHGEFDNQZUIB99XHJRGRRKBOBFEEBRKTNPANQKYYPXZSAIOMGLKBKVHJTVLPSOQZW;1000000
    PYZYINKAYUXGQUCATBHXUNLPZRNOZHHQZYLGICPNLZAMXGVXTT9JNCYYYTPWQPYLXFIAKULBCCGMPDQEY;1000000
    OAGIAKSKRGLAGOXKODWXKZDADMGRLEREY9HFZGPYZGASUMGNTUKDXEIHDILOKOKQOAIQGKIURJWYY9BRW;1000000
    ICYTYTEZRPNLUMZYGHBDBWPEXVENFZHHMOK99MTMOHDIDUIKUSZISFNMMKGMHJSWWLYTYCJCMSEAUYUNA;1000000
    SXBMMSEZJTZEVN9XPODNKMQAOTUEXOOTIEINMMFQABLDUTXUZTXJVVHEYGIWTBBFCVXNNJQJTLRWVYAHC;1000000
    BWRZYUPYRDOZDGRVINNEUTRFSTQN9MWTDDYASLEXI9IAH9BTFDCFAMFVCAMTEROJHTRTMDMSMH9XHNSYX;1000000

Vamos escolher a SEED:

    QXMWVWPOEOBDCBZYMDXUBI9NKZOGQYCBSUAOLWJYHFACTIBMLYRSNQNSGTNNB9WZBMMU9HPYLOAYATWDD

Abra a carteira:

    $ iota

Configure a conexão no node. `Tools->yyyy->Custom`. Digite: `http://endereco-do-node:14265`. Para logar, digite
a SEED escolhida.

Vai aparecer `Balance = 0`. Vá para `Receive` e clique na opção. Espere um pouco e cheque o Balance novamente.
