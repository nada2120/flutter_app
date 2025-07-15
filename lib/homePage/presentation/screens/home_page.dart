import 'package:flutter/material.dart';
import '../../../common/shopping_cart.dart';
import '../widgets/categories.dart';
import '../widgets/picture_feature.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF83758),
        centerTitle: true,
        title: Text('E-commerce',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          ShoppingCart(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Featured',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            const SizedBox(height: 16,),
              ///Picture of Featured
             PictureOfFeatured(),
              const SizedBox(height: 16,),
              ///Categories
              Text('Categories',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              const SizedBox(height: 16,),
              Categories(),
              const SizedBox(height: 16,),
              ///All Product
              Text('All Products',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              const SizedBox(height: 16,),
              ProductCard()
            ],
          ),
        ),
      ),
    );
  }
}











