import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/api/models/product_model.dart';
import 'package:team_project/constants/colors.dart';

import '../api/bloc/product_cubit.dart';
import '../common/custom_appbar.dart';
import '../common/fav_button.dart';
import '../common/gridview_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> allProducts = [];
  List<Product> searchProducts = [];

  TextEditingController searchTextController = TextEditingController();

  void addSearchList(String searchProduct) {
    setState(() {
      searchProducts = allProducts.where(
              (product) => product.title.toLowerCase().startsWith(searchProduct.toLowerCase())
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Search'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextController,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search)
                ),
                onChanged: (searchProduct) {
                  addSearchList(searchProduct);
                },
              ),
              SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductLoaded) {
                      if (allProducts.isEmpty) {
                        allProducts = state.products;
                        searchProducts = allProducts;
                      }

                      return GridViewCard(
                        products: searchProducts,
                        imageBuilder: (product) {
                          return Stack(
                            children: [
                              Image.network(product.images[0], fit: BoxFit.fill, width: double.infinity,),
                              Positioned(
                                  top: 4,
                                  right: 3,
                                  child: FavButton(product: product)
                              )
                            ],
                          );
                        },
                      );
                    } else if (state is ProductError) {
                      return const Center(child: Text('Products loading failed'));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
