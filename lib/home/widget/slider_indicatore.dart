import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/home/controller/product_list_controller.dart';

// ignore: must_be_immutable
class SliderIndicater extends StatelessWidget {
  int? currentIndex;
  SliderIndicater({super.key, this.currentIndex = 0});
  ProductListContoller contoller = Get.find<ProductListContoller>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: contoller,
        builder: (contoller) => SizedBox(
              height: 15,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: contoller.productListModel.length,
                itemBuilder: (context, index) {
                  final length = contoller.productListModel.length;
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == index
                                ? Colors.black
                                : Colors.grey[300],
                          ),
                          height: 5,
                          width: 200 / length));
                },
              ),
            ));
  }
}
