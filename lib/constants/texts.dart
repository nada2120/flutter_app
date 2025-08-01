import 'package:flutter/material.dart';
import 'package:team_project/categoryPage/presentation/screens/category_page.dart';

import '../favoritePage/presentation/screens/favorite_page.dart';
import '../homePage/presentation/screens/home_page.dart';
import '../screens/profile_page.dart';
import '../searchPage/presentation/screens/search_page.dart';

const createAccountScreen = '/create_account';
const homeScreen = '/home_page';
const cartScreen = '/my_cart';
const productDetailsScreen = '/product_details';
const navigationBarMenu = '/navigation_bar';
const favoritePage = '/favorite_page';
const searchPage = '/search_page';
const categoryPage = '/category_page';
const categoryType = '/category_type';


const items = [
  'Price: high to low',
  'Price: low to high',
  'Name: A to Z',
  'Name: Z to A'
];

const stars = [
  '1',
  '2',
  '3',
  '4',
  '5'
];

const discountList = [
  '50% off',
  '40% off',
  '30% off',
  '25% off',

];

const buttons = [
  'Reset',
  'Apply'
];

int currentIndex = 0;
final List<Widget> pages = [
  HomePage() ,
  SearchPage(),
  FavoritePage(),
  CategoryPage()
];

   const List <String> PictureSocialMedia = [
    'assets/images/google.svg',
    'assets/images/apple.svg',
    'assets/images/facebook.svg'
  ];

   const List <Map<String, dynamic>> featured = [
    {
      'image' : 'assets/images/featured.png',
      'title' : '50-40% OFF',
      'subtitle' : 'Now in (product) All colours '
    }
  ];
   const List<Map<String, dynamic>> categories = [
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

  // List<Product> products = [
  //   Product(
  //     image: 'assets/images/products/Black Winter.png',
  //     name: 'Black Winter',
  //     details: 'Warm black winter jacket with cotton padding, perfect for cold weather.',
  //     price: 499,
  //   ),
  //    Product(
  //     image: 'assets/images/products/Mens Starry.png',
  //     name: 'Mens Starry',
  //     details: 'Men\'s navy blue shirt with starry sky print, 100% breathable cotton.',
  //     price: 399,
  //   ),
  //    Product(
  //     image: 'assets/images/products/Black Dress.png',
  //     name: 'Black Dress',
  //     details: 'Elegant black evening dress with golden chain straps and a stylish cut.',
  //     price: 2000,
  //   ),
  //    Product(
  //     image: 'assets/images/products/Pink Embroide.png',
  //     name: 'Pink Embroide',
  //     details: 'Soft pink maxi dress with floral embroidery, ideal for summer outings.',
  //     price: 1900,
  //   ),
  //    Product(
  //     image: 'assets/images/products/Flare Dress.png',
  //     name: 'Flare Dress',
  //     details: 'Tiered midi dress in black and rust orange floral print, flowy and chic.',
  //     price: 1999,
  //   ),
  //   Product(
  //     image: 'assets/images/products/NIke Sneakers.png',
  //     name: 'NIke Sneakers',
  //     details: 'Nike Air Jordan 1 Low in mystic black, sleek design with great comfort.',
  //     price: 1900,
  //   ),
  //   Product(
  //     image: 'assets/images/products/Jordan Stay.png',
  //     name: 'Jordan Stay',
  //     details: 'Inspired by the Air Jordan 12, this sneaker combines classic and modern vibes.',
  //     price: 4999,
  //   ),
  //   Product(
  //     image: 'assets/images/products/denim dress.png',
  //     name: 'denim dress',
  //     details: 'Casual blue denim dress with printed design, suitable for everyday wear.',
  //     price: 999,
  //   ),
  //   Product(
  //     image: 'assets/images/products/Black Jacket 12.png',
  //     name: 'Black Jacket 12',
  //     details: 'Stylish black winter jacket with soft lining and a fitted hood for warmth.',
  //     price: 2999,
  //   ),
  // ];

const List<String> sizes = [
  '160×120',
  '180×200',
  '200×200',
  '220×220',
];