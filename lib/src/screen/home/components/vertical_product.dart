import 'package:flutter/material.dart';
import 'package:kubo_test/src/models/products.dart';

class VerticalProductCard extends StatefulWidget {
  final Datum product;

  const VerticalProductCard(this.product, {Key? key}) : super(key: key);

  @override
  _VerticalProductCardState createState() => _VerticalProductCardState();
}

class _VerticalProductCardState extends State<VerticalProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 140,
              width: 140,
              child: ClipRRect(
                child: Image.network(
                  widget.product.imagen,
                  errorBuilder: (context, error, stackTrace) =>
                      const Text('😢'),
                ),
              ),
            ),
            Text(widget.product.nombre),
            Text(
              '${widget.product.precio}  COP',
              style: const TextStyle(color: Colors.red),
            ),
            Text(
                '${int.parse(widget.product.precio) - (int.parse(widget.product.precio) * int.parse(widget.product.valorPromo) / 100)}  COP'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: isFavorite ? Colors.redAccent : Colors.grey,
                  ),
                  onPressed: _onTap,
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: isFavorite ? Colors.redAccent : Colors.grey,
                  ),
                  onPressed: _onTap,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _onTap() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
}
