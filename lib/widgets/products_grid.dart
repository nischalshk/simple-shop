import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_state/providers/products.dart';
import 'package:shop_state/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      // itemBuilder: (context, index) => ChangeNotifierProvider(
      //   create: (c)=>products[index],
       //Alternate Used when reusing existing widgets
       itemBuilder: (context,index)=>ChangeNotifierProvider.value(
         value:products[index] ,
        child:ProductItem(
        // products[index].id,
        // products[index].title,
        // products[index].imageUrl,
      ),
        ) ,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
