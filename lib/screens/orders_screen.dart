import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_state/providers/orders.dart' show Orders;
import 'package:shop_state/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index)=>OrderItem(orderData.orders[index]),
          itemCount: orderData.orders.length,
        ),
      ),
    );
  }
}
