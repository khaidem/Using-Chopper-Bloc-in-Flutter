import 'package:chopper/chopper.dart';
import 'package:chopper_app/chopper__example_module/product/data/model/product.model.dart';
import 'package:chopper_app/chopper__example_module/service/chopper_client.dart';
import 'package:flutter/material.dart';
import '../../chopper__example_module/service/chopper_services.dart/api_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<Response<List<ProductModel>>>(
        future: chopper.getService<APIService>().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.body!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data!.body![index].title),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
