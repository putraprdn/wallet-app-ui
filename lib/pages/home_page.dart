// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletappui/utils/my_button.dart';
import 'package:walletappui/utils/my_card.dart';
import 'package:walletappui/utils/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.pink,
        child: const Icon(
          Icons.monetization_on,
          size: 32.0,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 70.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 32.0,
                  color: Colors.pink[200],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 32.0,
                  color: Colors.pink[200],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),

            // Appbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        "My",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Cards",
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),

                  // Plus button
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            // Cards
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: 500,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 12345678,
                    expiryMonth: 12,
                    expiryYear: 24,
                    color: Colors.deepPurple[300],
                  ),
                  MyCard(
                    balance: 432 / 20,
                    cardNumber: 12345678,
                    expiryMonth: 11,
                    expiryYear: 28,
                    color: Colors.blue[300],
                  ),
                  MyCard(
                    balance: 1024.12,
                    cardNumber: 12345678,
                    expiryMonth: 01,
                    expiryYear: 125,
                    color: Colors.green[300],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25.0),

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade700,
                dotWidth: 10,
                dotHeight: 10,
              ),
            ),

            const SizedBox(height: 25.0),

            // 3 buttons -> send + pay + bills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Send button
                  MyButton(
                    iconImagePath: 'lib/icons/send-money.png',
                    buttonText: "Send",
                  ),

                  // Pay button
                  MyButton(
                    iconImagePath: 'lib/icons/credit-card.png',
                    buttonText: "Pay",
                  ),

                  // Bills button
                  MyButton(
                    iconImagePath: 'lib/icons/bill.png',
                    buttonText: "Bills",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Column -> stats + transactions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  MyListTile(
                    iconImagePath: "lib/icons/statistics.png",
                    titleTitle: "Statistics",
                    tileSubTitle: "Payment and Income",
                  ),
                  MyListTile(
                    iconImagePath: "lib/icons/transaction.png",
                    titleTitle: "Transactions",
                    tileSubTitle: "Transaction History",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
