import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kula_game/kula_crush/game_widgets/fancy_button.dart';
import 'package:kula_game/models/food_item.dart';
import 'package:kula_game/screens/homepage.dart';
import 'package:kula_game/screens/tabShop.dart';
import 'package:kula_game/shop/bloc/cartlistBloc.dart';
import 'package:kula_game/shop/bloc/listTileColorBloc.dart';
import 'package:kula_game/shop/cart.dart';
import 'package:kula_game/shop/product_detail.dart';

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        //add yours BLoCs controllers
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: MaterialApp(
        title: "Kula Shop",
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Home extends StatelessWidget {

  final deepGreen = Color(0xFF454C48);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepGreen,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: CustomAppBar(),
        ),
      ),
      body: SafeArea(
          child: Container(
            color: deepGreen,
        child: TabShop(foodItemList: fooditemList),


      )),
    );
  }
}

class ItemContainer extends StatefulWidget {
  ItemContainer({
    @required this.foodItem,
  });

  final FoodItem foodItem;

  @override
  _ItemContainerState createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer> {
  final deepGreen = Color(0xFF454C48);

  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
  bool isSelected = false;
  addToCart(FoodItem foodItem) {
    bloc.addToList(foodItem);
  }

  removeFromList(FoodItem foodItem) {
    bloc.removeFromList(foodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {

        },
        child: productItem(widget.foodItem)
    );
  }

//What a product looks like
  Container productItem(FoodItem productItem) {
    return Container(
      width:  MediaQuery.of(context).size.width*0.75,
      height:  MediaQuery.of(context).size.height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 5,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewProduct(product: widget.foodItem,)));
              }
              ,
              child: Card(
                elevation: 5.0,
                color: deepGreen,
                child: Image.asset(
                  productItem.image,
                  fit: BoxFit.contain,
                  //width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ),
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(productItem.name,
                style: GoogleFonts.gochiHand(
                    fontSize: 25,
                    textStyle: TextStyle(
                        color: Colors.black
                    )
                ),
                ),
              )),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          widget.foodItem.quantity--;
                        });
                      },
                      child: Icon(
                        Icons.arrow_back_ios
                      )
                    ),
                    Text(
                      widget.foodItem.quantity.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          widget.foodItem.quantity++;
                        });
                      },
                      child: Icon(
                        Icons.arrow_forward_ios
                      )
                    ),

                  ],
                ),

                //The price

              ],
            ),
          ),

          //The price======================$$$$$$$$$$$$$$$$$+++++++++++++++++++++++++++++

          Flexible(
            flex: 2,
            child: FancyButton(
              onPressed: (){

                addToCart(widget.foodItem);
                //addToCart(widget.foodItem);
                final snackBar = SnackBar(
                  content: Text(
                      ' ${widget.foodItem.quantity} x ${widget.foodItem.name} now in the Cart'),
                  duration: Duration(milliseconds: 550),
                );

                Scaffold.of(context).showSnackBar(snackBar);
              },
              size: 5,
              color: Colors.deepOrange,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ("Add " +(productItem.price * productItem.quantity).toString() + "0 USD"),
                  style: GoogleFonts.gochiHand(
                      fontSize: 20,
                    textStyle: TextStyle(
                      color: Colors.white
                    )
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}



Widget title(BuildContext theContext) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQuery.of(theContext).size.width,
      height: MediaQuery.of(theContext).size.width / 5,
      child: FlareActor("assets/Fruits.flr",
          fit: BoxFit.contain, animation: "move"),
    ),
  );
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuPage()));
              },
              child: Icon(CupertinoIcons.back)),
          text(),
          StreamBuilder(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              List<FoodItem> foodItems = snapshot.data;
              int length = foodItems != null ? foodItems.length : 0;

              return buildGestureDetector(length, context, foodItems);
            },
          )
        ],
      ),
    );
  }

  Text text(){
    return Text(
      "Kula Shop",
      style: TextStyle(
        color: Colors.white,
        fontFamily: "Whale",
        fontSize: 35
      ),
    );
  }

  GestureDetector buildGestureDetector(
      int length, BuildContext context, List<FoodItem> foodItems) {
    return GestureDetector(
      onTap: () {
        if (length > 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else {
          return;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Text(length.toString()),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.deepOrange, borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}
