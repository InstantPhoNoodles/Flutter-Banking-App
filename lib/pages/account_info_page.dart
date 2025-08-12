import 'package:banking_app/pages/placeholder_page.dart';
import 'package:flutter/material.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Checkings Account - (...1324)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                SizedBox(height: 15),

                // Account Info Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue[800]!, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text('\$123.00', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                      Text('Available Balance', style: TextStyle(fontSize: 12)),
                      SizedBox(height: 25),

                      Text('Account Details', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      Text('Present Balance'),
                      Text('Account Number'),
                      Text('Routing Number'),
                      Text('Last Statement Date'),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                // Transaction Info Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue[800]!, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        children: [
                          Text('See All Transactions'),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PlaceholderPage()),
                              );
                            },
                            icon: Icon(Icons.arrow_circle_right_outlined, size: 18,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Starbucks'),
                          Text('\$8.73'),
                        ],
                      ),
                      Divider(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Walmart'),
                          Text('\$17.42'),
                        ],
                      ),
                      Divider(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Target'),
                          Text('\$23.65'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}