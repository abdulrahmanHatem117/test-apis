import 'package:flutter/material.dart';
import 'package:teat33/dio_helper.dart';

import '../../models/product_model.dart';

class GetDataFromJson extends StatefulWidget {
  const GetDataFromJson({super.key});

  @override
  State<GetDataFromJson> createState() => _GetDataFromJsonState();
}

List<ProductModel> products = [];
void getData() async {
  DioHelper.getData(url: '/api/v1/products').then((value) {
    print(value.data);
    value.data.forEach((element) {
      products.add(ProductModel.fromJson(element));
    });
  }).catchError((error) {
    print(error.toString());
  });
}

class _GetDataFromJsonState extends State<GetDataFromJson> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Data From Json'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Title: ${products[0].price ?? 'null'}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20),
            Text(
              ' Description : ${products[0].description}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                getData();
              },
              child: const Text('Get Data'),
            ),
          ],
        ),
      ),
    );
  }
}
