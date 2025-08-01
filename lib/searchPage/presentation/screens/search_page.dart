import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:team_project/api/models/product_model.dart';
import 'package:team_project/constants/colors.dart';
import 'package:team_project/constants/texts.dart';
import 'package:team_project/searchPage/presentation/manager/search_cubit.dart';

import '../../../common/custom_appbar.dart';
import '../../../common/fav_button.dart';
import '../../../common/gridview_card.dart';
import '../widgets/filter_button.dart';
import '../widgets/open_side_slider.dart';
import '../widgets/sort_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> allProducts = [];
  bool isSearched = false;
  TextEditingController searchTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Search',
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, navigationBarMenu);
          },
          icon: Icon(Icons.arrow_back_ios, color: primaryColor),
        ),
      ),
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
                suffixIcon: IconButton(
                  onPressed: () {
                    FilterSheetController.show(context);
                  },
                  icon: const Icon(Iconsax.filter_search)
                )
              ),
              onChanged: (searchProduct) {
                context.read<SearchCubit>().addSearchList(searchProduct);
                setState(() {
                  isSearched = searchProduct.isNotEmpty;
                });
              },
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Expanded(child: SortButton()),
                SizedBox(width: 8),
                Expanded(child: FilterButton()),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  final results = state.results;

                  if (isSearched && results.isEmpty) {
                    return const Center(child: Text('No products found'));
                  }

                  return isSearched
                      ? GridViewCard(
                    products: results,
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
                },
              ),
            ),
          ],
        ),
      ),


  );
  }
}



