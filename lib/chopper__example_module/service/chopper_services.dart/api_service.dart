import 'package:chopper/chopper.dart';
import 'dart:async';
import 'package:chopper_app/chopper__example_module/product/data/model/product.model.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class APIService extends ChopperService {
  static APIService create([ChopperClient? client]) => _$APIService(client);

  @Get(path: '/products')
  Future<Response<List<ProductModel>>> getProducts();
}
