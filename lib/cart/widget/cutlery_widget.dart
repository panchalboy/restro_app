import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constants/images.dart';
import 'package:restaurant_app/home/controller/product_list_controller.dart';
import 'package:restaurant_app/home/model/product_list_model.dart';

// ignore: must_be_immutable
class CutleryWidget extends StatelessWidget {
  ProductListModel? item;
  CutleryWidget({super.key, this.item});
  ProductListContoller contoller = Get.find<ProductListContoller>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: contoller,
        builder: (contoller) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  Images.cultery,
                  height: 35,
                  width: 35,
                ),
                const Text(
                  "Cultery",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => contoller.decrementCulQty(),
                      child: Container(
                        height: 35,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Center(
                            child: Icon(
                          Icons.remove,
                          color: contoller.culteryQty == 1
                              ? Colors.grey
                              : Colors.black,
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${contoller.culteryQty}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => contoller.incrementCulQty(),
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
              ],
            ),
          );
        });
  }
}
