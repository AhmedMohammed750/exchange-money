import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class Cripto extends StatefulWidget {
  const Cripto({super.key});

  @override
  State<Cripto> createState() => _CriptoState();
}

class _CriptoState extends State<Cripto> {
  List cripto = [];
  List des = [
    'Bitcoin is a cryptocurrency that was invented in 2008 by a person or group of anonymous people known as Satoshi Nakamoto. It began to be used in 2009 when the program was released as open source software.',
    'Ethereum or ether is a public platform and an open source decentralized cryptocurrency that relies on block chain technology that performs a smart contract function through which it facilitates the conclusion of an online contract that simulates traditional contracts in reality while providing an element of security and trust. Ether is second only to Bitcoin in terms of market capitalization.',
    'Tether is a cryptocurrency with tokens issued by Tether Limited which in turn is controlled by the owners of Bitfinex. Tether is called a stablecoin because it was originally designed to be perpetually worth \$1.00, with reserves of \$1.00 for each Tether generated.',
    'Binance coin is the crypto-coin issued by the binance exchange and trades with a BNB symbol. This coin runs on the Ethereum blockchain with standard ERC 20 and is limited to a maximum of 200 million BNB tokens',
    'USD is the currency of the United States of America and stands for United States Dollar.',
    'Ripple is a peer-to-peer payment protocol, real-time payment protocol, currency exchange market, and money transfer network by Ripple. Also called the Ripple Transaction Protocol or the Ripple Protocol, it is built on an open source distributed Internet protocol, consensus ledger and native currency called XRP.',
    'Cardano is an open-source, decentralized, and proof-of-stake currency and blockchain. It can facilitate peer-to-peer transactions using its internal cryptocurrency, called Ada. Cardano was founded in 2015 by the co-founder of Ethereum',
    'Staked ether (stETH) is a cryptocurrency token that aims to represent an Ethereum token that is "staked" or deposited to support blockchain operations. The token is designed on Lido, a decentralized finance protocol.',
    'Dogecoin is a cryptocurrency that was launched as a joke invented by software engineers Billy Marcus and Jackson Palmer, who decided to create an instant and fun payment system free of traditional bank fees. Dogecoin features a Shiba Inu dog as its logo.',
    'Polygon or Matic Network is a block chain project that enables chain networks to connect and scale on the Ethereum blockchains. The project was founded in 2017 by four Mumbai-based software engineers: Jainti Kanani, Sandeep Nailwa, Anyoung Arjun and Mihailu Bjlik, but in February 2021',
    'Solana is a cryptocurrency and blockchain whose first technical paper was first published by Anatoly Yakovenko in November 2017.',
    'Cryptocurrencies create their currencies on the blockchain of the Blockchain network.',
    'What Is Binance USD (BUSD)? BUSD is a fiat-backed stablecoin issued by Binance and Paxos. Each BUSD token is backed 1:1 with US dollars held in reserve. BUSD aims to provide a more stable cryptocurrency alternative for traders and investors who are looking to avoid the volatility of the digital asset market.'
  ];
  getdata1() async {
    try {
      var url = Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=1h');
      var respons = await http.get(url);
      var body = jsonDecode(respons.body);
      setState(() {
        cripto.add(body);
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    getdata1();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(250, 4, 4, 1),
                    Color.fromRGBO(239, 240, 247, 1),
                  ],
                ),
              ),
              height: 20.h,
              width: 100.w,
              child: Center(
                  child: Text(
                'On this page, we present to you the most traded cryptocurrencies, updated every 24 hours',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
              )),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(cripto[index][0]['id']),
                  subtitle: Text(
                      cripto[index][0]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][0]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[0]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: Colors.red,
                  title: Text(cripto[index][1]['id']),
                  subtitle: Text(
                      cripto[index][1]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][1]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[1]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(cripto[index][2]['id']),
                  subtitle: Text(
                      cripto[index][2]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][2]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[2]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: Colors.red,
                  title: Text(cripto[index][3]['id']),
                  subtitle: Text(
                      cripto[index][3]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][3]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[3]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(cripto[index][4]['id']),
                  subtitle: Text(
                      cripto[index][4]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][4]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[4]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: Colors.red,
                  title: Text(cripto[index][5]['id']),
                  subtitle: Text(
                      cripto[index][5]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][5]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[5]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(cripto[index][6]['id']),
                  subtitle: Text(
                      cripto[index][6]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][6]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[6]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: Colors.red,
                  title: Text(cripto[index][7]['id']),
                  subtitle: Text(
                      cripto[index][7]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][7]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[7]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(cripto[index][8]['id']),
                  subtitle: Text(
                      cripto[index][8]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][8]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[8]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: Colors.red,
                  title: Text(cripto[index][9]['id']),
                  subtitle: Text(
                      cripto[index][9]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][9]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[9]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(cripto[index][10]['id']),
                  subtitle: Text(
                      cripto[index][10]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][10]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[10]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: Colors.red,
                  title: Text(cripto[index][11]['id']),
                  subtitle: Text(
                      cripto[index][11]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][11]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[11]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cripto.length,
              // the number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(cripto[index][12]['id']),
                  subtitle: Text(
                      cripto[index][12]['current_price'].toString() + ' \$'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cripto[index][12]['image']),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      dialogType: DialogType.info,
                      barrierColor: Colors.red[200],
                      btnOkColor: Colors.red,
                      body: Center(
                        child: Text(
                          '${des[12]}',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: 'More information',
                      btnOkOnPress: () {},
                    ).show();
                  },
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
