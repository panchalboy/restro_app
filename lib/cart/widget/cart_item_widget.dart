import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/home/controller/product_list_controller.dart';
import 'package:restaurant_app/home/model/product_list_model.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  ProductListModel? item;
  CartItem({super.key, this.item});
  ProductListContoller contoller = Get.find<ProductListContoller>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: contoller,
        builder: (contoller) => Row(
              children: [
                Image.asset(
                  item!.productImage!,
                  height: 80,
                  width: 80,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item!.name!,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "\$${item!.totalPrice!.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => contoller.decrementQty(item),
                          child: Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            child: Center(
                                child: Icon(
                              item!.qty == 1 ? Icons.delete : Icons.remove,
                              color: item!.qty == 1 ? Colors.red : Colors.black,
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${item!.qty!}",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () => contoller.incrementQty(item),
                          child: Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            child: const Center(child: Icon(Icons.add)),
                          ),
                        ),
                      ],
                    )
                    // Text(item!.name!),
                  ],
                ),
              ],
            ));
  }
}
