import 'package:flutter/material.dart';
import 'package:kubo_test/src/screen/home/home_screen.dart';
import 'package:kubo_test/src/services/plaza.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductoService())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
