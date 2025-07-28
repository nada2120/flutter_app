import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/api/bloc/product_cubit.dart';
import '../../../common/container_button.dart';
import '../../../constants/texts.dart';

class Categories extends StatefulWidget {
  const Categories();

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  void initState() {
    super.initState();
    context.read<ProductCubit>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if(state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if(state is ProductLoaded) {
          final products = state.products;
          final categories = products.map((product) => product.category).toSet().toList();
          return SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ContainerButton(
                        sizeContainer: 80,
                        widget: Image.network(
                          products[index].images[0],
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    //Text( products.category),
                  ],
                );
              },
            ),
          );
        } else if(state is ProductError) {
          return const Center(child: Text('Products loading failed'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}





