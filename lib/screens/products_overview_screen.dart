import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_state/providers/cart.dart';
import 'package:shop_state/providers/products.dart';
import 'package:shop_state/widgets/badge.dart';
import 'package:shop_state/widgets/products_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyfavorites = false;

  @override
  Widget build(BuildContext context) {
    //final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Shop'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                                  if (selectedValue == FilterOptions.Favorites) {
                  //    productsContainer.showFavoritesOnly();
                  _showOnlyfavorites = true;
                } else {
                  //    productsContainer.showAll();
                  _showOnlyfavorites = false;
                }  
                                });
              
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text('Only Favorites'),
                        value: FilterOptions.Favorites),
                    PopupMenuItem(
                        child: Text('Show All'), value: FilterOptions.All),
                  ],),
                  
                  Consumer<Cart>(builder: (_,cart,child)=>
                     Badge(child:child ,
                     value: cart.itemCount.toString(),
                  ), 
                  child: IconButton(
                    icon:Icon(Icons.shopping_cart,),
                    onPressed: (){},)
                  ),

        ],
      ),
      body: ProductsGrid(_showOnlyfavorites),
    );
  }
}
