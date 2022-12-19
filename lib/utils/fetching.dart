import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'dart:convert';

Future<List> getWhrilPoolData() async {
  final client = RetryClient(http.Client());
  try {
    final data = await client.read(Uri.http(
        'api.mainnet.orca.so', '/v1/whirlpool/list', {'whitelisted': 'true'}));
    final poolsData = jsonDecode(data);
    //  print(poolsData['tokens'].runtimeType);
    await new Future.delayed(new Duration(seconds: 3));
    return poolsData['whirlpools'].toList();
  } finally {
    client.close();
  }
}

Future<dynamic> getPoolData() async {
  final client = RetryClient(http.Client());
  try {
    final data = await client
        .read(Uri.http('api.mainnet.orca.so', '/v1/standard-pool/list'));
    final poolsData = jsonDecode(data);
    //  print(poolsData['tokens'].runtimeType);
    await Future.delayed(new Duration(seconds: 3));
    return [poolsData["SOL/USDC"]];
  } finally {
    client.close();
  }
}

Map imageMap = {};

maping() {
  for (int i = 0; i < getTokensData().toList().length; i++) {
    imageMap[getTokensData().toList()[i]['value']] =
        getTokensData().toList()[i]["logoURI"];
  }
  return imageMap;
}

List tokenData() {
  List list = [];
  for (int i = 0; i < getTokensData().toList().length; i++) {
    imageMap[getTokensData().toList()[i]['value']] =
        getTokensData().toList()[i]["logoURI"];
    list.add({
      'label': getTokensData().toList()[i]['label'],
      'value': getTokensData().toList()[i]['value'],
      "color": Colors.blue,
      'icon': SizedBox(
        key: UniqueKey(),
        width: 30,
        height: 30,
        child: getTokensData().toList()[i]["logoURI"] == null
            ? Image.network(
                "",
              )
            : Image.network(
                getTokensData().toList()[i]["logoURI"],
              ),
      ),
      'ID': getTokensData().toList()[i]['coingeckoId']
    });
  }
  return list;
}

