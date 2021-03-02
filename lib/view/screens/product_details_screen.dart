import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/model/cart_model.dart';
import 'package:shopin/model/product_model.dart';
import 'package:shopin/util/color_converter.dart';
import 'package:shopin/view/screens/three_main_screens/control_screen.dart';
import 'package:shopin/view/widgets/back_button_widget.dart';
import 'package:shopin/view/widgets/custom_button_widget.dart';
import 'package:shopin/view/widgets/custom_text_widget.dart';
import 'package:shopin/view_model/cart_view_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModel;

  ProductDetailsScreen({this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // This Container contains the product image and the add to cart button
            Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  imageShadow,
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .4,
                    width: MediaQuery.of(context).size.width,
                    child: Hero(
                      tag: productModel.productImage,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: NetworkImage(productModel.productImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: FloatingActionButton(
                      mini: true,
                      onPressed: () {},
                      elevation: 6,
                      backgroundColor: purpleColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * .05,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.width * .12,
                    left: MediaQuery.of(context).size.width * .05,
                    child: BackButtonWidget(
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
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .05,
                  ),
                  child: CustomTextWidget(
                    text: productModel.productName,
                    fontSize: 26,
                  ),
                ),
                // Contains Price and company row
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            CustomTextWidget(
                              text: "by",
                              fontSize: 18,
                              textColor: Colors.grey,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .005,
                            ),
                            CustomTextWidget(
                              text: productModel.productCompany,
                              fontSize: 18,
                              textColor: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                      CustomTextWidget(
                        text: "\$" + productModel.productPrice,
                        textColor: purpleColor,
                        fontSize: 20,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .025,
                ),
                //Column contains Size
                (productModel.productSize.isEmpty)
                    ? Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                        ),
                        child: CustomTextWidget(
                          text: "Size:",
                          fontSize: 18,
                        ),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .05,
                            ),
                            child: CustomTextWidget(
                              text: "Size:",
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .06,
                            child: _dynamicSizeTextView(),
                          ),
                        ],
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .015,
                ),
                // Column contains colors
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                      ),
                      child: CustomTextWidget(
                        text: "Color:",
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .045,
                      child: _colorListView(),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .015,
                ),
                //Contains the expandable panel that contains the overview
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * .01,
                    left: MediaQuery.of(context).size.width * .05,
                  ),
                  child: ExpandablePanel(
                    header: CustomTextWidget(
                      text: "Overview",
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                    collapsed: Container(
                      child: CustomTextWidget(
                        text: productModel.productDescription,
                        fontSize: 14,
                        maxLines: 3,
                      ),
                    ),
                    expanded: Container(
                      child: CustomTextWidget(
                        text: productModel.productDescription,
                        fontSize: 14,
                        maxLines: 100,
                      ),
                    ),
                    // ignore: deprecated_member_use
                    iconColor: purpleColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .05,
                    right: MediaQuery.of(context).size.width * .05,
                    bottom: MediaQuery.of(context).size.width * .05,
                  ),
                  child: GetBuilder<CartViewModel>(
                    init: Get.find(),
                    builder: (controller) => CustomButtonWidget(
                      buttonText: "ADD TO CART",
                      onPressed: (){
                        controller.addProduct(
                          CartModel(
                            productImage: productModel.productImage,
                            productName: productModel.productName,
                            productPrice: productModel.productPrice,
                            productQuantity: 1,
                            productId: productModel.productId,
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dynamicSizeTextView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productModel.productSize.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * .01,
            left: MediaQuery.of(context).size.width * .05,
          ),
          child: (productModel.productSize[index].length > 2)
              ? (productModel.productSize[index].length > 18)
                  ? Container(
                      width: MediaQuery.of(context).size.width * .5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey.shade300, width: 2.0),
                      ),
                      child: CustomTextWidget(
                        alignment: Alignment.center,
                        text: productModel.productSize[index],
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width * .35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey.shade300, width: 2.0),
                      ),
                      child: CustomTextWidget(
                        alignment: Alignment.center,
                        text: productModel.productSize[index],
                      ),
                    )
              : Container(
                  width: MediaQuery.of(context).size.width * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2.0,
                    ),
                  ),
                  child: CustomTextWidget(
                    alignment: Alignment.center,
                    text: productModel.productSize[index],
                  ),
                ),
        );
      },
    );
  }

  Widget _colorListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productModel.productColor.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * .01,
            left: MediaQuery.of(context).size.width * .05,
          ),
          child: Container(
            width: MediaQuery.of(context).size.height * .045,
            height: MediaQuery.of(context).size.height * .05,
            decoration: BoxDecoration(
              color: HexColor.fromHex(productModel.productColor[index]),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.black26,
                width: 2.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
