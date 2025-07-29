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
    searchProducts = allProducts.where((product) => product.title.toLowerCase().startsWith(searchProduct.toLowerCase())) .toList(); }); }

       @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: CustomAppbar(title: 'Search', leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, navigationBarMenu);
        },
        icon: Icon(Icons.arrow_back_ios, color: primaryColor,)
    ),),
    body: ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
          TextField(
            controller: searchTextController,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), ),
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: (searchProduct) {
              addSearchList(searchProduct);
              isSearched = true;
              }, ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Expanded(child: SortButton()),
              SizedBox(width: 10),
              Expanded(child: FilterButton()),
            ], ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  if (allProducts.isEmpty) {
                    allProducts = state.products; searchProducts = allProducts; }

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
);

} }




class SortButton extends StatefulWidget {
  const SortButton({super.key});

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  final LayerLink layerLink = LayerLink();
  OverlayEntry? overlayEntry;
  String? selected;

  void showOverlay() {
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 200,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 45),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: items.map((option) {
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    setState(() {
                      selected = option;
                    });
                    hideOverlay();
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void hideOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: GestureDetector(
        onTap: () {
          if (overlayEntry == null) {
            showOverlay();
          } else {
            hideOverlay();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child:Text(
            selected ?? 'Sort',
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}



class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

   @override
   Widget build(BuildContext context) {
     return SizedBox(
       height: 48,
       child: Container(
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(8),
           border: Border.all(color: Colors.grey.shade300), ),
         child: const Center(
           child: Text(
             'Filter',
             style: TextStyle(fontSize: 14, color: Colors.black),
           ), ),
       ), );
   }
}