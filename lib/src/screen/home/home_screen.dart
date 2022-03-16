import 'package:flutter/material.dart';
import 'package:kubo_test/src/screen/home/components/search_field.dart';
import 'package:kubo_test/src/screen/home/components/vertical_product.dart';
import 'package:kubo_test/src/services/plaza.dart';
import 'package:kubo_test/src/widget/custom_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "LA PLAZA",
              ),
            ),
          ),
          SearchField(),
          Text(
            "Todos los productos",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          ProductGrid()
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  static String routeName = "/home";
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* final productService = Provider.of<ProductoService>(context, listen: false);

    productService.getData(); */
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      body: Body(),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductoService>(context);

    productService.getData();

    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: productService.datosProductos.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              crossAxisSpacing: 10.0,
              mainAxisExtent: 300,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            return VerticalProductCard(productService.datosProductos[index]);
          }),
    );
  }
}
