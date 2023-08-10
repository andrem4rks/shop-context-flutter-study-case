import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem(this.product, {super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            title: Text(
              widget.product.title,
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Theme.of(context).primaryColor,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).primaryColor,
              ),
            ),
            backgroundColor: onHover ? Colors.black87 : Colors.black54,
          ),
          child: InkWell(
            onHover: (value) => setState(() {
              onHover = value;
            }),
            mouseCursor: MaterialStateMouseCursor.clickable,
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_DETAIL,
                arguments: widget.product,
              );
            },
            child: Image.network(
              widget.product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
