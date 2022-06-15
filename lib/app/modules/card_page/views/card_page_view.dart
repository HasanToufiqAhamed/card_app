import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task/app/data/config/app_color.dart';

import '../../../../domain/core/model/card/card.model.dart';
import '../controllers/card_page_controller.dart';

class CardPageView extends GetView<CardPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text(
              'Card',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
            toolbarHeight: AppBar().preferredSize.height * 1.5,
            actions: [
              Row(
                children: [
                  Container(
                    height: 34,
                    width: 34,
                    decoration: BoxDecoration(
                        color: AppColor().appColor,
                        borderRadius: BorderRadius.circular(1000)),
                    child: Icon(CupertinoIcons.clear),
                  ),
                  const SizedBox(width: 20),
                ],
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            child: Image.asset('assets/image/img.png'),
                            color: AppColor().appColor,
                          ),
                        ),
                        Positioned(
                          top: 17,
                          right: 17,
                          left: 17,
                          child: Text(
                            'Regular Card',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Text(
                          '3567 0070 0003 3256 2022',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        Positioned(
                          bottom: 17,
                          right: 17,
                          left: 17,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Softcent',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'PayBack',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 30,
                      bottom: 15,
                    ),
                    child: Text(
                      'Recent Transaction',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xff040415),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Obx(
                    () {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.cardList.length,
                        itemBuilder: (context, index) {
                          CardModel card = controller.cardList[index];
                          print(card.shopLogo);
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7.0),
                                      child: SizedBox(
                                        height: 34,
                                        width: 34,
                                        child: CachedNetworkImage(
                                          height: 34,
                                          width: 34,
                                          imageUrl: card.shopLogo,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                card.shopName,
                                                style: const TextStyle(
                                                  color: Color(0xff1E1E2D),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                card.timestamp,
                                                style: TextStyle(
                                                  color: AppColor().itemColor,
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 9),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  card.paymentType=='Digital Payment'? Image.asset('assets/image/pm2.png') : Image.asset('assets/image/pm1.png'),
                                                  Text(
                                                    'Trans ID : ${card.transactionId}',
                                                    style: TextStyle(
                                                      color: AppColor().itemColor,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '-৳ ',
                                                    style: TextStyle(
                                                      color:
                                                          AppColor().itemColor,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${card.amountSend}',
                                                    style: TextStyle(
                                                      color: Color(0xffF15223),
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                card.paymentType,
                                                style: TextStyle(
                                                  color: AppColor().itemColor,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '-৳ ',
                                                    style: TextStyle(
                                                      color:
                                                          AppColor().itemColor,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${card.amountRecieved}',
                                                    style: TextStyle(
                                                      color:
                                                          AppColor().itemColor,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(
                                  height: 1,
                                  color:
                                      const Color(0xff040415).withOpacity(0.12),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
