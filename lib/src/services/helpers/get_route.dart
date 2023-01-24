import 'package:get/route_manager.dart';

void push<T>(T page) => Get.to<T>(() => page);

void offAll<T>(T page) => Get.offAll<T>(() => page);

void back() => Get.back<void>();
