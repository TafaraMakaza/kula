import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kula_game/kula_crush/game_widgets/fancy_button.dart';
import 'package:kula_game/kula_crush/model/tile.dart';
import 'package:kula_game/models/food_item.dart';


class ViewProduct extends StatefulWidget {
  ViewProduct({Key key, this.product}) : super(key: key);

  final FoodItem product;

  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {

   final deepGreen = Color(0xFF454C48);
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(left:0, top:15),
          child: Align(
            alignment: Alignment.topLeft,
            child: (
                Text(
                  widget.product.name,
                  style: GoogleFonts.gochiHand(
                      fontSize: 25,
                      textStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                )
            ),
          ),
        ),

      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Flexible(
              flex: 5,
              child: Card(
                elevation: 5.0,
                child: Image.asset(
                  widget.product.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            //============ product name
//            Flexible(
//              flex: 2,
//              child: Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(
//                  widget.product.name,
//                  style: GoogleFonts.piedra(
//                    fontSize: 30,
//                    textStyle: TextStyle(
//                      color: Colors.green
//                    )
//
//                  )
//                ),
//              ),
//            ),

            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "\$ ${widget.product.price.toString()}0",
                  style: GoogleFonts.gochiHand(
                      fontSize: 45,
                      textStyle: TextStyle(
                          color: Colors.black,
                        fontWeight: FontWeight.bold
                      )

                  ),
                ),
              ),
            ),

            //============ Contains
            Flexible(
              flex: 2,
                child: Text("Contents", style:GoogleFonts.gochiHand(
                    fontSize: 20,
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )

                ),
                )
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: deepGreen,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(widget.product.description,
                      textAlign: TextAlign.center,
                        style: GoogleFonts.gochiHand(
                            fontSize:20,
                            textStyle: TextStyle(
                                color: Colors.white
                            )

                        ),

                      ),
                    ),
                  ),
                ),
              ),
            ),

            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FancyButton(
                  color: Colors.deepOrange,
                  size: 40,
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    "   X   ",
                    style: GoogleFonts.gochiHand(
                        fontSize: 25,
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

      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}