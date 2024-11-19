import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/cart/view/cart_screen.dart';
import 'package:restaurant_app/core/custom_buttomsheet.dart';
import 'package:restaurant_app/home/controller/product_list_controller.dart';
import 'package:restaurant_app/home/model/product_list_model.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatelessWidget {
  ProductListModel? item;
  ProductDetailsScreen({super.key, this.item});
  ProductListContoller contoller = Get.find<ProductListContoller>();

  // void _showToast(BuildContext context, item) {
  //   final scaffold = ScaffoldMessenger.of(context);
  //   scaffold.showSnackBar(
  //     SnackBar(
  //       content: const Text('Added to favorite'),
  //       action: SnackBarAction(
  //           label: 'UNDO',
  //           onPressed: () {
  //             Get.back();

  //             openButtomSheet(scaffold, item);
  //           }),
  //     ),
  //   );
  // }

  openButtomSheet(context, item) {
    showCommonBottomSheet(
        isScrollControlled: true,
        context: context,
        child: DraggableScrollableSheet(
            initialChildSize: 0.90,
            minChildSize: 0.90,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return CartScreen(
                item: item,
              );
            }),
        isDismissible: false);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: contoller,
        builder: (contoller) => SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        item!.productImage!,
                        height: 300,
                        width: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      item!.name!,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      item!.productFullDic!,
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${item!.productNutrition!.kcal}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Kcal",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${item!.productNutrition!.weight}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "grams",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${item!.productNutrition!.proteins}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "proteins",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${item!.productNutrition!.fats}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "fats",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${item!.productNutrition!.cabs}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "cabs",
                                style: TextStyle(color: Colors.grey.shade200),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add in poke",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          weight: 50,
                          size: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 50,
                            width: Get.width * 0.40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      item!.qty == 1
                                          ? null
                                          : contoller.decrementQty(item);
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: item!.qty == 1
                                          ? Colors.grey
                                          : Colors.black,
                                    )),
                                Text(
                                  "${item!.qty}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      contoller.incrementQty(item);
                                    },
                                    child: const Icon(Icons.add))
                              ],
                            )),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            //_showToast(context, item);
                            openButtomSheet(context, item);
                          },
                          child: Container(
                              height: 50,
                              width: Get.width * 0.50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black87,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    "Add to cart",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "\$${item!.totalPrice!.toStringAsFixed(2)}",
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
