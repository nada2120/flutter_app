import 'package:flutter/material.dart';
import 'package:team_project/common/label_widget.dart';
import '../api/models/product_model.dart';
import '../constants/texts.dart';

class GridViewCard extends StatefulWidget {
  final List<Product> products;
  final Widget Function(Product product) imageBuilder;
  final Widget widget;

  const GridViewCard({
    super.key,
    required this.imageBuilder,
    Widget? widget,
    required this.products,
  }) : widget = widget ?? const SizedBox();

  @override
  State<GridViewCard> createState() => _GridViewCardState();
}

class _GridViewCardState extends State<GridViewCard> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.products.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final product = widget.products[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                productDetailsScreen,
                arguments: product,
              );
            },
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    child: widget.imageBuilder(product),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LabelWidget(
                      title: product.title,
                      widget: Text(
                        '\$${product.price}',
                        style: TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  widget
                ],
              ),
            )
          );
        }
    );
  }
}