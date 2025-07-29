import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/common/button_add.dart';
import 'package:team_project/common/custom_appbar.dart';

import '../../../api/bloc/product_cubit.dart';
import '../../../common/fav_button.dart';
import '../../../common/gridview_card.dart';

class CategoryType extends StatefulWidget {
  const CategoryType({super.key, required this.type});

  final String type;

  @override
  State<CategoryType> createState() => _CategoryTypeState();
}

class _CategoryTypeState extends State<CategoryType> {

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          title: widget.type,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)
          ),
      ),
      body: SingleChildScrollView(
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if(state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if(state is ProductLoaded) {
                final allProducts = state.products;
                final productsCategory = allProducts.where(
                    (product){
                      return product.category.name == widget.type;
                    }
                ).toList();
                return GridViewCard(
                  products: productsCategory,
                  imageBuilder: (product) {
                    return Stack(
                      children: [
                        Image.network(product.images[0], fit: BoxFit.fill, width: double.infinity,),
                        Positioned(
                            top: 4,
                            right: 3,
                            child: FavButton(product: product,)
                        )
                      ],
                    );
                  },
                  //extraWidget: ButtonAdd(product: ,),
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
