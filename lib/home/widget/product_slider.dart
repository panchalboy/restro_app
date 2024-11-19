import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/custom_buttomsheet.dart';
import 'package:restaurant_app/home/controller/product_list_controller.dart';
import 'package:restaurant_app/home/widget/slider_indicatore.dart';
import 'package:restaurant_app/product_details/view/product_details.dart';

// ignore: must_be_immutable
class ProductSlider extends StatelessWidget {
  ProductSlider({super.key});
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
        builder: (controller) {
          return Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                      height: 300.0,
                      //autoPlayCurve: Curves.bounceInOut,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        controller.onChangeIndex(index);
                      }),
                  items: contoller.productListModel.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () => openButtomSheet(context, i),
                          child: Stack(
                              fit: StackFit.loose,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                    width: Get.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomRight,
                                        colors: <Color>[
                                          Color.fromARGB(255, 161, 204, 241),
                                          Color.fromARGB(255, 221, 201, 243),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            // transform:
                                            //     Matrix4.translationValues(
                                            //         0, -10, 0),
                                            child: Image.asset(
                                              i.productImage!,
                                              height: 200,
                                              width: 200,
                                              // fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              width: Get.width * 0.5,
                                              child: Text(
                                                i.prodDiscription!,
                                                style: const TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.black,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "\$${i.price}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ]),
                        );
                      },
                    );
                  }).toList()),
              const SizedBox(
                height: 10,
              ),
              SliderIndicater(
                currentIndex: controller.sliderCurrentIndex,
              ),
            ],
          );
        });
  }
}
