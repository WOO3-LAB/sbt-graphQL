# Woo3 SBT GraphQL

[![License](https://camo.githubusercontent.com/1d2c6f0cf3895ea726803b425d00465f225db55c489fbb582d1c65b55d87b8f7/68747470733a2f2f706f7365722e707567782e6f72672f726562696e672f6772617068716c2d6c61726176656c2f6c6963656e7365)](https://packagist.org/packages/rebing/graphql-laravel)

Woo3 SBT GraphQL with PHP 7.4+ on Laravel 8.0+. It is based on
the [PHP port of GraphQL reference implementation](https://github.com/webonyx/graphql-php). You can find more
information about GraphQL in the [GraphQL Introduction](https://reactjs.org/blog/2015/05/01/graphql-introduction.html)
on the [React](https://reactjs.org/) blog or you can read the [GraphQL specifications](https://spec.graphql.org/).

## Installation

Via composer:

```
composer update
```

### Query example

**Playground:** https://graphql.woo3.xyz/graphiql

request:

```
query getDaoById {
  dao(id: "0a87dbc6952ba24d4bec945ccbdaa498") {
    id
    chain_id
    contract
    contract_name
    logo
    name
  }
}
```

response :

```json
{
    "data": {
        "dao": {
            "id": "0a87dbc6952ba24d4bec945ccbdaa498",
            "chain_id": 137,
            "contract": "0xB2F9C972194fd3FF79697be79fCcecCF2483222f",
            "contract_name": "MarsDAO",
            "logo": "https://woo3-dev.s3.ap-southeast-1.amazonaws.com/clubsLogo/2022-10-22_1666428276_6353ad74a45db.png",
            "name": "MarsDAO"
        }
    }
}
```

request:

```
query getDaoList {
  daos {
    data {
      chain_id
      contract
      contract_name
      id
      logo
      name
    }
    paginatorInfo {
      count
      currentPage
      total
    }
  }
}

```

response :

```
{
  "data": {
    "daos": {
      "data": [
        {
          "chain_id": 137,
          "contract": "0xB2F9C972194fd3FF79697be79fCcecCF2483222f",
          "contract_name": "MarsDAO",
          "id": "0a87dbc6952ba24d4bec945ccbdaa498",
          "logo": "https://woo3-dev.s3.ap-southeast-1.amazonaws.com/clubsLogo/2022-10-22_1666428276_6353ad74a45db.png",
          "name": "MarsDAO"
        },
        {
          "chain_id": 137,
          "contract": "0xA964630d20BEdD4De613D4505098CA5e633A80Dd",
          "contract_name": "AutoDAO",
          "id": "0e2ffc7b8a12b898692de1fe03d109c7",
          "logo": "https://woo3-dev.s3.ap-southeast-1.amazonaws.com/clubsLogo/2022-09-27_1664263078_6332a3a663857.png",
          "name": "AutoDAO"
        },
        {
          "chain_id": 137,
          "contract": "0xbE9017794bD6F4FAaA953FcEDc7c5B6E387b0de1",
          "contract_name": "WOO3Official",
          "id": "1bdda3b35f00babfccf52e26bda6a413",
          "logo": "https://woo3-dev.s3.ap-southeast-1.amazonaws.com/clubsLogo/2022-11-16_1668582381_63748bed52399.jpg",
          "name": "WOO3 Labs"
        },
        {
          "chain_id": 137,
          "contract": "0x14b4f9794d2bC5cC57Bb417894f426a542B10522",
          "contract_name": "dotbit",
          "id": "309bbc119b4219f45f8123dcb4eb6216",
          "logo": "https://woo3-dev.s3.ap-southeast-1.amazonaws.com/clubsLogo/2022-10-11_1665467904_6345060031a12.png",
          "name": ".bit"
        },
        {
          "chain_id": 137,
          "contract": "0x94e7f170c4dc4d00C34B9838CDdA0BE1634b69b3",
          "contract_name": "DigitDAO",
          "id": "5891e9cc82330617fcead40ee237261a",
          "logo": "https://woo3-dev.s3.ap-southeast-1.amazonaws.com/clubsLogo/2022-11-11_1668163384_636e2738b123d.png",
          "name": "DigitDAO"
        },
        {
          "chain_id": 137,
          "contract": "0x40a3672A3e4b30c53175AC669285298823CeBa79",
          "contract_name": "OAC",
          "id": "6c2b767bbaee25ff606d1f7b22e9477c",
          "logo": "https://woo3-dev.s3.ap-southeast-1.amazonaws.com/clubsLogo/2023-01-31_1675100452_63d8012400ed0.jpg",
          "name": "OccultAntsClub"
        },
        {
          "chain_id": 137,
          "contract": "0x5d783DFC81C6c450b69B461124d656298DC94225",
          "contract_name": "openmeta",
          "id": "6c743993974f733856ca9c45e6f60e2a",
          "logo": "https://woo3-dev.s3.ap-southeast-1.amazonaws.com/clubsLogo/2022-09-21_1663753173_632adbd569df6.jpg",
          "name": "openmeta"
        },
        {
          "chain_id": 137,
          "contract": "0x37E09B4814FDD5431eE4Bd851Ce32d5Ae3c5AfdB",
          "contract_name": "AllienAntsClub",
          "id": "77885ddd1b5dafdc14ebca6cd2f6a082",
          "logo": "https://woo3-dev.s3.ap-southeast-1.amazonaws.com/clubsLogo/2022-11-18_1668758470_63773bc6b5a33.jpeg",
          "name": "Occult  Ants Club"
        },
        {
          "chain_id": 137,
          "contract": "0xa797Ce4c8813072201d88657c181b6b574b0161c",
          "contract_name": "AvatarDAO",
          "id": "94794ccb00930c3519c1ce2188aa22c1",
          "logo": "https://woo3-dev.s3.ap-southeast-1.amazonaws.com/clubsLogo/2022-10-08_1665217451_634133abbf18e.jpg",
          "name": "AvatarDAO"
        },
        {
          "chain_id": 137,
          "contract": "0x9b3B43912401109037Fb6DFf60D15dbf9609bE7e",
          "contract_name": "WOO3Playground",
          "id": "989ecb7158ef4a0adbc3cbf686d6b5a6",
          "logo": "https://woo3-dev.s3.ap-southeast-1.amazonaws.com/DAO-default/%E7%94%BB%E6%9D%BF%E5%A4%87%E4%BB%BD+7.png",
          "name": "WOO3 Playground"
        }
      ],
      "paginatorInfo": {
        "count": 10,
        "currentPage": 1,
        "total": 16
      }
    }
  }
}
```

request:

```
query sbtQuery {
  sbt(
    eth_chain_id: 137
    eth_contract: "0xbE9017794bD6F4FAaA953FcEDc7c5B6E387b0de1"
    token_id: "1"
  ) {
    image
    id
    expiry_timestamp
    eth_tx
    eth_contract
    eth_chain_id
    description
    arweave_tx
    token_id
  }
}
```

response:

```
{
  "data": {
    "sbt": {
      "image": "https://arweave.net/HPJTc8sOdOkHAoFqwTP6GCzvK6G5HUtB8WwkHcxI1pY",
      "id": "2",
      "expiry_timestamp": "0",
      "eth_tx": "0xa49d3abc5d132e8b53bb6ff0bb3b8438df475df7beab5d6fd589f93c3620aa4f",
      "eth_contract": "0xbE9017794bD6F4FAaA953FcEDc7c5B6E387b0de1",
      "eth_chain_id": 137,
      "description": "<p>The membership SBT of WOO3 Official community, you can access all the content of community with it</p><p><br></p>",
      "arweave_tx": "AQKVu0XUyHwpGgZtRdL1o63ybzn0S-_xyWvtJzowVDY",
      "token_id": "1"
    }
  }
}

```

