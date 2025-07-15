import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:team_project/homePage/presentation/manager/bloc/cart_bloc.dart';
import 'package:team_project/screens/app_router.dart';

import 'models/product_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox<Product>('products');

  runApp(
    MyApp(appRouter: AppRouter()),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(),
      child: MaterialApp(
        key: UniqueKey(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}