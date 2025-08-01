import 'package:flutter/material.dart';
import 'package:team_project/common/container_button.dart';
import 'package:team_project/common/label_widget.dart';
import 'package:team_project/constants/colors.dart';
import '../../../api/models/product_model.dart';
import '../../../common/button_add.dart';
import '../../../common/fav_button.dart';
import '../../../common/size_button.dart';
import '../../../constants/texts.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                    widget.product.images[0],
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.fill
                ),
                Positioned(
                    left: 15,
                    top: 20,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, navigationBarMenu);
                        },
                        icon: Icon(Icons.close, size: 30,)
                    )
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.product.title,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      FavButton(product: widget.product),
                    ],
                  ),
              SizedBox(height: 4,),
              Text(
                '\$${widget.product.price}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
                  SizedBox(height: 8,),
                  Text(
                    widget.product.description,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 16,),
                  LabelWidget(
                    title: 'Size',
                    gap: 8,
                    widget: SizeButton(itemButtons: sizes)
                  ),
                  SizedBox(height: 16,),
                  LabelWidget(
                      title: 'Color',
                      gap: 8,
                      widget: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: List.generate(
                            colors.length,
                            (index) {
                              return GestureDetector(
                                onTap: (){
                                  setState((){
                                    selectedIndex = index;
                                  }) ;
                                },
                                child: buildColorButton(
                                  colors[index],
                                    selectedIndex == index
                                ),
                              );
                            }
                        ),
                      )
                  ),
                  SizedBox(height: 16,),
                  Center(child:
                  ButtonAdd(
                    product: widget.product,
                    addButtonText: "+ Add To Cart",
                    widthContainer: 150,
                    heightContainer: 75,
                    sizeIcon: 20,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




Widget buildColorButton (Color color, bool isSelected) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      ContainerButton(
        sizeContainer: 40,
        colorContainer: color,
        widget: SizedBox(),
      ),
      if(isSelected)
        Positioned(
          top: 4,
            left: 24,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              child: Icon(Icons.check_circle, color: primaryColor,),
            )
        )
    ],
  );
}