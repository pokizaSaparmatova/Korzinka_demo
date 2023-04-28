// import 'package:dio/dio.dart';
// import 'package:korzinka_api/model.dart';
//
// class Api {
//   final _dio = Dio(
//       BaseOptions(baseUrl: "https://korzinka.uz/uz/catalog/t0p-10-products/"));
//
//   Api() {
//     _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
//       print(options.path);
//       print(options.data);
//       return handler.next(options);
//     }));
//   }
//
//   Future<List<Product>> getProducts() async {
//     final response = await _dio.post("products", options: Options());
//     print(response.data);
//     return (response.data as List).map((e) => Product.fromJson(e)).toList();
//   }
// }
