import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/screens/app_router.dart';
import 'package:team_project/searchPage/presentation/manager/search_cubit.dart';
import 'api/bloc/product_cubit.dart';
import 'api/repository/product_repository.dart';
import 'api/services/api_service.dart';
import 'homePage/presentation/manager/bloc/cart_bloc.dart';
import 'favoritePage/presentation/manager/favorite_cubit.dart';
import 'constants/texts.dart';

void main() {

  final dio = Dio();
  final apiService = ApiService(dio);
  final repository = ProductRepository(apiService);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final ProductRepository repository;
  final AppRouter appRouter = AppRouter();

  MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (_) => ProductCubit(repository)..loadProducts(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<CartBloc>(
                  create: (_) => CartBloc(state.products),
                ),
                BlocProvider<FavoriteCubit>(
                  create: (_) => FavoriteCubit(),
                ),
                BlocProvider<SearchCubit>(
                    create: (_) => SearchCubit(state.products)
                )
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: navigationBarMenu,
                onGenerateRoute: appRouter.generateRoute,
              ),
            );
          } else if (state is ProductLoading) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          } else {
            return const MaterialApp(
              home: Scaffold(
                body: Center(child: Text('Failed to load products')),
              ),
            );
          }
        },
      ),
    );
  }
}