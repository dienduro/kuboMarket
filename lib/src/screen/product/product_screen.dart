import 'package:flutter/material.dart';

class ProductoScreen extends StatelessWidget {
  const ProductoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Producto"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 300,
            child: ClipRRect(child: Image.network("image url")),
          ),
          SizedBox(
            height: 100,
            width: 250,
            child: ClipRRect(child: Image.network("image url")),
          ),
          Card(
            child: Column(
              children: [
                Row(
                  children: const [Text("Nombre"), Icon(Icons.favorite_border)],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text("descripcion"),
                const Text("precio"),
                const Text("precio Descuento"),
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.keyboard_arrow_down_rounded),
                      Text("0"),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
                Center(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.green,
                    child: Row(
                      children: const [
                        Icon(Icons.shopping_bag_outlined),
                        Text("Añadir al carrito"),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Text("Descripcion"),
                    Icon(Icons.arrow_drop_down_outlined)
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
