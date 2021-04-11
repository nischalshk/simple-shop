import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_state/providers/cart.dart' show Cart;
import 'package:shop_state/screens/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total', style: TextStyle(fontSize: 20)),
                Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(
                        color:Theme.of(context).primaryTextTheme.headline6.color,),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
        TextButton(onPressed: (){}, 
        child: Text('Order Now', style: TextStyle(color: Theme.of(context).primaryColor),),),


                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(child: ListView.builder(
            itemBuilder: (ctx,i)=>CartItem(
              cart.items.values.toList()[i].id, 
              cart.items.keys.toList()[i], //productId
              cart.items.values.toList()[i].price, 
              cart.items.values.toList()[i].quantity, 
              cart.items.values.toList()[i].title),itemCount:cart.items.length ,))
        ],
      ),
    );
  }
}