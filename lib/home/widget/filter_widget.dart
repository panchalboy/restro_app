import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/home/controller/product_list_controller.dart';

// ignore: must_be_immutable
class FilterWidget extends StatelessWidget {
  FilterWidget({super.key});
  ProductListContoller contoller = Get.find<ProductListContoller>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          child: const Center(child: Icon(Icons.sort)),
        ),
        GetBuilder(
            init: contoller,
            builder: (controller) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: Get.width * 0.7,
                  child: ListView.builder(
                      itemCount: contoller.filter.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        final item = contoller.filter[i];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: Center(child: Text(item)),
                        );
                      }),
                )),
      ],
    );
  }
}
