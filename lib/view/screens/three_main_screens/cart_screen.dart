import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/view/widgets/custom_button_widget.dart';
import 'package:shopin/view/widgets/custom_text_widget.dart';
import 'package:shopin/view_model/cart_view_model.dart';

import 'control_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => Scaffold(
        body: controller.cartModel.length == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      "lib/assets/images/undraw_empty_cart_co35.svg",
                      height: MediaQuery.of(context).size.height * .25,
                      width: MediaQuery.of(context).size.height * .25,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  CustomTextWidget(
                    text: "Your cart is empty",
                    fontSize: 30,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  CustomTextWidget(
                    text: "Let's add some items",
                    alignment: Alignment.center,
                    fontSize: 24,
                    textColor: Colors.black54,
                  )
                ],
              )
            : Column(
                children: [
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
                            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .005),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.favorite_border_outlined,
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                        ),
                        color: Colors.grey.shade100,
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
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * .2,
                                      MediaQuery.of(context).size.width * .05,
                                      MediaQuery.of(context).size.width * .02,
                                      MediaQuery.of(context).size.width * .05,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomTextWidget(
                                          text: controller.cartModel[index].productName,
                                          fontSize: 20,
                                        ),
                                        CustomTextWidget(
                                          text: '\$' + controller.cartModel[index].productPrice,
                                          textColor: purpleColor,
                                          fontSize: 18.0,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    border: Border.all(
                                                      color: Colors.black,
                                                    ),
                                                    color: Colors.white),
                                                height: MediaQuery.of(context).size.width * .08,
                                                width: MediaQuery.of(context).size.width * .08,
                                                child: Icon(
                                                  Icons.add,
                                                ),
                                              ),
                                              onTap: () {
                                                controller.increaseQuantity(index);
                                              },
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * .03,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                // border: Border.all(
                                                //   color: Colors.black,
                                                // ),
                                                color: purpleColor,
                                              ),
                                              height: MediaQuery.of(context).size.width * .08,
                                              width: MediaQuery.of(context).size.width * .08,
                                              child: CustomTextWidget(
                                                alignment: Alignment.center,
                                                text: controller.cartModel[index].productQuantity.toString(),
                                                textColor: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * .03,
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    border: Border.all(
                                                      color: Colors.black,
                                                    ),
                                                    color: Colors.white),
                                                height: MediaQuery.of(context).size.width * .08,
                                                width: MediaQuery.of(context).size.width * .08,
                                                padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context).size.width * .04,
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
                                      height: MediaQuery.of(context).size.height * .15,
                                      width: MediaQuery.of(context).size.width * .3,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        controller.cartModel[index].productImage,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
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
                            GetBuilder<CartViewModel>(
                              init: Get.find(),
                              builder: (controller) => CustomTextWidget(
                                text: "\$ ${(controller.totalPrice).toPrecision(2)}",
                                fontSize: 18,
                                textColor: purpleColor,
                              ),
                            )
                          ],
                        ),
                        CustomButtonWidget(
                          buttonText: "CHECKOUT",
                          onPressed: () {
                            // Get.to(CheckoutScreen());
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
