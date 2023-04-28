import 'package:flutter/material.dart';
import 'model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductsScreen> {
  late Future<Datum> data;

  @override
  void initState() {
    super.initState();
    data = getProductsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Korzinka"),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF3F3F3),
        child: FutureBuilder<Datum>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                  children: List.generate(snapshot.data!.data!.products!.length, (index) {
                    var product = snapshot.data!.data!.products![index];
                    return Container(
                      height: 200,
                      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Stack(
                                children: [
                                  Image.network(height: 150, "${product.smallImageUrl}"),
                                  Positioned(
                                      child: Stack(
                                    children: [
                                      Positioned(
                                          bottom: 12,
                                          right: -25,
                                          child: Transform(
                                            transform: Matrix4.rotationZ(7.4),
                                            child: ClipOval(
                                              child: Container(width: 40, height: 60, color: Colors.amberAccent),
                                            ),
                                          )),
                                      Positioned(
                                        bottom: 18,
                                        right: 12,
                                        width: 40,
                                        height: 50,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            product.prices!.isDiscount == true
                                                ? Text("${product.prices!.oldPrice}",
                                                    style: const TextStyle(fontSize: 8, color: Colors.red, decoration: TextDecoration.lineThrough),
                                                    textAlign: TextAlign.end)
                                                : const SizedBox(),
                                            Text("${product.prices!.actualPrice}", style: const TextStyle(fontSize: 12, color: Colors.red)),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),

                                  // Positioned(
                                  //     right: 10,
                                  //     bottom: 10,
                                  //     width: 50,
                                  //     height: 40,
                                  //     child: Container(
                                  //       alignment: Alignment.center,
                                  //       decoration: const BoxDecoration(
                                  //           color: Colors.amberAccent,
                                  //           borderRadius: BorderRadius.only(
                                  //               topLeft: Radius.circular(40),
                                  //               bottomLeft: Radius.circular(10),
                                  //               topRight: Radius.circular(10),
                                  //               bottomRight: Radius.circular(40))),
                                  //       child: Column(
                                  //         mainAxisAlignment: MainAxisAlignment.center,
                                  //         children: [
                                  //           product.prices!.isDiscount == true
                                  //               ? Text("${product.prices!.oldPrice}",
                                  //                   style: const TextStyle(fontSize: 8, color: Colors.red, decoration: TextDecoration.lineThrough),
                                  //                   textAlign: TextAlign.end)
                                  //               : const SizedBox(),
                                  //           Text("${product.prices!.actualPrice}", style: const TextStyle(fontSize: 12, color: Colors.red)),
                                  //         ],
                                  //       ),
                                  //     )),
                                  product.prices!.isDiscount == true
                                      ? /*Positioned(
                                          bottom: 0,
                                          right: 0,
                                          width: 32,
                                          height: 22,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(40),
                                                    bottomLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10),
                                                    bottomRight: Radius.circular(40))),
                                            alignment: Alignment.center,
                                            child: Container(
                                              child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("${product.prices!.priceTagName}", style: const TextStyle(fontSize: 10, color: Colors.white)),
                                                  ]
                                              ),
                                            ),
                                          ))*/
                                      Positioned(
                                          bottom: 0,
                                          right: 0,
                                          width: 40,
                                          height: 40,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Transform(
                                                  transform: Matrix4.rotationZ(-0.6),
                                                  child: ClipOval(
                                                    child: Container(width: 32, height: 25, color: Colors.red),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 1.5,
                                                right: 1,
                                                child: Container(
                                                  // color: Colors.amberAccent,
                                                  // transformAlignment: Alignment.center,
                                                  padding: EdgeInsets.only(left: 10, bottom: 15),
                                                  child: Text("${product.prices!.priceTagName}",
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                              )
                                            ],
                                          ))
                                      : const SizedBox()
                                ],
                              )),
                          Expanded(
                            flex: 1,
                            child: Text("${snapshot.data?.data?.products![index].title}"),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 1,
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.black,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20),
                                                    bottomLeft: Radius.circular(8),
                                                    topRight: Radius.circular(8),
                                                    bottomRight: Radius.circular(20)))),
                                        onPressed: () {},
                                        child: const Text("Buy")),
                                  )),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
