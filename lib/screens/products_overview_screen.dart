import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_state/providers/products.dart';
import 'package:shop_state/widgets/products_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Shop'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                if (selectedValue == FilterOptions.Favorites) {
                  productsContainer.showFavoritesOnly();
                } else {
                  productsContainer.showAll();
                }
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
                  ]),
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
