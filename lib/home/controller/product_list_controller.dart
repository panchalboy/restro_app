import 'package:get/get.dart';
import 'package:restaurant_app/core/constants/images.dart';
import 'package:restaurant_app/home/model/product_list_model.dart';

class ProductListContoller extends GetxController {
  List filter = ["Salads", "Pizza", "Burger", "Chinese", "Beverages"];
  int sliderCurrentIndex = 0;
  int culteryQty = 1;
  onChangeIndex(index) {
    sliderCurrentIndex = index;
    update();
  }

  List<ProductListModel> productListModel = [
    ProductListModel(
      name: "Tomato",
      prodDiscription: "Juicy red tomatoes with a tangy flavor.",
      price: 1.00,
      totalPrice: 1.00,
      productFullDic:
          "Tomatoes are vibrant red, juicy fruits packed with vitamins, antioxidants, and a tangy sweetness perfect for salads, sauces, and snacks.",
      productImage: Images.tomoto,
      qty: 1,
      productNutrition: ProductNutrition(
        kcal: 325.0,
        weight: 150.0,
        proteins: 1.2,
        fats: 0.2,
        cabs: 3.5,
      ),
    ),
    ProductListModel(
      name: "Warm Soup",
      prodDiscription: "Warm, savory soup perfect for cold days.",
      price: 99.00,
      totalPrice: 99.00,
      productFullDic:
          "Warm, hearty soup made with fresh ingredients, offering comfort and nourishment, perfect for cozy evenings and chilly weather enjoyment.",
      productImage: Images.soup,
      qty: 1,
      productNutrition: ProductNutrition(
        kcal: 320.0,
        weight: 250.0,
        proteins: 3.5,
        fats: 1.0,
        cabs: 15.0,
      ),
    ),
    ProductListModel(
      name: "Spice Mortar",
      prodDiscription: "Grinds spices effortlessly for fresh flavorful dishes.",
      price: 99.34,
      totalPrice: 99.34,
      productFullDic:
          "A durable spice mortar designed for grinding herbs and spices effortlessly, enhancing the flavors and aromas of your favorite dishes.",
      productImage: Images.spiceMortar,
      qty: 1,
      productNutrition: ProductNutrition(
        kcal: 0.0, // Optional, as spice mortar itself doesn’t provide nutrition
        weight: 0.0,
        proteins: 0.0,
        fats: 0.0,
        cabs: 0.0,
      ),
    ),
    ProductListModel(
      name: "Sweet Bowl",
      prodDiscription: "Perfect bowl for serving delicious sweet treats.",
      price: 99.45,
      totalPrice: 99.45,
      productFullDic:
          "A charming sweet bowl ideal for serving desserts, candies, or treats, adding elegance and delight to your dining experience.",
      productImage: Images.sweetBowl,
      qty: 1,
      productNutrition: ProductNutrition(
        kcal: 435.0,
        weight: 200.0,
        proteins: 4.0,
        fats: 12.0,
        cabs: 72.0,
      ),
    ),
  ];

  incrementQty(item) {
    item.qty = item.qty + 1;

    item.totalPrice = item.qty * item.price;
    update();
  }

  decrementQty(item) {
    if (item.qty != 1) {
      item.qty = item.qty - 1;

      item.totalPrice = item.qty * item.price;
      update();
    } else {
      Get.back();
    }
  }

  incrementCulQty() {
    culteryQty++;
    update();
  }

  decrementCulQty() {
    if (culteryQty != 1) {
      culteryQty--;
      update();
    }
  }
}
