import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/cart/widget/cart_item_widget.dart';
import 'package:restaurant_app/cart/widget/cutlery_widget.dart';
import 'package:restaurant_app/core/constants/constants.dart';
import 'package:restaurant_app/home/controller/product_list_controller.dart';
import 'package:restaurant_app/home/model/product_list_model.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  ProductListModel? item;
  CartScreen({super.key, this.item});
  ProductListContoller contoller = Get.find<ProductListContoller>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder(
          init: contoller,
          builder: (contoller) => Container(
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
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    Constants.deliveryTimeTitle,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        Constants.deliveryAddress,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Change address",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CartItem(
                    item: item,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 0.2,
                  ),
                  CutleryWidget(
                    item: item,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 0.2,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Free delivery from \$30",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Text(
                        '\$0.00',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Payment methode",
                    style: TextStyle(color: Colors.grey),
                  ),
                  ListTile(
                    leading: Container(
                      height: 25,
                      width: 50,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.apple,
                              size: 15,
                            ),
                            Text(
                              "pay",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    title: const Text(
                      "Apple pay",
                      style: TextStyle(fontSize: 13),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black87,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Pay",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "24 min. \$${item!.totalPrice!.toStringAsFixed(2)}",
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      )),
                ],
              ))),
    );
  }
}
