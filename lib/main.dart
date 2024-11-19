import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ScooDel',
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoutes,
      initialRoute: AppRoutes.PRODUCT_LIST_SCREEN,
    );
  }
}
