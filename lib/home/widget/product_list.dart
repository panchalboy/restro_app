import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/custom_buttomsheet.dart';
import 'package:restaurant_app/home/controller/product_list_controller.dart';
import 'package:restaurant_app/product_details/view/product_details.dart';

// ignore: must_be_immutable
class ProductList extends StatelessWidget {
  ProductList({super.key});
  ProductListContoller contoller = Get.find<ProductListContoller>();
  openButtomSheet(context, item) {
    showCommonBottomSheet(
        isScrollControlled: true,
        context: context,
        child: DraggableScrollableSheet(
            initialChildSize: 0.90,
            minChildSize: 0.90,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return ProductDetailsScreen(
                item: item,
              );
            }),
        isDismissible: false);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: contoller,
        builder: (contoller) => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: contoller.productListModel.length,
              itemBuilder: (context, index) {
                final item = contoller.productListModel[index];
                return GestureDetector(
                  onTap: () => openButtomSheet(context, item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Image.asset(
                          item.productImage!,
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name!,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey[300],
                                  ),
                                  child: Center(
                                      child: Text(
                                    "\$${item.price}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Text(
                                  "${item.productNutrition!.kcal!} Kcal",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ));
  }
}
