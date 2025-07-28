
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:team_project/api/models/product_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.escuelajs.co/api/v1")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/products')
  Future<List<Product>> getProduct ();
}