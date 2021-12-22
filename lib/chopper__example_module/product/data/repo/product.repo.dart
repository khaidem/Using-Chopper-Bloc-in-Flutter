import 'package:chopper_app/chopper__example_module/core/error/error_response.exception.dart';
import 'package:chopper_app/chopper__example_module/product/data/model/product.model.dart';
import '../../../service/chopper_services.dart/api_service.dart';

class ProductRepo {
  ProductRepo({required this.service});

  final APIService service;

  Future<List<ProductModel>?> getProducts() async {
    final response = await service.getProducts();

    if (!response.isSuccessful) {
      final error = response.error;
      final statusCode = response.statusCode.toString();

      throw ErrorResponseException(
        statusCode: statusCode,
        message: error.toString(),
      );
    }
    final product = response.body;
    return product;
  }
}
