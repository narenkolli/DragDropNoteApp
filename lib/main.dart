import 'package:drag_drop_flutter/app/data/storage/local_storage.dart';
import 'package:drag_drop_flutter/app/data/storage/local_storage_impl.dart';
import 'package:drag_drop_flutter/app/routes/app_pages.dart';
import 'package:drag_drop_flutter/app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Notes App",
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.INITIAL_PAGE,
      initialBinding: InitialBindings(),
      defaultTransition: Transition.fade,
    );
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LocalStorage>(LocalStorageImpl());
  }
}
