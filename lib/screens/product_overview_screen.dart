// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../components/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

  bool _showFavoteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Minha Loja'),
        ),
        actions: [
          PopupMenuButton(
            tooltip: 'Mostrar Filtros',
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: FilterOptions.Favorite,
                child: Text('Somente Favoritos'),
              ),
              PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Todos'),
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorite) {
                setState(() {
                  _showFavoteOnly = true;
                });
              } else {
                setState(() {
                  _showFavoteOnly = false;
                });
              }
            },
          )
        ],
      ),
      body: ProductGrid(_showFavoteOnly),
    );
  }
}
