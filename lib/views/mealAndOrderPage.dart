import 'package:flutter/material.dart';
import 'package:foodapp/Widget/appBar.dart';
import 'package:foodapp/styles/generalStyle.dart';

class MealAndOrderPage extends StatelessWidget {
  const MealAndOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: antiflashwhite,
      appBar: PreferredSize(
        child: CustomAppBar(
          search: search,
          removeSearch: true,
          cart: false,
        ),
        preferredSize: const Size.fromHeight(100),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                child: const CircleAvatar(
                  backgroundImage: const AssetImage('assets/bg1.jpg'),
                  radius: 150,
                ),
              ),
            ),
            Card(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rice and fryed chicken',
                        style: mediumGreyHeader,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        '\$ 2000',
                        style: mediumGreyHeader,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.location_pin),
                          Text('chicken slice mvuma branch',
                              style: mediumAsernictText),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'About the meal',
                        style: mediumGreyHeader,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                          'We all have dreams... We all want to believe deep down in our souls that we have a special gift, that',
                          style: mediumAsernictText),
                    ],
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => print('add to cart'),
        label: Text(
          'Add to cart',
        ),
        backgroundColor: grey,
        icon: Icon(Icons.add),
      ),
    );
  }
}
