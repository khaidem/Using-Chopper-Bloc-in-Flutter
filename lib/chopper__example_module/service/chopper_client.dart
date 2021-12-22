import 'package:chopper_app/chopper__example_module/product/data/model/product.model.dart';

import './chopper_services.dart/api_service.dart';
import './generic_json_convertor.dart';
import 'package:chopper/chopper.dart';

final chopper = ChopperClient(
    baseUrl: "https://fakestoreapi.com/",
    services: [
      APIService.create(),
    ],
    converter: GenericJsonConvertor({
      ProductModel: (jsonDate) => ProductModel.fromJson(jsonDate),
    }),
    errorConverter: const JsonConverter(),
    interceptors: [
      HttpLoggingInterceptor(),
    ]);