List getTokensData() {
  return [
    {
      "mint": "3EkHyexJLGCvSxzn5umbtd9N69GoT4p5pfdLTFqCNP9Y",
      "value": "\$HIPPO",
      "label": "Hippo Coin",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20728/large/iu-n3i1b_400x400.jpg?1637596901",
      "coingeckoId": "hippo-coin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "6j14WyX1Ag2pLWvn99euK4xp2VcZD62VeJv2iwCrYmT8",
      "value": "\$KSH",
      "label": "Keeshond",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/21353/large/lkdYjrVS_400x400.jpg?1638999576",
      "coingeckoId": "keeshond",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "WNZzxM1WqWFH8DpDZSqr6EoHKWXeMx9NLLd2R5RzGPA",
      "value": "\$WNZ",
      "label": "Winerz",
      "decimals": 4,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24786/large/wnz.png?1648905714",
      "coingeckoId": "winerz",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "674PmuiDtgKx3uKuJ1B16f9m5L84eFvNwj3xDMvHcbo7",
      "value": "\$WOOD",
      "label": "Mindfolk Wood",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22512/large/tokenlogo.png?1641966072",
      "coingeckoId": "mindfolk-wood",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "4ThReWAbAVZjNVgs5Ui9Pk3cZ5TYaD9u6Y89fp6EFzoF",
      "value": "1SOL",
      "label": "1sol.io (Wormhole)",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22923/large/1SOL_wh_small.png?1644222565",
      "coingeckoId": "1sol-io-wormhole",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "9wPhuYapychVDSxmXqCZxy2Ka8Lmav4SHM72si8bfraV",
      "value": "1SOL/SOL[aquafarm]",
      "label": "1SOL/SOL[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "6MF5CHWAj5mS7FhpxiKz37CzR2eYTu236XpBKKMXCrGg",
      "value": "1SOL/USDC[aquafarm]",
      "label": "1SOL/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "2zzC22UBgJGCYPdFyo7GDwz7YHq5SozJc1nnBqLU8oZb",
      "value": "1SP",
      "label": "Onespace",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/26474/large/1SP_logo.png?1658195640",
      "coingeckoId": "onespace",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "F3nefJBcejYbtdREjui1T9DPh5dBgpkKq7u2GAAMXs5B",
      "value": "AART",
      "label": "ALL.ART",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22012/large/all-art.PNG?1640590472",
      "coingeckoId": "all-art",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "HCtyJzFUtYecXrA52s4Y9atq4J1fhT3cYsTX17XVSFag",
      "value": "AART/USDC[aquafarm]",
      "label": "AART/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "3vAs4D1WE6Na4tCgt4BApgFfENbm8WY7q4cSPD1yM4Cg",
      "value": "AAVE",
      "label": "Aave (Wormhole)",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22885/large/AAVE_wh_small.png?1644222707",
      "coingeckoId": "aave-wormhole",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "6nuaX3ogrr2CaoAPjtaKHAoBNWok32BMcRozuf32s2QF",
      "value": "ABBUSD",
      "label": "Wrapped BUSD (Allbridge from BSC)",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23061/large/logo_-_2022-01-26T091043.556.png?1643159457",
      "coingeckoId": "wrapped-busd-allbridge-from-bsc",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "EKLq86cHRwc8Spkcx2noPnfoVyQvcWSeud5JMJnTxNAD",
      "value": "ABC",
      "label": "ABC Floor Index",
      "decimals": 2,
      "logoURI":
          "https://assets.coingecko.com/coins/images/27172/large/abc.png?1662287244",
      "coingeckoId": "abc-floor-index",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "JB9sPerGhfdwCDajmd8x4y2gkC4EtXVevoAoPwni39ik",
      "value": "ABP",
      "label": "Asset Backed Protocol",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/21445/large/assset_backld.PNG?1639172738",
      "coingeckoId": "asset-backed-protocol",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "a11bdAAuV8iB2fu7X6AxAvDTo1QZ8FXB3kk5eecdasp",
      "value": "ABR",
      "label": "Allbridge",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/18690/large/abr.png?1640742053",
      "coingeckoId": "allbridge",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "GMzPbaCuQmeMUm1opH3oSCgKUjVgJUW14myq99RVPGX5",
      "value": "ABR/USDC[aquafarm]",
      "label": "ABR/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "2cZv8HrgcWSvC6n1uEiS48cEQGb1d3fiowP2rpa4wBL9",
      "value": "ACF",
      "label": "Alien Chicken Farm",
      "decimals": 2,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25441/large/acf-token_%281%29.png?1651760005",
      "coingeckoId": "alien-chicken-farm",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "ACUMENkbnxQPAsN8XrNA11sY3NmXDNKVCqS82EiDqMYB",
      "value": "ACM",
      "label": "Acumen",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23305/large/eIqc0048_400x400.jpg?1643692035",
      "coingeckoId": "acumen",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "EwxNF8g9UfmsJVcZFTpL9Hx5MCkoQFoJi6XNWzKf1j8e",
      "value": "ACUSD",
      "label": "Wrapped CUSD (Allbridge from Celo)",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23057/large/7236.png?1643153224",
      "coingeckoId": "wrapped-cusd-allbridge-from-celo",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "CbNYA9n3927uXUukee2Hf4tm3xxkffJPPZvGazc2EAH1",
      "value": "AGEUR",
      "label": "agEUR (Wormhole)",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22965/large/agEUR_wh_small.png?1644222746",
      "coingeckoId": "ageur-wormhole",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "4QV4wzDdy7S1EV6y2r9DkmaDsHeoKz6HUvFLVtAsu6dV",
      "value": "AGTE",
      "label": "Agronomist",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/18314/large/logogecko.png?1631515498",
      "coingeckoId": "agronomist",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "E6eCEE3KqjRD5UxcBYQTdV8Z535hyaBuFin9Udm6s6bz",
      "value": "AIR",
      "label": "Balloonsville AIR",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24853/large/9CmgcH6.png?1649134566",
      "coingeckoId": "balloonsville-air",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "ALMmmmbt5KNrPPUBFE4dAKUKSPWTop5s3kUGCdF69gmw",
      "value": "ALM",
      "label": "Almond",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20348/large/logo_-_2021-11-15T102036.111.png?1636942845",
      "coingeckoId": "almond",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "ANAxByE6G2WjFp7A4NqtWYXb3mgruyzZYg3spfxe6Lbo",
      "value": "ANA",
      "label": "Nirvana ANA",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25012/large/ANA_Logo.png?1649822203",
      "coingeckoId": "nirvana-ana",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "51tMb3zBKDiQhNwGqpgwbavaGH54mk8fXFzxTc1xnasg",
      "value": "APEX",
      "label": "ApeXit Finance",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/16864/large/cg.png?1625470996",
      "coingeckoId": "apexit-finance",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "8E5W9PMhnEvdvM2Q9XBLMJW7UsFiieXnRHPj8zhtB23h",
      "value": "APPLE",
      "label": "Apple Fruit",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20116/large/9pfJYwQk_400x400.jpg?1636521578",
      "coingeckoId": "apple-fruit",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "APTtJyaRX5yGTsJU522N4VYWg3vCvSb65eam5GrPT5Rt",
      "value": "APT",
      "label": "Apricot",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20636/large/hF_3FMuH_400x400.jpg?1637399870",
      "coingeckoId": "apricot",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "HNrYngS1eoqkjWro9D3Y5Z9sWBDzPNK2tX4rfV2Up177",
      "value": "APT/USDC[aquafarm]",
      "label": "APT/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "DNhZkUaxHXYvpxZ7LNnHtss8sQgdAfd1ZYS1fB7LKWUZ",
      "value": "APUSDT",
      "label": "Wrapped USDT (Allbridge from Polygon)",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23060/large/logo_-_2022-01-26T084912.902.png?1643158161",
      "coingeckoId": "wrapped-usdt-allbridge-from-polygon",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "5JnZ667P3VcjDinkJFysWh2K2KtViy63FZ3oL5YghEhW",
      "value": "APYS",
      "label": "APYSwap",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/14163/large/apys.png?1635831990",
      "coingeckoId": "apyswap",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "9tzZzEHsKnwFL1A3DyFJwj36KnZj3gZ7g4srWp9YTEoh",
      "value": "ARB",
      "label": "ARB Protocol",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/26046/large/IMG_3600.png?1656916820",
      "coingeckoId": "arb-protocol",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "F4q5mMxk9RA2a9dwfa2FgJjhvuqbk8SC9jEpnDVz5TFy",
      "value": "ARIA",
      "label": "Legends Of Aria",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/27157/large/ARIA_LOGO.png?1662276215",
      "coingeckoId": "legends-of-aria",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "6Dujewcxn1qCd6rcj448SXQL9YYqTcqZCNQdCn3xJAKS",
      "value": "ARTE",
      "label": "ARTE",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23556/large/token_200.png?1644473079",
      "coingeckoId": "arte",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "FY6XDSCubMhpkU9FAsUjB7jmN8YHYZGezHTWo9RHBSyX",
      "value": "ASH",
      "label": "Ashera",
      "decimals": 4,
      "logoURI":
          "https://assets.coingecko.com/coins/images/18508/large/ashera.png?1635150588",
      "coingeckoId": "ashera",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "AMp8Jo18ZjK2tuQGfjKAkkWnVP4NWX5sav4NJH6pXF2D",
      "value": "ASTRA",
      "label": "AstraPad",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20028/large/WzDPqfV.png?1636418940",
      "coingeckoId": "astrapad",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "GXnw9YSt6DANCt84Ti6ZpbaXvrvuEJFCYqrDjygnq4R8",
      "value": "ATC",
      "label": "ArtiCoin",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25232/large/LOGO-256.png?1650953344",
      "coingeckoId": "articoin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "ATLASXmbPQxBUYbxPsV97usA3fPQYEqzQBUHgiFCUsXx",
      "value": "ATLAS",
      "label": "Star Atlas",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/17659/large/Icon_Reverse.png?1628759092",
      "coingeckoId": "star-atlas",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "FZ8x1LCRSPDeHBDoAc3Gc6Y7ETCynuHEr5q5YWV7uRCJ",
      "value": "ATLAS/USDC[aquafarm]",
      "label": "ATLAS/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "CWBzupvyXN1Cf5rsBEHbzfTFvreLfUaJ77BMNLVJ739y",
      "value": "ATPAY",
      "label": "AtPay",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/27254/large/atpay.png?1663049746",
      "coingeckoId": "atpay",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "HJbNXx2YMRxgfUJ6K4qeWtjatMK5KYQT1QnsCdDWywNv",
      "value": "ATS",
      "label": "Atlas DEX",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23002/large/logo.png?1643091340",
      "coingeckoId": "atlas-dex",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "9LzCMqDgTKYz9Drzqnpgee3SGa89up3a247ypMj2xrqM",
      "value": "AUDIO",
      "label": "Audius (Wormhole)",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22936/large/AUDIO_wh_small.png?1644224294",
      "coingeckoId": "audius-wormhole",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "3hksYA17VxgiKSeihjnZkBbjc2CTbEBfvDCYgQhojTo5",
      "value": "AUDIO/USDC[aquafarm]",
      "label": "AUDIO/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "AURYydfxJib1ZkTir1Jn1J9ECYUtjb6rKQVmtYaixWPP",
      "value": "AURY",
      "label": "Aurory",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/19324/large/logo.png?1635076945",
      "coingeckoId": "aurory",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "6mJqqT5TMgveDvxzBt3hrjGkPV5VAj7tacxFCT3GebXh",
      "value": "AURY/USDC[aquafarm]",
      "label": "AURY/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "7JnHPPJBBKSTJ7iEmsiGSBcPJgbcKw28uCRXtQgimncp",
      "value": "AVAX",
      "label": "Avalanche",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/12559/large/coin-round-red.png?1604021818",
      "coingeckoId": "avalanche-2",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "AUrMpCDYYcPuHhyNX8gEEqbmDPFUpBpHrNW3vPeCFn5Z",
      "value": "AVAX",
      "label": "AVAX (Allbridge from Avalanche)",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/12559/small/coin-round-red.png",
      "coingeckoId": "avalanche-2",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "Hmfrtmo93DpSDmVNLQKcBS5D1ia5JatiRSok9ososubz",
      "value": "AVAX/USDC[aquafarm]",
      "label": "AVAX/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "EE5L8cMU4itTsCSuor7NLK6RZx6JhsBe8GGV3oaAHm3P",
      "value": "AVDO",
      "label": "AvocadoCoin",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23675/large/PNLL1B2g_400x400.jpg?1644996225",
      "coingeckoId": "avocadocoin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "HysWcbHiYY9888pHbaqhwLYZQeZrcQMXKQWRqS7zcPK5",
      "value": "AXSET",
      "label": "Axie Infinity Shard (Wormhole)",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22952/large/AXSet_wh_small.png?1644224450",
      "coingeckoId": "axie-infinity-shard-wormhole",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "2Dzzc14S1D7cEFGJyMZMACuoQRHVUYFhVE74C5o8Fwau",
      "value": "BAB",
      "label": "Banana Bucks",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20592/large/_BAB_coinmedium.png?1637285029",
      "coingeckoId": "banana-bucks",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "Uuc6hiKT9Y6ASoqs2phonGGw2LAtecfJu9yEohppzWH",
      "value": "BABY",
      "label": "Baby Samo Coin",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20262/large/386VuTho_400x400.jpg?1636704021",
      "coingeckoId": "baby-samo-coin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "8JjBJdV73zPPmZvkgC91ni8RsbXWTkhpuSdxeZgaw6hD",
      "value": "BABYTIGER",
      "label": "BabyTigerGold",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22811/large/logo_babytiger.png?1642658264",
      "coingeckoId": "babytigergold",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "3e9pHUxa2nvAqso2Kr2KqJxYvZaz9qZLjoLaG77uQwB1",
      "value": "BAIL",
      "label": "SolPatrol Bail",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25787/large/hammer.png?1653882632",
      "coingeckoId": "solpatrol-bail",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "BhPXDQio8xtNC6k5Bg5fnUVL9kGN8uvRDNwW8MZBu8DL",
      "value": "BANA",
      "label": "Shibana",
      "decimals": 4,
      "logoURI":
          "https://assets.coingecko.com/coins/images/21234/large/solshib.png?1638758546",
      "coingeckoId": "shibana",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "BgeRyFWWGHeVouqfHfcXUxmvfkgekhrXYVqQWf63kpJB",
      "value": "BAPE",
      "label": "Bored Ape Social Club",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23734/large/DY4jjsMH_400x400.jpg?1645173802",
      "coingeckoId": "bored-ape-social-club",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "Basis9oJw9j8cw53oMV7iqsgo6ihi9ALw4QR31rcjUJa",
      "value": "BASIS",
      "label": "basis.markets",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/21444/large/tkQevyc.png?1653297101",
      "coingeckoId": "basis-markets",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "GoaAiajubRgeCFEz9L6mLnSmT2QFegoJDH5tpLfivpj",
      "value": "BASIS/USDC[aquafarm]",
      "label": "BASIS/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "GRsoqmhsS7fCLpEqqE7oRM92ag3WVy8VbJAi6KfWSeHS",
      "value": "BBI",
      "label": "Bridgesplit Brand Index",
      "decimals": 2,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25640/large/a.png?1652942415",
      "coingeckoId": "bridgesplit-brand-index",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "5SZSVgnQDgKKxtCe3UA3x4T7tcSRNDaL3NmfdEqpuLzo",
      "value": "BBY",
      "label": "BabylonDAO",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22277/large/1_RfsjMarB6Ty7iBYZAJfPHg_2x.jpeg?1641363450",
      "coingeckoId": "babylondao",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "H5gczCNbrtso6BqGKihF97RaWaxpUEZnFuFUKK4YX3s2",
      "value": "BDE",
      "label": "Big Defi Energy",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/17903/large/bde.png?1636333319",
      "coingeckoId": "big-defi-energy",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "2mTCc7PKM5Sm999ogLUzbxyaKbwrMsGofSZNSk1XdE1h",
      "value": "BDTX",
      "label": "Block Duelers",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/13757/large/block_duelers.png?1611567700",
      "coingeckoId": "block-duelers",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "At7RLMbA6ZUjj7riyvFq2j5NHQ19aJabCju2VxLDAqso",
      "value": "BGS",
      "label": "Battle of Guardians Share",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22285/large/K3hU77wS_400x400.jpg?1641365642",
      "coingeckoId": "battle-of-guardians-share",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "FoqP7aTaibT5npFKYKQQdyonL99vkW8YALNPwWepdvf5",
      "value": "BIP",
      "label": "The Starship Finance",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/21587/large/logo_-_2021-12-15T120333.709.png?1639541030",
      "coingeckoId": "the-starship-finance",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "FTPnEQ3NfRRZ9tvmpDW6JFrvweBE5sanxnXSpJL1dvbB",
      "value": "BIRD",
      "label": "Bird.Money",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/13260/large/favicon-180x180.png?1611546646",
      "coingeckoId": "bird-money",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "EGiWZhNk3vUNJr35MbL2tY5YD6D81VVZghR2LgEFyXZh",
      "value": "BIT",
      "label": "Bitmon",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25282/large/BT-logo.png?1651127844",
      "coingeckoId": "bitmon",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "NFTUkR4u7wKxy9QLaX2TGvd9oZSWoMo4jqSJqdMb7Nk",
      "value": "BLOCK",
      "label": "Blockasset",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/21332/large/Blockasset-Logo-value.png?1648442722",
      "coingeckoId": "blockasset",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "D8WjqtwC9CzBrQKfSf2ccCHFQuPYwyLv5KAy8WjT5vnf",
      "value": "BLOCK/USDC[aquafarm]",
      "label": "BLOCK/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "BLT1noyNr3GttckEVrtcfC6oyK6yV1DpPgSyXbncMwef",
      "value": "BLT",
      "label": "Blocto",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/18657/large/BLT_token.png?1633082645",
      "coingeckoId": "blocto-token",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "5sM9xxcBTM9rWza6nEgq2cShA87JjTBx1Cu82LjgmaEg",
      "value": "BMBO",
      "label": "Bamboo Coin",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/19620/large/FC0hnduacAAHYFC.png?1635496724",
      "coingeckoId": "bamboo-coin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "9gP2kCy3wA1ctvYWQk75guqXuHfrEomqydHLtcTCqiLa",
      "value": "BNB",
      "label": "Binance Coin (Wormhole)",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22884/large/BNB_wh_small.png?1644224553",
      "coingeckoId": "binance-coin-wormhole",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "BNTY5DaMP9CZhEtmQfMLHfUwwkXropHuCz4m96YqpqKm",
      "value": "BNTY",
      "label": "Bounty",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24975/large/bnty.png?1649652061",
      "coingeckoId": "bounty",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "45wdSjpSqZCk9mkqmq5Nh7beCEqqUJMJcVduwYCip5eq",
      "value": "BOFB",
      "label": "bofb",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24866/large/2qsZgpxd_400x400.jpg?1649166378",
      "coingeckoId": "bofb",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "CN7qFa5iYkHz99PTctvT4xXUHnxwjQ5MHxCuTJtPN5uS",
      "value": "BOKU",
      "label": "Boryoku Dragonz",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20820/large/ZdgsxFPV_400x400.png?1637721291",
      "coingeckoId": "boku",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "7uv3ZvZcQLd95bUp5WMioxG7tyAZVXFfr8JYkwhMYrnt",
      "value": "BOLE",
      "label": "Boleld",
      "decimals": 4,
      "logoURI":
          "https://assets.coingecko.com/coins/images/16317/large/Bole.png?1623736184",
      "coingeckoId": "bole-token",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "D3eyBjfgJMPHZyYDRtbf1cSxeLiNwKumwHzQK3h3TRRq",
      "value": "BONE",
      "label": "Bulldog Billionaires",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24560/large/MIBYsiqF_400x400.jpg?1648195687",
      "coingeckoId": "bulldog-billionaires",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "bonegFPgrpZ4bfVn3kQK1aMbGYddWtfMAywNt5LsuVE",
      "value": "BONES",
      "label": "Soul Dogs City Bones",
      "decimals": 2,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25025/large/JEepabYB_400x400.png?1649838257",
      "coingeckoId": "soul-dog-city-bones",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "BLwTnYKqf7u4qjgZrrsKeNs2EzWkMLqVCu6j8iHyrNA3",
      "value": "BOP",
      "label": "Boring Protocol",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/16828/large/imgonline-com-ua-resize-VT59gqn-Bya-WGG.jpg?1625210880",
      "coingeckoId": "boring-protocol",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "2gXDJZ7XAtQEtf4PRSQZKoq1WMuu1H44tQanbMA3YVpu",
      "value": "BOP/USDC[aquafarm]",
      "label": "BOP/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "CFbdjaKonbBQTYG2GC6CmB7exofgDYGCDR8tp8KVGS7T",
      "value": "BORG",
      "label": "Cyborg Apes",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23020/large/lgo-head-export.png?1643094853",
      "coingeckoId": "cyborg-apes",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "2LxZrcJJhzcAju1FBHuGvw929EVkX7R7Q8yA2cdp8q7b",
      "value": "BORK",
      "label": "Bork",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/19951/large/VtJL5kdepu6AyVHnHi4GImgyWxmcb2XMPN7jURW_yXQ.png?1636338300",
      "coingeckoId": "bork",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "AkhdZGVbJXPuQZ53u2LrimCjkRP6ZyxG1SoM85T98eE1",
      "value": "BOT",
      "label": "Starbots",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/21823/large/coin_%286%29.png?1640076014",
      "coingeckoId": "starbots",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "DysbQiM8nPdZbBhvHM1EgcSE73EwtFWDanXwY8CDD3Jn",
      "value": "BOX",
      "label": "Solootbox DAO",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22660/large/qggoHE1__400x400.jpg?1642401842",
      "coingeckoId": "solootbox-dao",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "Boxch1343xWQWbahVBPhYHuYLXNHnWYHG6QbuqfNugQ1",
      "value": "BOXCH",
      "label": "Boxch",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/26119/large/logo.png?1655949751",
      "coingeckoId": "boxch",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "FtgGSFADXBtroxq8VCausXRr2of47QBf5AS1NtZCu4GD",
      "value": "BRZ",
      "label": "Brazilian Digital",
      "decimals": 4,
      "logoURI":
          "https://assets.coingecko.com/coins/images/8472/large/2_vtiD3xwce9knG2COxtSMaQ.png?1597786961",
      "coingeckoId": "brz",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "2XSuy8RSESbtYRBbVHxGWuoikn3B6iXKVKzN4i3owTCf",
      "value": "BSAMO",
      "label": "Buff Samo",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20597/large/logo_-_2021-11-19T094813.378.png?1637286506",
      "coingeckoId": "buff-samo",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "bSo13r4TkiE4KumL71LsHTPpL2euBYLFx6h9HP3piy1",
      "value": "BSOL",
      "label": "BlazeStake Staked SOL",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/26636/large/blazesolana.png?1659328728",
      "coingeckoId": "blazestake-staked-sol",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "EYDEQW4xQzLqHcFwHTgGvpdjsa5EFn74KzuqLX5emjD2",
      "value": "BST",
      "label": "Balisari",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/19852/large/balisari-1.jpg?1636061685",
      "coingeckoId": "balisari",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "9n4nbM75f5Ui33ZbPYXn59EwSgE8CGsHtAeTH5YFeJ9E",
      "value": "BTC",
      "label": "Wrapped Bitcoin (Sollet)",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24917/large/opengraph.png?1649344256",
      "coingeckoId": "wrapped-bitcoin-sollet",
      "whitelisted": true,
      "poolToken": false,
      "wrapper": "SRM"
    },
    {
      "mint": "8pFwdcuXM7pvHdEGHLZbUR8nNsjj133iUXWG6CgdRHk2",
      "value": "BTC/ETH",
      "label": "BTC/ETH",
      "decimals": 9,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "DFpLFcQZqDKykyDePgip4r6MExVmBKWqTa12ezq6qxUY",
      "value": "BTC/ORCA[aquafarm]",
      "label": "BTC/ORCA[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "Acxs19v6eUMTEfdvkvWkRB4bwFCHm3XV9jABCy7c1mXe",
      "value": "BTC/SOL[aquafarm]",
      "label": "BTC/SOL[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "J3kvcay3N16FBdawgnqoJ9v9p6XCvyCLE2Z9F5RLvGkj",
      "value": "BTC/USDC[aquafarm]",
      "label": "BTC/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "8nKJ4z9FSw6wrVZKASqBiS9DS1CiNsRnqwCCKVQjqdkB",
      "value": "BTC/mSOL[aquafarm]",
      "label": "BTC/mSOL[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "HYp9v7cY4wAxSsa6ijztQQ3GQ8iTttuG5vu8JNBDHoNh",
      "value": "BTC/stSOL[aquafarm]",
      "label": "BTC/stSOL[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "BUD1144GGYwmMRFs4Whjfkom5UHqC9a8dZHPVvR2vfPx",
      "value": "BUD",
      "label": "BunnyDucky",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25934/large/bdlogo.png?1654758682",
      "coingeckoId": "bunnyducky",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "Qikhhhg9Ta3Jg7WoDFbSYuCAE14hx9hPvdz1zVp3zUw",
      "value": "BURD",
      "label": "tudaBirds",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22839/large/_TOvRxfx_400x400.jpg?1642745695",
      "coingeckoId": "tudabirds",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "XwTZraiF1dVh69cZ2SpqyjDLmei2uVps5CYHD9vqK6d",
      "value": "BURR",
      "label": "Burrito Boyz Floor Index",
      "decimals": 2,
      "logoURI":
          "https://assets.coingecko.com/coins/images/27169/large/7ryKn0fdux0PnpBEiwmop9DaFq2KG8WHmGhhtOYPoAU.png?1662286753",
      "coingeckoId": "burrito-boyz-floor-index",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "5RpUwQ8wtdPCZHhu6MERp2RGrpobsbZ6MH5dDHkUjs2",
      "value": "BUSD",
      "label": "BUSD Token (Portal from BSC)",
      "decimals": 8,
      "logoURI":
          "https://raw.githubusercontent.com/solana-labs/token-list/main/assets/mainnet/5RpUwQ8wtdPCZHhu6MERp2RGrpobsbZ6MH5dDHkUjs2/logo.png",
      "coingeckoId": "binance-usd",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "pH5wWJc3KhdeVQSt86DU31pdcL9c8P88x2FQoKEJVHC",
      "value": "BXS",
      "label": "Bancambios AX",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25644/large/81660481.png?1652949329",
      "coingeckoId": "bancambios-ax",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "C98A4nkJXhpVZNAZdHUA95RpTF3T4whtQubL3YobiUX9",
      "value": "C98",
      "label": "Coin98",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/17117/large/logo.png?1626412904",
      "coingeckoId": "coin98",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "E1s2muWwiLT2n3EQUL27hgviaPRRXWkpXD7ShpfgRvVz",
      "value": "CAC",
      "label": "Cosmic Ape Coin",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22570/large/Cosmic-Ape-Logosc.png?1643186237",
      "coingeckoId": "cosmic-ape-coin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "CAPYD6Lrm7bTZ6C7t7JvSxvpEcfKQ9YNB7kUjh6p6XBN",
      "value": "CAPY",
      "label": "Capybara",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22000/large/logo_-_2021-12-27T143844.581.png?1640587159",
      "coingeckoId": "capybara",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "CASHVDm2wsJXfhj6VWxb7GiMdoLc17Du7paH4bNr5woT",
      "value": "CASH",
      "label": "Cashio Dollar",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23059/large/CCdmyCvx_400x400.jpg?1643157979",
      "coingeckoId": "cashio-dollar",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "5p2zjqCd1WJzAVgcEnjhb9zWDU7b9XVhFhx4usiyN7jB",
      "value": "CATO",
      "label": "CATO",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/17031/large/CATO200newlogo.png?1648448136",
      "coingeckoId": "cato",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "55r9txzQtmjTykmTXmBYZCVMg5z9squB8b5cSw2AhxA4",
      "value": "CATO/USDC[aquafarm]",
      "label": "CATO/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "4SZjjNABoqhbd4hnapbvoEPEqT8mnNkfbEoAwALf1V8t",
      "value": "CAVE",
      "label": "CaveWorld",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/19358/large/token.png?1650866628",
      "coingeckoId": "cave",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "GNCjk3FmPPgZTkbQRSxr6nCvLtYMbXKMnRxg8BgJs62e",
      "value": "CELO",
      "label": "CELO (Allbridge from Celo)",
      "decimals": 9,
      "logoURI":
          "https://raw.githubusercontent.com/solana-labs/token-list/main/assets/mainnet/GNCjk3FmPPgZTkbQRSxr6nCvLtYMbXKMnRxg8BgJs62e/logo.png",
      "coingeckoId": "celo",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "HVLyX8mD8YvKgZJ4oB6rXJiCYMLpHKwB6iCiCjE1XwdT",
      "value": "CELO/USDC[aquafarm]",
      "label": "CELO/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "YtfMZ4jg2ubdz4GasY86iuGjHdo5rCPJnFqgSf8gxAz",
      "value": "CHB",
      "label": "Charactbit",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24863/large/200x_logo.png?1649165917",
      "coingeckoId": "charactbit",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "3FoUAsGDbvTD6YZ4wVKJgTB76onJUKz7GPEBNiR5b8wc",
      "value": "CHEEMS",
      "label": "Cheems",
      "decimals": 4,
      "logoURI":
          "https://assets.coingecko.com/coins/images/18358/large/newlogo.png?1644476666",
      "coingeckoId": "cheems",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "cxxShYRVcepDudXhe7U62QHvw8uBJoKFifmzggGKVC2",
      "value": "CHICKS",
      "label": "SolChicks",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20978/large/chicks.png?1638162821",
      "coingeckoId": "solchicks-token",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "71CBZeJ4tw38L9pSPoCz4fRsuWE64Fipyzotte7haoCS",
      "value": "CHICKS/USDC[aquafarm]",
      "label": "CHICKS/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "6xtyNYX6Rf4Kp3629X11m1jqUmkV89mf9xQakUtUQfHq",
      "value": "CHIH",
      "label": "ChihuahuaSol",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20528/large/rsz_chihuahua-token.png?1637200907",
      "coingeckoId": "chihuahuasol",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "CbDwU8JrTYv3GzU7msni8qtfFkAGpcyFAzuhuGq5SVqp",
      "value": "CHUG",
      "label": "CHUG",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22474/large/chug.png?1641885210",
      "coingeckoId": "chug-token",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "8s9FCz99Wcr3dHpiauFRi6bLXzshXfcGTfgQE7UEopVx",
      "value": "CKC",
      "label": "ChikinCoin",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24978/large/Screenshot_from_2022-04-11_15-47-44.png?1649663281",
      "coingeckoId": "chikincoin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "3aAYh35n81F8HPG2QBdE48aYdzGFj2fsLccg91X4AcRc",
      "value": "CLASH",
      "label": "Clash Of Cars",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23307/large/logo_%286%29.png?1643697035",
      "coingeckoId": "clash-of-cars",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "CLAsHPfTPpsXmzZzdexdEuKeRzZrWjZFRHQEPu2kSgWM",
      "value": "CLH",
      "label": "Clash",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "5Wsd311hY8NXQhkt9cWHwTnqafk7BGEbLu8Py3DSnPAr",
      "value": "CMFI",
      "label": "Compendium.Fi",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22269/large/ckxanb97x357108l6qrnrjxtr.png?1641340080",
      "coingeckoId": "compendium-fi",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "85krvT9DxdYgoFLQDHTAGdvtNuLdAsc4xE5FkVLpN2aR",
      "value": "CMFI/USDC[aquafarm]",
      "label": "CMFI/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "7udMmYXh6cuWVY6qQVCd9b429wDVn2J71r5BdxHkQADY",
      "value": "COBAN",
      "label": "COBAN",
      "decimals": 3,
      "logoURI":
          "https://assets.coingecko.com/coins/images/19483/large/coban-logo-pebyyxjzxvebwa8nsvpp9t8iple69h6enp9bdknotq.png?1635285761",
      "coingeckoId": "coban",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "yvbrxE6zjrA8SxxSpL7oojDBB5QDmF5CVqJWea8JcQE",
      "value": "CODI",
      "label": "Codi Finance",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22798/large/ovFr4h_Y_n8q_1RIgfg5IFCRtx56Uc0R-GC9LiIcy1HOgigf0mYH2kWVFuvBipErCvpnrp0yps4Y3XTis-boKJg_2_ucFmv3Iu0CaSyCXThFihx-yrr9vo7t0HEL5optQ6jKAXpSLtXvKZPHrmMgMM2VFB2D4UCPxGsCItv6kvSix3LsjLcrKmTAvmHLvCby1om1BvKJLFcXP0.jpg?1642582521",
      "coingeckoId": "codi-finance",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "EzL6LLmv4vgfF7irkjG7ZxM92bTJ9f6nFopDXJTow7zj",
      "value": "CONDOMS",
      "label": "SolCondoms",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/21814/large/DboqD2_o_400x400.jpg?1640071580",
      "coingeckoId": "solcondoms",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "8HGyAAB1yoM1ttS7pXjHMa3dukTFGQggnFFH3hJZgzQh",
      "value": "COPE",
      "label": "Cope",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/14567/large/COPE.png?1617162230",
      "coingeckoId": "cope",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "2697FyJ4vD9zwAVPr33fdVPDv54pyZZiBv9S2AoKMyQf",
      "value": "COPE/SOL",
      "label": "COPE/SOL",
      "decimals": 9,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "CzieDbGRdN1QGaGDNpSqzEA18bi881ccvkkGZi51pe1k",
      "value": "COPE/SOL[aquafarm]",
      "label": "COPE/SOL[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "HsauTv9s52Zv12eaDuSp6y7BEm4e4BHEyAsbdjyyWzPK",
      "value": "COPE/USDC[aquafarm]",
      "label": "COPE/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "CowKesoLUaHSbAMaUxJUj7eodHHsaLsS65cy8NFyRDGP",
      "value": "COW",
      "label": "CashCow",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/19388/large/cash_cow.png?1648265503",
      "coingeckoId": "cashcow",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "z9WZXekbCtwoxyfAwEJn1euXybvqLzPVv3NDzJzkq7C",
      "value": "CRC",
      "label": "Care Coin",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/18836/large/nyZmFyL1_400x400.jpg?1633570319",
      "coingeckoId": "care-coin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "CREAMpdDimXxj2zTCwP5wMEtba4NYaKCrTBEQTSKtqHe",
      "value": "CREAMY",
      "label": "Creamy",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25285/large/logo200.png?1651128831",
      "coingeckoId": "creamy",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "DubwWZNWiNGMMeeQHPnMATNj77YZPZSAz2WVR5WjLJqz",
      "value": "CRP",
      "label": "CropperFinance",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/17883/large/copperfinance.PNG?1629708744",
      "coingeckoId": "cropperfinance",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "CRWNYkqdgvhGGae9CKfNka58j6QQkaD5bLhKXvUYqnc1",
      "value": "CRWNY",
      "label": "Crowny",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/14958/large/crowny-icon-rounded_2x.png?1619147225",
      "coingeckoId": "crowny-token",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "56tNQ29XBrbovm5K5SThuQatjCy92w2wKUaUeQ8WCD9g",
      "value": "CRYY",
      "label": "Cry Cat Coin",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22128/large/cry_logo_200_200.png?1640870275",
      "coingeckoId": "cry-coin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "EzfnjRUKtc5vweE1GCLdHV4MkDQ3ebSpQXLobSKgQ9RB",
      "value": "CSM",
      "label": "Cricket Star Manager",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25774/large/CSM_token.png?1653631158",
      "coingeckoId": "cricket-star-manager",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "G7uYedVqFy97mzjygebnmmaMUVxWHFhNZotY6Zzsprvf",
      "value": "CSTR",
      "label": "CoreStarter",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20209/large/cstr.png?1636642782",
      "coingeckoId": "corestarter",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "9ET2QCQJdFkeKkuaampNbmicbA8eLYauFCWch9Ddh9p5",
      "value": "CTI",
      "label": "ClinTex CTi",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/13266/large/CTI.png?1606817542",
      "coingeckoId": "clintex-cti",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "CUSDvqAQLbt7fRofcmV2EXfPA2t36kzj7FjzdmqDiNQL",
      "value": "CUSD",
      "label": "Coin98 Dollar",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/26588/large/CUSD-01.png?1658909049",
      "coingeckoId": "coin98-dollar",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "HfYFjMKNZygfMC8LsQ8LtpPsPxEJoXJx4M6tqi75Hajo",
      "value": "CWAR",
      "label": "Cryowar",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20227/large/CWAR_round_200_200.png?1636689418",
      "coingeckoId": "cryowar-token",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "BRLsMczKuaR5w9vSubF4j8HwEGGprVAyyVgS4EX7DKEg",
      "value": "CYS",
      "label": "Cykura",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/18139/large/cyclos-text-logo.png?1630651169",
      "coingeckoId": "cyclos",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "32CHtMAuGaCAZx8Rgp54jSFG3ihbpN5brSvRAWpwEHPv",
      "value": "DAB",
      "label": "DAB Coin",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25275/large/basc-coin.png?1651123747",
      "coingeckoId": "dab-coin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "EjmyN6qEC1Tf1JxiG1ae7UTJhUxSwk1TCWNWqxWV4J6o",
      "value": "DAI",
      "label": "Dai Stablecoin (Portal)",
      "decimals": 8,
      "logoURI":
          "https://raw.githubusercontent.com/solana-labs/token-list/main/assets/mainnet/EjmyN6qEC1Tf1JxiG1ae7UTJhUxSwk1TCWNWqxWV4J6o/logo.png",
      "coingeckoId": "dai",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "r8nuuzXCchjtqsmQZVZDPXXq928tuk7KVH479GsKVpy",
      "value": "DAOJONES",
      "label": "Fractionalized SMB-2367",
      "decimals": 2,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22611/large/daojones.png?1642228974",
      "coingeckoId": "fractionalized-smb-2367",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "6AarZpv8KwmPBxBEZdRmd3g1q2tUBaSgTNQ5e621qcZQ",
      "value": "DAPE",
      "label": "Degenerate Ape Academy Floor Index",
      "decimals": 2,
      "logoURI":
          "https://assets.coingecko.com/coins/images/27054/large/dape.png?1661508642",
      "coingeckoId": "degenerate-ape-academy-floor-index",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "CpFE715P5DnDoJj9FbCRcuyHHeTXNdRnvzNkHvq1o23U",
      "value": "DARC",
      "label": "Konstellation",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/2943/large/darctoken.png?1645230834",
      "coingeckoId": "darcmatter-coin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "Ce3PSQfkxT5ua4r2JqCoWYrMwKWC5hEzwsrT9Hb7mAz9",
      "value": "DATE",
      "label": "SolDate",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/18461/large/date.PNG?1632108952",
      "coingeckoId": "soldate-token",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "3DHPqxdMXogNNnpqBMF8N4Zs4dn1WR31H7UjWq6FExwG",
      "value": "DAWG",
      "label": "DAWG",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20881/large/143299698-37b637ea-7fce-4bd6-8713-71c42e37629e.png?1637820203",
      "coingeckoId": "dawg",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "3fXCWpQaEHEsnHSYAqcxm3QLPGLxYiZzoJbqRY9wWxV2",
      "value": "DCCT",
      "label": "DocuChain",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24763/large/zf3Q-GS4_400x400.jpg?1648814553",
      "coingeckoId": "docuchain",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "A9UhP1xfQHWUhSd54NgKPub2XB3ZuQMdPEvf9aMTHxGT",
      "value": "DEGN",
      "label": "Degen",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20103/large/degendex.png?1636512003",
      "coingeckoId": "degen",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "de1QJkP1qDCk5JYCCXCeq27bQQUdCaiv7xVKFrhPSzF",
      "value": "DELFI",
      "label": "DeltaFi",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24085/large/logo.png?1646293860",
      "coingeckoId": "deltafi",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "BgwQjVNMWvt2d8CN51CsbniwRWyZ9H9HfHkEsvikeVuZ",
      "value": "DEP",
      "label": "DEAPCOIN",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/10970/large/DEAPcoin_01.png?1586741677",
      "coingeckoId": "deapcoin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "DFL1zNkaGPWm1BqAVqRjCZvHmwTFrEaJtbzJWgseoNJh",
      "value": "DFL",
      "label": "DeFi Land",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/18910/large/defilend.png?1637190571",
      "coingeckoId": "defi-land",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "9Y1vPaAsMz8X65DebMMnmBjbMo8i4jh4mcgiggZUUS3M",
      "value": "DFL/SOL[aquafarm]",
      "label": "DFL/SOL[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "AWrtTWG4Zgxw8D92bb3L3sQtGLD3zDztMPWsXSph8iBP",
      "value": "DFL/USDC[aquafarm]",
      "label": "DFL/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "AAXng5czWLNtTXHdWEn9Ef7kXMXEaraHj2JQKo7ZoLux",
      "value": "DGE",
      "label": "DarleyGo Essence",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24403/large/DGE.png?1647530006",
      "coingeckoId": "darleygo-essence",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "E6UU5M1z4CvSAAF99d9wRoXsasWMEXsvHrz3JQRXtm2X",
      "value": "DGLN",
      "label": "Dogelana",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/21133/large/logo_%285%29.png?1642042028",
      "coingeckoId": "dogelana",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "2Giihhh4rD5QMF49EExf5k8qbxftaqRWzLi4tS6YcrvR",
      "value": "DGOLD",
      "label": "Degen Gold",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/26616/large/DegenGold_%28DGOLD%29.png?1659073125",
      "coingeckoId": "degen-gold",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "6Y7LbYB3tfGBG6CSkyssoxdtHb77AEMTRVXe8JUJRwZ7",
      "value": "DINO",
      "label": "Dino",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/17770/large/solana_dino.png?1629207162",
      "coingeckoId": "dino",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "2TxM6S3ZozrBHZGHEPh9CtM74a9SVXbr7NQ7UxkRvQij",
      "value": "DINOEGG",
      "label": "DINOEGG",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22291/large/xOcKL1Fw_400x400.png?1641367958",
      "coingeckoId": "dinoegg",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "BiDB55p4G3n1fGhwKFpxsokBMqgctL4qnZpDH1bVQxMD",
      "value": "DIO",
      "label": "Decimated",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/8271/large/dio_logo_coloured_transparent.png?1640744585",
      "coingeckoId": "decimated",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "GnzxEyULVPQYb5F5hxGc8dEGivctVrfr5mtsdp4z5xU2",
      "value": "DJN",
      "label": "Fenix Danjon",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/21134/large/logo.png?1638361975",
      "coingeckoId": "fenix-danjon",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "HtbhBYdcfXbbD2JiH6jtsTt2m2FXjn7h4k6iXfz98k5W",
      "value": "DKM",
      "label": "Dead Knight",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24442/large/SAq1GaQc_400x400.jpg?1647673953",
      "coingeckoId": "dead-knight",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "5LSFpvLDkcdV2a3Kiyzmg5YmJsj2XDLySaXvnfP1cgLT",
      "value": "DOGO",
      "label": "DogemonGo",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/17480/large/dogemongo.PNG?1627950869",
      "coingeckoId": "dogemon-go",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "GyUYoBT1gcZBEVffWeGKQ3E2gzfNP5b8GEvnqAGjL6Hs",
      "value": "DPAY",
      "label": "PayDex",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/26530/large/paydexlogo.png?1658666536",
      "coingeckoId": "paydex",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "McpgFn2CxFYFq6JLiBxeC6viNfebLsfsf9Sv5wcwKvL",
      "value": "DPUNKZ",
      "label": "Duck Punkz Universe Floor Index",
      "decimals": 2,
      "logoURI":
          "https://assets.coingecko.com/coins/images/27171/large/2588.png?1662287086",
      "coingeckoId": "duck-punkz-universe-floor-index",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "6jAHVBYY2B4dU6hGxXpCqFwHdjDL6aiLtTvJKn8fWRo1",
      "value": "DRA",
      "label": "Drachma Exchange",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/26768/large/Drachma_Exchange_%281%29.png?1660038908",
      "coingeckoId": "drachma-exchange",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "48AEwauAHsJibyt3WqjQ6EoHnFBcnyHASfo7vB2eCXPS",
      "value": "DRAW",
      "label": "Dragon War",
      "decimals": 0,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23100/large/logo_%284%29.png?1643184693",
      "coingeckoId": "dragon-war",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "CzXF8oUJSsB9ADKV99WAi2TgytqAyKvQw6EihwiL9em4",
      "value": "DRGNZ",
      "label": "Boryoku Genesis Dragonz Index",
      "decimals": 2,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24386/large/AzJI7FQ.png?1647501836",
      "coingeckoId": "boryoku-genesis-dragonz-index",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "DogscQVvNVj7ndEnhWiCXPVPKKwNy9fJd4ATF7mVi5J",
      "value": "DSC",
      "label": "DoggyStyle Coin",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/20831/large/logo_-_2021-11-24T132426.774.png?1637731476",
      "coingeckoId": "doggystyle-coin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "5y1YcGVPFy8bEiCJi79kegF9igahmvDe5UrqswFvnpMJ",
      "value": "DSOL",
      "label": "DecentSol",
      "decimals": 4,
      "logoURI":
          "https://assets.coingecko.com/coins/images/19700/large/QmdvXyoW82LjwF2w3ya2Sr42WQgXzdTo9jfXW452RJXVLD.png?1635752529",
      "coingeckoId": "decentsol",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "DUSTawucrTsGU8hcqRdHDCbuYhCPADMLM2VcCb8VnFnQ",
      "value": "DUST",
      "label": "DUST Protocol",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24289/large/dust-protocol-degod.png?1647306854",
      "coingeckoId": "dust-protocol",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "GsNzxJfFn6zQdJGeYsupJWzUAm57Ba7335mfhWvFiE9Z",
      "value": "DXL",
      "label": "Dexlab",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/17276/large/3_Gradientvalue.png?1650936792",
      "coingeckoId": "dexlab",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "4Hx6Bj56eGyw8EJrrheM6LBQAvVYRikYCWsALeTrwyRU",
      "value": "DYDX",
      "label": "dYdX (Wormhole)",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23039/large/DYDX_wh_small.png?1644225284",
      "coingeckoId": "dydx-wormhole",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "6nKUU36URHkewHg5GGGAgxs6szkE4VTioGUT5txQqJFU",
      "value": "ELON",
      "label": "Dogelon Mars (Wormhole)",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23041/large/ELON_wh_small.png?1644225332",
      "coingeckoId": "dogelon-mars-wormhole",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "4tJZhSdGePuMEfZQ3h5LaHjTPsw1iWTRFTojnZcwsAU6",
      "value": "ELU",
      "label": "Elumia",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24433/large/me4oOqTM_400x400.png?1647662654",
      "coingeckoId": "elumia",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "5s4BYUXLuvs9ZcVDTxkTpKhThWFSpaU8GG55q2iySe2N",
      "value": "ENRX",
      "label": "Enrex",
      "decimals": 2,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24952/large/enrx.png?1649505778",
      "coingeckoId": "enrex",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "87rSGrpYdmTxfNBf8o2cpyiNcxCmNhUPBXjT8aoyfob5",
      "value": "ENX",
      "label": "Equinox",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25234/large/ReKXsCZUnqSChIZZg4dlCIHQTKU0owxPuvj1feBDWaE.png?1650954548",
      "coingeckoId": "equinox",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "2FPyTwcZLUg1MDrwsyoP4D6s1tM7hAkHYRjkNb5w6Pxk",
      "value": "ETH",
      "label": "Wrapped Ethereum (Sollet)",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24918/large/6250754.png?1649344492",
      "coingeckoId": "wrapped-ethereum-sollet",
      "whitelisted": true,
      "poolToken": false,
      "wrapper": "SRM"
    },
    {
      "mint": "7bb88DAnQY7LSoWEuqezCcbk4vutQbuRqgJMqpX8h6dL",
      "value": "ETH/SOL",
      "label": "ETH/SOL",
      "decimals": 9,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "71FymgN2ZUf7VvVTLE8jYEnjP3jSK1Frp2XT1nHs8Hob",
      "value": "ETH/SOL[aquafarm]",
      "label": "ETH/SOL[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "7TYb32qkwYosUQfUspU45cou7Bb3nefJocVMFX2mEGTT",
      "value": "ETH/USDC",
      "label": "ETH/USDC",
      "decimals": 9,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "3e1W6Aqcbuk2DfHUwRiRcyzpyYRRjg6yhZZcyEARydUX",
      "value": "ETH/USDC[aquafarm]",
      "label": "ETH/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "CbU2bWHoy73HqCm9PQjGcniaxhFkQ65zWTJyUfNU5694",
      "value": "EURONIN",
      "label": "Euronin",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24173/large/Social_Profile-1_%281%29.jpeg?1646751614",
      "coingeckoId": "euronin",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "ExistEr1h19DiEPPzaDpwx3DnjQbrVbXpaxKDYBSNoWj",
      "value": "EXIST",
      "label": "Exist",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25002/large/200x200.png?1649740868",
      "coingeckoId": "exist",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "G7eETAaUzmsBPKhokZyfbaT4tD9igdZSmfQGEYWem8Sw",
      "value": "EYE",
      "label": "NftEyez",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22079/large/eye-coin.png?1640755291",
      "coingeckoId": "nfteyez",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "EdAhkbj5nF9sRM7XN7ewuW8C9XEUMs8P7cnoQ57SYE96",
      "value": "FAB",
      "label": "Fabric",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/16649/large/FABLOGO_TRANS200.png?1624592643",
      "coingeckoId": "fabric",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "6c4L5nTH2sBKkfeuP3WhGp6Vq1tE4Suh4ezRp5KSu8Z7",
      "value": "FANI",
      "label": "FaniTrade",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24029/large/fani_200x200.png?1646115606",
      "coingeckoId": "fanitrade",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "FANTafPFBAt93BNJVpdu25pGPmca3RfwdsDsRrT3LX1r",
      "value": "FANT",
      "label": "Phantasia",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/21604/large/Phantasia_Logo.png?1639553227",
      "coingeckoId": "phantasia",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "GjG7JjTQfQpDxw4hWx4etP9oTaYCuCbPjsU8WaUT3xHB",
      "value": "FANT/USDC[aquafarm]",
      "label": "FANT/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "EchesyfXePKdLtoiZSL8pBe8Myagyy8ZRqsACNCFGnvp",
      "value": "FIDA",
      "label": "Bonfida",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/13395/large/bonfida.png?1658327819",
      "coingeckoId": "bonfida",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "FJ9Q9ojA7vdf5rFbcTc6dd7D3nLpwSxdtFSE8cwfuvqt",
      "value": "FIDA/SOL",
      "label": "FIDA/SOL",
      "decimals": 9,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "EYsNdtyu4gGTaGz8N5m5iQ3G1N6rDyMbR72B3CqbWW4W",
      "value": "FIDA/SOL[aquafarm]",
      "label": "FIDA/SOL[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "AfXLBfMZd32pN6QauazHCd7diEWoBgw1GNUALDw3suVZ",
      "value": "FIRE",
      "label": "Solfire Finance",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22305/large/logo.png?1641446227",
      "coingeckoId": "solfire-finance",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "Hq9MuLDvUAWqC29JhqP2CUJP9879LfqNBHyRRREEXwtZ",
      "value": "FLOCK",
      "label": "Flock",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22775/large/fUNf0Lu.png?1642577185",
      "coingeckoId": "flock",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "3jzdrXXKxwkBk82u2eCWASZLCKoZs1LQTg87HBEAmBJw",
      "value": "FLOOF",
      "label": "FLOOF",
      "decimals": 1,
      "logoURI":
          "https://assets.coingecko.com/coins/images/19810/large/FLOOF_logo_200x200.png?1635917291",
      "coingeckoId": "floof",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "FLWRna1gxehQ9pSyZMzxfp4UhewvLPwuKfdUTgdZuMBY",
      "value": "FLWR",
      "label": "SOL Flowers",
      "decimals": 2,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23534/large/FLWR-Token-Front-ALPHA.png?1644387944",
      "coingeckoId": "sol-flowers",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "ATZERmcPfopS9vGqw9kxqRj9Bmdi3Z268nHXkGsMa3Pf",
      "value": "FONE",
      "label": "Fone",
      "decimals": 2,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23390/large/Fl-zRI0g_400x400.jpg?1644115198",
      "coingeckoId": "fone",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "FoRGERiW7odcCBGU1bztZi16osPBHjxharvDathL5eds",
      "value": "FORGE",
      "label": "Blocksmith Labs Forge",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25411/large/Logo_%281%29.png?1651733020",
      "coingeckoId": "blocksmith-labs-forge",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "6xcfmgzPgABAuAfGDhvvLLMfMDur4at7tU7j3NudUviK",
      "value": "FOSSIL",
      "label": "Fossil",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22593/large/dtdm7P1W_400x400.jpg?1642144690",
      "coingeckoId": "fossil",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "DAtU322C23YpoZyWBm8szk12QyqHa9rUQe1EYXzbm1JE",
      "value": "FOUR",
      "label": "4thpillar technologies",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/3434/large/four-ticker-2021-256x256.png?1617702287",
      "coingeckoId": "the-4th-pillar",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "FoXyMu5xwXre7zEoSvzViRk3nGawHUp9kUh97y2NDhcq",
      "value": "FOXY",
      "label": "Famous Fox Federation",
      "decimals": 0,
      "logoURI":
          "https://assets.coingecko.com/coins/images/26191/large/uFYaQEsU_400x400.jpg?1656397523",
      "coingeckoId": "famous-fox-federation",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "FR87nWEUxVgerFGhZM8Y4AggKGLnaXswr1Pd8wZ4kZcp",
      "value": "FRAX",
      "label": "Frax",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/13422/large/frax_logo.png?1608476506",
      "coingeckoId": "frax",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "FriCEbw1V99GwrJRXPnSQ6su2TabHabNxiZ3VNsVFPPN",
      "value": "FRIES",
      "label": "Soltato FRIES",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/19533/large/soltato.png?1635745612",
      "coingeckoId": "soltato-fries",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "ErGB9xa24Szxbk1M28u2Tx8rKPqzL6BroNkkzk5rG4zj",
      "value": "FRKT",
      "label": "FRAKT",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/18926/large/logo_-_2021-10-11T132203.751.png?1633929748",
      "coingeckoId": "frakt-token",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "FnDxJPNk7pPmGHUbR4XUHmHevrkXHdna5D3sQKcAtjBL",
      "value": "FRKT/USDC[aquafarm]",
      "label": "FRKT/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "3vHSsV6mgvpa1JVuuDZVB72vYbeUNzW4mBxiBftwzHEA",
      "value": "FRNT",
      "label": "Final Frontier",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/24120/large/Token_Logo_2_720p.png?1646386860",
      "coingeckoId": "final-frontier",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "frtnaScfGPuo56uyPGmij1QTc64SBdjnXC3RXmcVmxw",
      "value": "FRTN",
      "label": "Fortune Finance",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23578/large/ZviRqli.png?1644542837",
      "coingeckoId": "fortune-finance",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "EsPKhGTMf3bGoy4Qm7pCv3UCcWqAmbC1UGHBTDxRjjD4",
      "value": "FTM",
      "label": "FTM (Allbridge from Fantom)",
      "decimals": 9,
      "logoURI":
          "https://raw.githubusercontent.com/solana-labs/token-list/main/assets/mainnet/EsPKhGTMf3bGoy4Qm7pCv3UCcWqAmbC1UGHBTDxRjjD4/logo.png",
      "coingeckoId": "fantom",
      "whitelisted": true,
      "poolToken": false
    },
    {
      "mint": "Gpzd833qSmv3kXpQmxEaqkrZTXZaRjhNAoqhf61qAhTG",
      "value": "FTM/USDC[aquafarm]",
      "label": "FTM/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "HEhMLvpSdPviukafKwVN8BnBUTamirptsQ6Wxo5Cyv8s",
      "value": "FTR",
      "label": "Future",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/17316/large/logo_-_2021-07-26T164152.450.png?1627288961",
      "coingeckoId": "future",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "AGFEad2et2ZJif9jaGpdMixQqvW5i81aBdvKe7PHNfz3",
      "value": "FTT",
      "label": "FTX",
      "decimals": 6,
      "logoURI":
          "https://assets.coingecko.com/coins/images/9026/large/F.png?1609051564",
      "coingeckoId": "ftx-token",
      "whitelisted": true,
      "poolToken": false,
      "wrapper": "SRM"
    },
    {
      "mint": "EzfgjvkSwthhgHaceR3LnKXUoRkP6NUhfghdaHAj1tUv",
      "value": "FTT",
      "label": "FTX (Wormhole)",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22996/large/FTT_wh_small.png?1644225637",
      "coingeckoId": "ftx-wormhole",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "YJRknE9oPhUMtq1VvhjVzG5WnRsjQtLsWg3nbaAwCQ5",
      "value": "FTT/SOL",
      "label": "FTT/SOL",
      "decimals": 9,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "EsYaDKJCmcJtJHFuJYwQZwqohvVMCrFzcg8yo3i328No",
      "value": "FTT/SOL[aquafarm]",
      "label": "FTT/SOL[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "FwCombynV2fTVizxPCNA2oZKoWXLZgdJThjE4Xv9sjxc",
      "value": "FTT/USDC[aquafarm]",
      "label": "FTT/USDC[aquafarm]",
      "decimals": 6,
      "logoURI": null,
      "coingeckoId": null,
      "whitelisted": false,
      "poolToken": true
    },
    {
      "mint": "fujiCeCeP9AFDVCv27P5JRcKLoH7wfs2C9xmDECs24m",
      "value": "FUJI",
      "label": "Fuji",
      "decimals": 3,
      "logoURI":
          "https://assets.coingecko.com/coins/images/23732/large/vopR7PC.png?1645171161",
      "coingeckoId": "fuji",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "EZF2sPJRe26e8iyXaCrmEefrGVBkqqNGv9UPGG9EnTQz",
      "value": "FUM",
      "label": "FUMoney",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/21054/large/KuH9TXMM_400x400.jpg?1638263205",
      "coingeckoId": "fumoney",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "B7mXkkZgn7abwz1A3HnKkb18Y6y18WcbeSkh1DuLMkee",
      "value": "FUSD",
      "label": "Synthetic USD (Fabric)",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/25550/large/public.png?1652335818",
      "coingeckoId": "synthetic-usd-fabric",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "6LX8BhMQ4Sy2otmAWj7Y5sKd9YTVVUgfMsBzT6B9W7ct",
      "value": "FXS",
      "label": "Frax Share",
      "decimals": 8,
      "logoURI":
          "https://assets.coingecko.com/coins/images/13423/large/frax_share.png?1608478989",
      "coingeckoId": "frax-share",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "CKaKtYvz6dKPyMvYq9Rh3UBrnNqYZAyd7iF4hJtjUvks",
      "value": "GARI",
      "label": "Gari Network",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/22615/large/gari.png?1642313087",
      "coingeckoId": "gari-network",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "8c71AvjQeKKeWRe8jtTGG1bJ2WiYXQdbjqFbUfhHgSVk",
      "value": "GARY",
      "label": "Gary",
      "decimals": 9,
      "logoURI":
          "https://assets.coingecko.com/coins/images/26448/large/gary_logo_icon.png?1658111709",
      "coingeckoId": "gary",
      "whitelisted": false,
      "poolToken": false
    },
    {
      "mint": "23WuycvPjEuzJTsBPBZqnbFZFcBtBKAMTowUDHwagkuD",
      "value": "GEAR",
      "label": "Starbots GEAR",
      "decimals": 0,
      "logoURI":
          "https://assets.coingecko.com/coins/images/26651/large/logo_%282%29.png?1659408350",
      "coingeckoId": "starbots-gear",
      "whitelisted": false,
      "poolToken": false
    }
  ].toList();
}
