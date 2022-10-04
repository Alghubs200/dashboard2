import 'dart:ffi';

import 'package:dashboard2/util/my_card.dart';
import 'package:dashboard2/util/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../util/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Page Controller
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "My ",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Cards",
                      style: TextStyle(fontSize: 26),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                    child: Icon(Icons.add)),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 200,
            child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCard(
                    balance: 5250.20,
                    cardNUmber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.purple,
                  ),
                  MyCard(
                    balance: 7250.20,
                    cardNUmber: 322122344,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.green,
                  ),
                  MyCard(
                    balance: 51250.20,
                    cardNUmber: 653393535,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.yellow,
                  ),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: JumpingDotEffect(
                dotHeight: 16,
                dotWidth: 16,
                jumpScale: .7,
                verticalOffset: 15,
                activeDotColor: Colors.grey.shade900),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //send button
                MyButton(iconImagePath: 'icons/money.png', buttonText: 'Send'),
                //pay button
                MyButton(iconImagePath: 'icons/credit.png', buttonText: 'Pay'),
                //bills button
                MyButton(iconImagePath: 'icons/bill.png', buttonText: 'Bills'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // statistics

                MyListTile(
                    iconImagePath: 'icons/analysis.png',
                    tileTitle: 'Statistics',
                    TileSubTitle: 'Payment and income'),
                //transaction
                MyListTile(
                    iconImagePath: 'icons/trans.png',
                    tileTitle: 'Transaction',
                    TileSubTitle: 'Transaction History'),
              ],
            ),
          ),
        ])));
  }
}
