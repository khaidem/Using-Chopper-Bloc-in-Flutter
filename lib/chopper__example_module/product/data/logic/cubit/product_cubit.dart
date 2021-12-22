import 'package:bloc/bloc.dart';
import 'package:chopper_app/chopper__example_module/core/error/error_response.exception.dart';
import 'package:chopper_app/chopper__example_module/product/data/data.dart';
import 'package:chopper_app/chopper__example_module/product/data/model/product.model.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.repo})
      : super(const ProductState(status: ProductStatus.initial));

  final ProductRepo repo;

  Future<void> getProduct() async {
    if (_isBusy) return;
    emit(const ProductState(status: ProductStatus.loading));

    try {
      final product = await repo.getProducts();
      emit(ProductState(
        status: ProductStatus.loaded,
        products: product ?? [],
      ));
    } on ErrorResponseException catch (error) {
      emit(ProductState(
        status: ProductStatus.error,
        errorMessage: error.message,
      ));
    } catch (e) {
      final errorMessage = e.toString();
      emit(ProductState(
        status: ProductStatus.error,
        errorMessage: errorMessage,
      ));
    }
  }

  bool get _isBusy => state.status == ProductStatus.loading;
}
