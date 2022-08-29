import 'package:flutter/material.dart';
import 'package:foodapp/Widget/appBar.dart';
import 'package:foodapp/styles/generalStyle.dart';
import 'package:foodapp/styles/myforms.dart';
import 'package:foodapp/views/mealAndOrderPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool viewAll = false;
  bool recoview = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: antiflashwhite,
      appBar: PreferredSize(
        child: CustomAppBar(
          search: search,
          removeSearch: false,
          cart: false,
        ),
        preferredSize: const Size.fromHeight(150),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                CardTileWidget(
                  icon: Icons.replay,
                  tiletext: 'Repeat Order',
                ),
                CardTileWidget(
                  icon: Icons.help,
                  tiletext: 'Help me choose',
                ),
                CardTileWidget(
                  icon: Icons.fastfood_rounded,
                  tiletext: 'Suprise me',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Top Categories", style: mediumGreyHeader),
                        InkWell(
                          onTap: () {
                            setState(() {
                              viewAll = !viewAll;
                            });
                          },
                          child: Row(
                            children: const [
                              Text(
                                'View All',
                                style: TextStyle(
                                  color: arsenic,
                                ),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    viewAll
                        ? Wrap(
                            children: [
                              FoodCategory(viewAll: viewAll),
                              FoodCategory(viewAll: viewAll),
                              FoodCategory(viewAll: viewAll),
                              FoodCategory(viewAll: viewAll),
                              FoodCategory(viewAll: viewAll),
                            ],
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                FoodCategory(viewAll: viewAll),
                                FoodCategory(viewAll: viewAll),
                                FoodCategory(viewAll: viewAll),
                                FoodCategory(viewAll: viewAll),
                                FoodCategory(viewAll: viewAll),
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Recommendend for you",
                            style: mediumGreyHeader),
                        InkWell(
                          onTap: () {
                            setState(() {
                              recoview = !recoview;
                            });
                          },
                          child: Row(
                            children: const [
                              Text(
                                'View All',
                                style: TextStyle(
                                  color: arsenic,
                                ),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (recoview)
                      Column(
                        children: [
                          FoodContainerCard(recoview: recoview),
                          FoodContainerCard(recoview: recoview),
                          FoodContainerCard(recoview: recoview),
                          FoodContainerCard(recoview: recoview),
                        ],
                      )
                    else
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MealAndOrderPage(),
                                    ),
                                  );
                                },
                                child: FoodContainerCard(recoview: recoview)),
                            FoodContainerCard(recoview: recoview),
                            FoodContainerCard(recoview: recoview),
                            FoodContainerCard(recoview: recoview),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class FoodContainerCard extends StatelessWidget {
  FoodContainerCard({
    this.recoview,
    Key? key,
  }) : super(key: key);
  bool? recoview;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage('assets/bg1.jpg'),
                  radius: recoview! ? 100 : 80,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: recoview! ? 200 : 100,
                      child: Text(
                        'sadza and vegetables',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: mediumAsernictText.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('\$2000',
                        style: mediumAsernictText.copyWith(
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class FoodCategory extends StatelessWidget {
  FoodCategory({
    Key? key,
    this.viewAll,
  }) : super(key: key);
  bool? viewAll;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: viewAll! ? 150 : null,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: viewAll! ? 5 : 0),
      child: Row(
        children: const [
          Icon(Icons.coffee),
          SizedBox(
            width: 8,
          ),
          Text('Coffee'),
        ],
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class CardTileWidget extends StatelessWidget {
  CardTileWidget({
    Key? key,
    required this.icon,
    required this.tiletext,
  }) : super(key: key);
  IconData icon;
  String tiletext;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: Icon(icon),
        title: Text(
          tiletext,
          style: mediumAsernictText,
        ),
      ),
    );
  }
}
