import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/api/bloc/product_cubit.dart';
import 'package:team_project/common/custom_appbar.dart';

import '../../../constants/texts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Categories",
       leading: Icon(Icons.search),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if(state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if(state is ProductLoaded) {
                final products = state.products;
                final categories = products.map((product) => product.category).toSet().toList();
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  scrollDirection: Axis.vertical,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context,
                            categoryType,
                            arguments: category.name
                        );
                      },
                      child: SizedBox(
                        height: 180,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                category.image,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              color: Colors.black.withValues(alpha: 0.4),
                            ),
                            Center(
                              child: Text(
                                category.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if(state is ProductError) {
                return const Center(child: Text('Products loading failed'));
              } else {
                return const SizedBox();
              }
            },
          )

      ),
    );
  }
}
