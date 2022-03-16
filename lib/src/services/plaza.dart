import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:kubo_test/src/models/products.dart';

import '../../constant.dart';

class ProductoService with ChangeNotifier {
  List<Datum> datosProductos = [];
  final _url = Uri.parse(URL);

  Future getData() async {
    try {
      var response = await http.get(_url);

      if (response.statusCode == 200) {
        Map<String, dynamic> productData = convert.jsonDecode(response.body);

        var dataService = Products.fromMap(productData);
        datosProductos = dataService.data!;
        notifyListeners();
        return datosProductos;
      }
    } catch (e) {
      print(e);
    }
  }
}
