import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/api/models/product_model.dart';
import 'package:team_project/constants/colors.dart';
import 'package:team_project/constants/texts.dart';

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
  bool isSearched = false;

  TextEditingController searchTextController = TextEditingController();

  void addSearchList(String searchProduct) {
    setState(() {
      searchProducts = allProducts
          .where((product) =>
          product.title.toLowerCase().startsWith(searchProduct.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Search'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchTextController,
              cursorColor: primaryColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (searchProduct) {
                addSearchList(searchProduct);
                isSearched = true;
              },
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: SortButton()),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 47,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(color: Colors.grey.shade300),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: const Text(
                        'Filter',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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

                    return isSearched
                        ? GridViewCard(
                      products: searchProducts,
                      imageBuilder: (product) {
                        return Stack(
                          children: [
                            Image.network(
                              product.images[0],
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                            Positioned(
                              top: 4,
                              right: 3,
                              child: FavButton(product: product),
                            ),
                          ],
                        );
                      },
                    )
                        : const SizedBox();
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
    );
  }
}

class SortButton extends StatefulWidget {
  const SortButton({super.key});

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownButtonFormField<String>(
        value: selectedItem,
        onChanged: (value) {
          setState(() {
            selectedItem = value;
          });
        },
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: const TextStyle(fontSize: 14)),
          );
        }).toList(),
        decoration: InputDecoration(
          hintText: 'Sort',
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: const TextStyle(fontSize: 14, color: Colors.black),
        dropdownColor: Colors.white,
        iconEnabledColor: Colors.black,
      ),
    );
  }
}