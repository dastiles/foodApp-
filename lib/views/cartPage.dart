import 'package:flutter/material.dart';
import 'package:foodapp/Widget/appBar.dart';
import 'package:foodapp/styles/generalStyle.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: antiflashwhite,
      appBar: PreferredSize(
        child: CustomAppBar(
          search: search,
          removeSearch: true,
          cart: true,
        ),
        preferredSize: const Size.fromHeight(100),
      ),
      body: Column(children: [
        Column(
          children: [
            Card(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        backgroundImage: const AssetImage('assets/bg1.jpg'),
                        radius: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rice and fryed chicked',
                            style: mediumAsernictText,
                          ),
                          Row(
                            children: [
                              IncementBtn(),
                              Text('2'),
                              IncementBtn(),
                            ],
                          )
                        ],
                      )
                    ]),
              ),
            )
          ],
        )
      ]),
    );
  }
}

class IncementBtn extends StatelessWidget {
  const IncementBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 30,
        height: 30,
        color: green,
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
    );
  }
}
