import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kula_game/models/food_item.dart';
import 'package:kula_game/screens/shop.dart';

class TabShop extends StatefulWidget {
  final FooditemList foodItemList;

  TabShop({@required this.foodItemList});

  @override
  _TabShopState createState() => _TabShopState();
}

class _TabShopState extends State<TabShop> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            bottom: TabBar(tabs: [
              //Image.asset("assets/products/African_Basket_Logo.png", fit: BoxFit.fitHeight, width: 10,height: 10,),
           
             // Image.asset("assets/products/Quick_Fresh_Logo.png", fit: BoxFit.fitHeight,width: 10,height: 10,),
              Text("Quickfresh",
                style: GoogleFonts.gochiHand(
                    fontSize: 25,
                    textStyle: TextStyle(
                        color: Colors.white
                    )
                ),

              ),
              //Image.asset("assets/products/Honeyscoop_Logo.png", fit: BoxFit.fitHeight, width: 10,height: 10,),
              Text("Fresh  Forward",
                style: GoogleFonts.gochiHand(
                    fontSize: 25,
                    textStyle: TextStyle(
                        color: Colors.white
                    )
                ),

              ),
            ]),
          ),
          body: TabBarView(children: [
//             any widget can work very well here <3

            new GridView(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              children: <Widget>[
                for (var foodItem in fooditemList.quickFresh)
                  Builder(
                    builder: (context) {
                      return ItemContainer(foodItem: foodItem);
                    },
                  )
              ],
            ),
            new GridView(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              children: <Widget>[
                for (var foodItem in fooditemList.freshForward)
                  Builder(
                    builder: (context) {
                      return ItemContainer(foodItem: foodItem);
                    },
                  )
              ],
            ),
          ]),
        ));
  }
}
