import 'package:av_net_shop/screens/home/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:flutter_svg/svg.dart';

import 'cart_item_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: demoCarts.length,
      itemBuilder: (BuildContext context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: Key(demoCarts[index].product.id.toString()),
          background: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [Spacer(), SvgPicture.asset("assets/icons/Trash.svg")],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CartItemCard(cart: demoCarts[index]),
          ),
          onDismissed: (direction) {
            setState(() {
              demoCarts.removeAt(index);
            });
          },
        );
      },
    );
    //CartItemCard(cart: demoCarts[0]);
  }
}


/*    Dismissible(
        key: Key(demoCarts[0].product.id.toString() ),
        background: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration:  BoxDecoration(
          color:Colors.amber[200],
          borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
              Spacer(),
              SvgPicture.asset("assets/icons/Trash.svg")
            ],  
          ),
          ),
          
         child: CartItemCard(cart: demoCarts[0]), 
    
    );*/