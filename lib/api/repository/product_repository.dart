import 'package:team_project/api/models/product_model.dart';
import 'package:team_project/api/services/api_service.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository(this.apiService);

  Future<List<Product>> fetchProducts() async {
    return await apiService.getProduct();

  }
}