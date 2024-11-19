import 'package:get/get.dart';
import 'package:restaurant_app/home/view/product_list_screen.dart';

class AppRoutes {
  // ignore: constant_identifier_names
  static const String PRODUCT_LIST_SCREEN = '/product_list_screen';
  // static const String PRODUCT_DETAILS_SCREEN = '/product_details_screen';
  // static const String CART_SCREEN = '/cart_screen';

  static List<GetPage> appRoutes = [
    GetPage(
      name: PRODUCT_LIST_SCREEN,
      page: () => ProductListScreen(),
    ),
    // GetPage(
    //   name: PRODUCT_DETAILS_SCREEN,
    //   page: () => ProductDetailsScreen(),
    // ),
    // GetPage(
    //   name: CART_SCREEN,
    //   page: () => CartScreen(),
    // ),
  ];
}
