import 'package:flutter/material.dart';
import 'package:team_project/homePage/presentation/screens/home_page.dart';
import 'package:team_project/models/product_model.dart';
import '../MyCart/presentation/screens/my_cart.dart';
import '../constants/strings.dart';
import '../createAccountPage/presentation/screens/create_account.dart';
import '../productDetails/presentation/screens/product_details.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case createAccountScreen:
        return MaterialPageRoute(builder: (_) => CreateAccount());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomePage());
      case productDetailsScreen:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => ProductDetails(product: product));
      case cartScreen:
        return MaterialPageRoute(builder: (_) => MyCart());
    }
    return null;
  }
}