import 'package:flutter/material.dart';
import 'package:shoppingo/Sellers/ShowSellers.dart';
import 'package:shoppingo/auth/Sign_up.dart';
import 'package:shoppingo/pages.dart';

import 'MyOrder/orders.dart';
import 'auth/Log_in.dart';
import 'clothes/ProductDetails/Product.dart';
import 'clothes/ShowClothes.dart';
import 'myPurchases/Purchases.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch:
              const Color.fromARGB(250, 203, 59, 62).asMaterialColor),
      home: Purchases(),
    );
  }
}

extension ToMaterialColor on Color {
  MaterialColor get asMaterialColor {
    Map<int, Color> shades = [
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900
    ].asMap().map(
        (key, value) => MapEntry(value, withOpacity(1 - (1 - (key + 1) / 10))));

    return MaterialColor(value, shades);
  }
}
