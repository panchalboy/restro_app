import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/constants/constants.dart';
import 'package:restaurant_app/home/controller/product_list_controller.dart';
import 'package:restaurant_app/home/widget/filter_widget.dart';
import 'package:restaurant_app/home/widget/product_list.dart';
import 'package:restaurant_app/home/widget/product_slider.dart';

// ignore: must_be_immutable
class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});
  ProductListContoller productListContoller = Get.put(ProductListContoller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        title: Container(
          width: 220,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          child: Center(
            child: Text(
              "${Constants.deliveryAddress} 24 min",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hits of the week",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                ProductSlider(),
                const SizedBox(
                  height: 20,
                ),
                FilterWidget(),
                const SizedBox(
                  height: 20,
                ),
                ProductList(),
              ],
            )),
      ),
    );
  }
}
