// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:chopper_app/chopper__example_module/product/data/logic/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductLoaderWidget extends StatefulWidget {
  ProductLoaderWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _ProductLoaderWidgetState createState() => _ProductLoaderWidgetState();
}

class _ProductLoaderWidgetState extends State<ProductLoaderWidget> {
  //Called when this object is inserted into the tree.
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    final productCubit = context.watch<ProductCubit>();
    final productState = productCubit.state;
    final status = productState.status;

    switch (status) {
      case ProductStatus.initial:
        return const Center(child: Icon(Icons.remember_me_rounded));
      case ProductStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case ProductStatus.loaded:
        return widget.child;

      case ProductStatus.error:
        return const Center(child: Icon(Icons.error_outline_rounded));
    }
  }
}
