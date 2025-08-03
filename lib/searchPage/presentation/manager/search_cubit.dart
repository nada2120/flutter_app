import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:team_project/api/models/product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
   final List<Product> allProducts;
   String searchedWord = '';
  SearchCubit(this.allProducts) : super(const SearchState([]));

  void addSearchList(String searchProduct) {
    searchedWord =  searchProduct;
      final results = allProducts.where(
              (product) => product.title.toLowerCase().startsWith(searchProduct.toLowerCase())).toList();
      emit(SearchState(results));
}

   void sortProducts(String sortType) {
     List<Product> sortedList = searchedWord.isEmpty
         ? List<Product>.from(allProducts)
         : allProducts.where(
             (product) => product.title.toLowerCase().startsWith(searchedWord.toLowerCase())
     ).toList();

     if (sortType == 'Name: A to Z') {
       sortedList.sort((a, b) => a.title.compareTo(b.title));
     } else if (sortType == 'Name: Z to A') {
       sortedList.sort((a, b) => b.title.compareTo(a.title));
     } else if (sortType == "Price: high to low") {
       sortedList.sort((a, b) => b.price.compareTo(a.price));
     } else if (sortType == "Price: low to high") {
       sortedList.sort((a, b) => a.price.compareTo(b.price));
     }

     emit(SearchState(sortedList));
   }

   // bool isRange(double value, double minValue, double maxValue) {
   //    return value >= minValue && value <= maxValue;
   // }

   void filterProducts(double minPrice, double maxPrice, String category) {
     List<Product> filteredList = allProducts.where(
             (product) =>
         product.category.name == category &&
             product.price >= minPrice &&
             product.price <= maxPrice
     ).toList();

     emit(SearchState(filteredList));
   }

}
