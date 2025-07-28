import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:team_project/api/repository/product_repository.dart';
import '../models/product_model.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(ProductInitial()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      final box = await Hive.openBox<Product>("cart");

      if (box.isNotEmpty) {
        final loadedProducts = box.values.toList();
        emit(ProductLoaded(loadedProducts));
        return;
      }

      print("Fetching products from API...");
      final products = await repository.fetchProducts();
      print("Fetched: ${products.length} items");

      await box.clear();
      await box.addAll(products);

      emit(ProductLoaded(products));
    } catch (e) {
      print("Error occurred: $e");
      emit(ProductError('Products loading failed: $e'));
    }
  }
}