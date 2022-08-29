import 'package:flutter/material.dart';
import 'package:foodapp/styles/generalStyle.dart';
import 'package:foodapp/styles/myforms.dart';
import 'package:foodapp/views/cartPage.dart';

TextEditingController search = TextEditingController();

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
    this.cart,
    this.removeSearch,
    required this.search,
  }) : super(key: key);
  bool? removeSearch;
  bool? cart;
  final TextEditingController search;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: grey,
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(20),
          bottomStart: Radius.circular(20),
        ),
      ),
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cart! ? 'Orders' : 'EatFast',
                  style: TextStyle(
                    color: white,
                    fontSize: cart! ? 20 : 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                cart!
                    ? const SizedBox.shrink()
                    : InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartPage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: green,
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.shopping_cart, color: arsenic),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '2',
                                style: TextStyle(fontSize: 18, color: arsenic),
                              )
                            ],
                          ),
                        ),
                      ),
              ],
            ),
            removeSearch!
                ? const SizedBox.shrink()
                : const SizedBox(
                    height: 20,
                  ),
            removeSearch!
                ? const SizedBox.shrink()
                : Form(child: SearchForm(search: search))
          ],
        ),
      ),
    );
  }
}
