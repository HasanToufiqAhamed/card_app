import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task/app/data/config/app_color.dart';
import 'package:task/app/modules/card_page/controllers/card_page_controller.dart';
import 'package:task/initializer.dart';

import 'app/routes/app_pages.dart';
import 'config.dart';
import 'domain/repo_bindings/card.repository.bindings.dart';

void main() async {
  await Initializer.init();
  await 1.seconds.delay();

  runApp(
    GetMaterialApp(
      title: "task hasan",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: AppColor().appColor,
        scaffoldBackgroundColor: const Color(0xffFEFEFE),
        fontFamily: 'DMSans'
      ),
      initialBinding: InitialBindings(),
    ),
  );
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CardPageController(
        cardRepository: CardRepositoryBindings().repository,
      ),
    );
  }
}
