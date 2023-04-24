// ignore_for_file: prefer_const_constructors
import 'dart:developer';


import 'package:exchange_money/cripto.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import 'api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
 

class _HomeScreenState extends State<HomeScreen> {
 var _currentindex = 1;
  List<Widget> body = [
    homepage(),
    Cripto(),
    
    Icon(Icons.monetization_on)
  ];
  getdata() async {
    try {
      var url = Uri.parse('https://api.exchangerate.host/latest');
      var respons = await http.get(url);
      var body = jsonDecode(respons.body);
      setState(() {
        snap.add(body);
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    getdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        backgroundColor: Colors.red[700],
        currentIndex: _currentindex,
        items: const[BottomNavigationBarItem(icon: Icon(Icons.monetization_on),label: 'Money'),
        BottomNavigationBarItem(icon: Icon(Icons.currency_bitcoin),label: 'CryptoCurrency'),
        BottomNavigationBarItem(icon: Icon(Icons.api),label: 'gold'),],
        onTap: (value) {
          setState(() {
            _currentindex=value;
            print(value);
          });
        },
      ),
    );
  }
}





class homepage extends StatefulWidget {
  const homepage({
    Key? key,
  }) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            height: 35.h,
            width: 100.w,
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
          ),
          Positioned(
              top: 0.h,
              left: 70.w,
              child: Container(
                  height: 20.h,
                  width: 20.h,
                  child: ClipOval(
                      child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.contain,
                  )))),
          SizedBox(
            height: 10.h,
          ),
          Positioned(
              top: 17.h,
              right: 50.w,
              child: Text(
                'Welcome to CashA',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
              )),
          Positioned(
              top: 20.h,
              right: 25.w,
              child: Text(
                "I'm here to help you exchange money",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
              ))
        ]),
        SizedBox(
          height: 2.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                snap[index]['date'],
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
              ),
            );
          },
          itemCount: snap.length,
        ),
        SizedBox(
          height: 2.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    Center(
                        child: Container(
                      height: 10.h,
                      width: 95.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: const [
                            Color.fromRGBO(250, 4, 4, 1),
                            Color.fromRGBO(239, 240, 247, 1),
                          ],
                        ),
                      ),
                      child: Center(
                          child: Text(
                        (snap[index]['rates']['IQD'].toStringAsFixed(1) +
                            ' IQD'),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                      )),
                    )),
                    Positioned(
                        top: 2.h,
                        right: 80.w,
                        child: Text(
                          '1 Euro',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ))
                  ]),
                  SizedBox(
                    height: 2.h,
                  ),
                  Stack(children: [
                    Center(
                        child: Container(
                      height: 10.h,
                      width: 95.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: const [
                            Color.fromRGBO(250, 4, 4, 1),
                            Color.fromRGBO(239, 240, 247, 1),
                          ],
                        ),
                      ),
                      child: Center(
                          child: Text(
                        (snap[index]['rates']['USD'].toStringAsFixed(1) +
                            ' USD'),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                      )),
                    )),
                    Positioned(
                        top: 2.h,
                        right: 80.w,
                        child: Text(
                          '1 Euro',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ))
                  ]),
                  SizedBox(
                    height: 2.h,
                  ),
                  Stack(children: [
                    Center(
                        child: Container(
                      height: 10.h,
                      width: 95.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: const [
                            Color.fromRGBO(250, 4, 4, 1),
                            Color.fromRGBO(239, 240, 247, 1),
                          ],
                        ),
                      ),
                      child: Center(
                          child: Text(
                        ((snap[index]['rates']['AED'].toStringAsFixed(1)) +
                            ' AED'),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                      )),
                    )),
                    Positioned(
                        top: 2.h,
                        right: 80.w,
                        child: Text(
                          '1 Euro',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ))
                  ]),
                  SizedBox(
                    height: 2.h,
                  ),
                  Stack(children: [
                    Center(
                        child: Container(
                      height: 10.h,
                      width: 95.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: const [
                            Color.fromRGBO(250, 4, 4, 1),
                            Color.fromRGBO(239, 240, 247, 1),
                          ],
                        ),
                      ),
                      child: Center(
                          child: Text(
                        (snap[index]['rates']['IRR'].toStringAsFixed(1) +
                            ' IRR'),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                      )),
                    )),
                    Positioned(
                        top: 2.h,
                        right: 80.w,
                        child: Text(
                          '1 Euro',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ))
                  ]),
                ],
              ),
            );
          },
          itemCount: snap.length,
        ),
      ],
    );
  }
}
