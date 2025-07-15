import 'package:team_project/models/product_model.dart';

class NTexts {

  static const List <String> PictureSocialMedia = [
    'assets/images/google.svg',
    'assets/images/apple.svg',
    'assets/images/facebook.svg'
  ];

  static const List <Map<String, dynamic>> featured = [
    {
      'image' : 'assets/images/featured.png',
      'title' : '50-40% OFF',
      'subtitle' : 'Now in (product) All colours '
    }
  ];
  static const List<Map<String, dynamic>> categories = [
    {
      'image' : 'assets/images/categories/beauty.png',
      'title' : 'Beauty'
    },
    {
      'image' : 'assets/images/categories/fashion.png',
      'title' : 'Fashion'
    },{
      'image' : 'assets/images/categories/kids.png',
      'title' : 'Kids'
    },{
      'image' : 'assets/images/categories/mens.png',
      'title' : 'Mens'
    },{
      'image' : 'assets/images/categories/womens.png',
      'title' : 'Womens'
    },
  ];

  static List<Product> products = [
    Product(
        image: 'assets/images/products/Black Winter.png',
        name: 'Black Winter',
        details: 'Autumn And Winter Casual cotton-padded jacket...',
        price: 499
    ),
    Product(
        image : 'assets/images/products/Mens Starry.png',
        name : 'Mens Starry',
        details : 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
        price : 399
    ),
    Product(
        image : 'assets/images/products/Black Dress.png',
        name : 'Black Dress',
        details : 'Solid Black Dress for Women, Sexy Chain Shorts Ladi...',
        price : 2000
    ),
    Product(
        image : 'assets/images/products/Pink Embroide.png',
        name : 'Pink Embroide',
        details : 'EARTHEN Rose Pink Embroidered Tiered Max...',
        price : 1900
    ),
    Product(
        image : 'assets/images/products/Flare Dress.png',
        name : 'Flare Dress',
        details : 'Antheaa Black & Rust Orange Floral Print Tiered Midi F...',
        price : 1999
    ),
    Product(
        image : 'assets/images/products/NIke Sneakers.png',
        name : 'NIke Sneakers',
        details : 'Nike Air Jordan Retro 1 Low Mystic Black',
        price : 1900
    ),
    Product(
        image : 'assets/images/products/Jordan Stay.png',
        name : 'Jordan Stay',
        details : "The classic Air Jordan 12 to create a shoe that's fres",
        price : 4999
    ),
    Product(
        image : 'assets/images/products/denim dress.png',
        name : 'denim dress',
        details : 'Blue cotton denim dress Look 2 Printed cotton dr...',
        price : 999
    ),
    Product(
        image : 'assets/images/products/Black Jacket 12.png',
        name : 'Black Jacket 12',
        details : 'This warm and comfortable jacket is great for learni...',
        price : 2999
    ),
  ];
}