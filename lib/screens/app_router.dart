import 'package:flutter/material.dart';
import 'package:team_project/categoryPage/presentation/screens/category_page.dart';
import 'package:team_project/homePage/presentation/screens/home_page.dart';
import 'package:team_project/screens/search_page.dart';
import '../MyCart/presentation/screens/my_cart.dart';
import '../api/models/product_model.dart';
import '../categoryPage/presentation/screens/category_type.dart';
import '../constants/texts.dart';
import '../createAccountPage/presentation/screens/create_account.dart';
import '../favoritePage/presentation/screens/favorite_page.dart';
import '../productDetails/presentation/screens/product_details.dart';
import 'navigation_bar.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case  navigationBarMenu:
        return MaterialPageRoute(builder: (_) => MyNavigationBar());
      case  favoritePage:
        return MaterialPageRoute(builder: (_) => FavoritePage());

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
      case searchPage:
        return MaterialPageRoute(builder: (_) => SearchPage());
      case categoryPage:
        return MaterialPageRoute(builder: (_) => CategoryPage());
      case categoryType:
        final type =settings.arguments as String;
        return MaterialPageRoute(builder: (_) => CategoryType(type: type));


    }
    return null;
  }
}