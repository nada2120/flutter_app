import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/api/bloc/product_cubit.dart';
import '../../../common/custom_appbar.dart';
import '../../../common/shopping_cart.dart';
import '../../../constants/colors.dart';
import '../widgets/categories.dart';
import '../widgets/picture_feature.dart';
import '../../../common/gridview_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'E-commerce',
        actions: const ShoppingCart(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Featured',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          const PictureOfFeatured(),
          const SizedBox(height: 16),
          // const Text(
          //   'Categories',
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          // ),
          //const SizedBox(height: 16),
          //const Categories(),
          const SizedBox(height: 16),
          const Text(
            'All Products',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
      if(state is ProductLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if(state is ProductLoaded) {
        return GridViewCard(
          products: state.products,
          imageBuilder: (product) =>
              Image.network(product.images[0], fit: BoxFit.fill),
        );
      } else if(state is ProductError) {
        return const Center(child: Text('Products loading failed'));
      } else {
        return const SizedBox();
      }
            },
          ),
        ],
      ),
    );
  }
}