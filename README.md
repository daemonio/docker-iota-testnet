# docker-iota-testnet

Dockerized IOTA test-net.

## First steps

Before all, first clone this repository:

    $ git clone https://github.com/daemonio/docker-iota-testnet
    $ cd docker-iota-testnet

## Build & Docker Run
    
    $ docker build -t="docker-iota-testnet" .
    $ docker run --rm -d -p 14265:14265 docker-iota-testnet
    
The build process downloads `iri-1.4.2.1.jar` from *this* repository. This was the version that worked the most for me. You
can download the same version in the main repo.

Wait untill server goes up. You can see if the server is up with the following command:

    $ curl -H "X-IOTA-API-Version: 1.4.1.6" -X POST -d '{"command":"getNodeInfo"}' http://localhost:14265

If you see `"curl: (56) Recv failure: Connection reset by peer"` it's because the server isn't up yet. Give it some time.

If you see some JSON info, congratulations, the server is working:

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

## Wallet Installation

Get your wallet and install it:

    $ wget https://github.com/iotaledger/wallet/releases/download/v2.5.7/iota_2.5.7_amd64.deb
    $ sudo dpkg -i iota_2.5.7_amd64.deb
    
If you get any error, you can try:

    $ sudo apt -f install

## Using the wallet

First get a SEED from the `Snapshot.log` file:
    
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

Let's use this SEED as an example:

    WSHQRZICNFQUQPAPYWKFPWKTWWBPQNMTDNBYSGFZURGBWONDQEBPLNUXJVQTPYNFJKKTFATIVJTBSAWUX

Open the wallet:

    $ iota

Configure the node address in `Tools->Edit Node Configuration->Custom`. Type: `http://your-node-server:14265`. To log into
your wallet just type the chosen SEED.

You're going to see `Balance = 0` after logging in. Go to `Receive` and click in `Attach To Tangle`. Wait, this can take
some time. When you see `"Address Attached"` you can see `Balance` again, it will be 1Mi.
