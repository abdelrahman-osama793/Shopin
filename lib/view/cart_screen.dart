<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/view/widgets/custom_button_widget.dart';
import 'package:shopin/view/widgets/custom_text_widget.dart';

class CartScreen extends StatelessWidget {
  List<String> names = <String>[
    'Chair',
    'Chair',
    'Chair',
    'Chair',
    'Chair',
  ];

  List<String> image = <String>[
    'lib/assets/images/facebook.png',
    'lib/assets/images/facebook.png',
    'lib/assets/images/facebook.png',
    'lib/assets/images/facebook.png',
    'lib/assets/images/facebook.png',
  ];

  List<int> prices = <int>[
    200,
    500,
    100,
    1000,
    750,
  ];

=======
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/view/widgets/custom_button_widget.dart';
import 'package:shopin/view/widgets/custom_text_widget.dart';
import 'package:shopin/view_model/cart_view_model.dart';

import 'control_screen.dart';

class CartScreen extends StatelessWidget {
>>>>>>> parent of 454d4cc (UI edits, Delivery time UI, files rearrange)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
<<<<<<< HEAD
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .05,
              ),
              child: ListView.builder(
                itemCount: names.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * .04,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .18,
                          ),
                          height: MediaQuery.of(context).size.height * .18,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * .2,
                              MediaQuery.of(context).size.width * .05,
                              MediaQuery.of(context).size.width * .2,
                              MediaQuery.of(context).size.width * .05,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomTextWidget(
                                  text: names[index],
                                  fontSize: 20,
                                ),
                                CustomTextWidget(
                                  text: '\$' + prices[index].toString(),
                                  textColor: purpleColor,
                                  fontSize: 18.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          color: Colors.white),
                                      height:
                                          MediaQuery.of(context).size.width *
                                              .08,
                                      width: MediaQuery.of(context).size.width *
                                          .08,
                                      child: Icon(
                                        Icons.add,
                                      ),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                            color: Colors.white),
=======
          Container(
            height: MediaQuery.of(context).size.width * .3,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .05,
              top: MediaQuery.of(context).size.width * .12,
              right: MediaQuery.of(context).size.width * .05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: "YOUR CART",
                  fontSize: 30,
                  alignment: Alignment.center,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.height * .05,
                  child: RaisedButton(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .005),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.favorite,
                      size: MediaQuery.of(context).size.width * .05,
                    ),
                    elevation: 6.0,
                    color: Colors.white,
                    onPressed: () {
                      Get.off(
                        ControlScreen(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: Get.find(),
              builder: (controller) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                  color: Colors.grey.shade200,
                ),
                child: ListView.builder(
                  itemCount: controller.cartModel.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * .05,
                            MediaQuery.of(context).size.width * .02,
                            MediaQuery.of(context).size.width * .05,
                            MediaQuery.of(context).size.width * .04,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .16,
                            ),
                            height: MediaQuery.of(context).size.height * .16,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * .2,
                                MediaQuery.of(context).size.width * .05,
                                MediaQuery.of(context).size.width * .02,
                                MediaQuery.of(context).size.width * .05,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomTextWidget(
                                    text:
                                        controller.cartModel[index].productName,
                                    fontSize: 20,
                                  ),
                                  CustomTextWidget(
                                    text: '\$' +
                                        controller
                                            .cartModel[index].productPrice,
                                    textColor: purpleColor,
                                    fontSize: 18.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              color: Colors.white),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .08,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .08,
                                          child: Icon(
                                            Icons.add,
                                          ),
                                        ),
                                        onTap: () {
                                          controller.increaseQuantity(index);
                                        },
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .03,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          // border: Border.all(
                                          //   color: Colors.black,
                                          // ),
                                          color: purpleColor,
                                        ),
>>>>>>> parent of 454d4cc (UI edits, Delivery time UI, files rearrange)
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .08,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .08,
                                        child: CustomTextWidget(
                                          alignment: Alignment.center,
<<<<<<< HEAD
                                          text: '1',
                                        )),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          color: Colors.white),
                                      height:
                                          MediaQuery.of(context).size.width *
                                              .08,
                                      width: MediaQuery.of(context).size.width *
                                          .08,
                                      padding: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                .04,
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.minimize,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.width * .07,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [imageShadow]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              height: MediaQuery.of(context).size.height * .15,
                              width: MediaQuery.of(context).size.width * .3,
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'lib/assets/images/facebook.png',
=======
                                          text: controller
                                              .cartModel[index].productQuantity
                                              .toString(),
                                          textColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .03,
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              color: Colors.white),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .08,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .08,
                                          padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .04,
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.minimize,
                                          ),
                                        ),
                                        onTap: () {
                                          controller.decreaseQuantity(index);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.width * .03,
                          left: MediaQuery.of(context).size.width * .05,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                imageShadow,
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(
                                height:
                                    MediaQuery.of(context).size.height * .15,
                                width: MediaQuery.of(context).size.width * .3,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  controller.cartModel[index].productImage,
                                ),
>>>>>>> parent of 454d4cc (UI edits, Delivery time UI, files rearrange)
                              ),
                            ),
                          ),
                        ),
<<<<<<< HEAD
                      ),
                    ],
                  );
                },
=======
                      ],
                    );
                  },
                ),
>>>>>>> parent of 454d4cc (UI edits, Delivery time UI, files rearrange)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .05,
              vertical: MediaQuery.of(context).size.width * .03,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "Total",
                      fontSize: 20.0,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .02,
                    ),
<<<<<<< HEAD
                    CustomTextWidget(
                      text: "\$ 2550",
                      fontSize: 18,
                      textColor: purpleColor,
=======
                    GetBuilder<CartViewModel>(
                      init: Get.find(),
                      builder: (controller) => CustomTextWidget(
                        text: "\$ ${(controller.totalPrice).toPrecision(2)}",
                        fontSize: 18,
                        textColor: purpleColor,
                      ),
>>>>>>> parent of 454d4cc (UI edits, Delivery time UI, files rearrange)
                    )
                  ],
                ),
                CustomButtonWidget(
                  buttonText: "CHECKOUT",
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
