import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/modules/card_page/views/card_page_view.dart';
import 'package:task/app/modules/home/views/bottom_nav_item/bottom_nav_item.dart';

import '../../../data/config/app_color.dart';
import '../../../data/icons/bottom_nav_bar_icons.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          // controller.pageViewController.
          print('page index:: $index');
        },
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CardPageView(),
          Text('data'),
          Text('data'),
          Text('data'),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(icon: Bottom_nav_bar.home, title: 'Home', color: AppColor().itemColor,),
              BottomNavItem(icon: Bottom_nav_bar.offer, title: 'Offer', color: AppColor().itemColor,),
              BottomNavItem(icon: Bottom_nav_bar.offer, title: 'Offer', color: Colors.white,),
              BottomNavItem(icon: Bottom_nav_bar.card, title: 'Card', color: AppColor().appColor,),
              BottomNavItem(icon: Bottom_nav_bar.profile, title: 'Profile', color: AppColor().itemColor,),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff2DBC77),
        child: Icon(Bottom_nav_bar.scan),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
