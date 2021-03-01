import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shopin/constants.dart';
import 'file:///E:/FCI/Projects/shopin/lib/view/screens/product_details_screen.dart';
import 'package:shopin/view/widgets/custom_text_widget.dart';
import 'package:shopin/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: SpinKitWave(
                color: purpleColor,
                size: MediaQuery.of(context).size.height * .045,
              ),
            )
          : Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .07,
                  ),
                  child: Column(
                    children: [
                      //Contains the search bar
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .04,
                        ),
                        child: _searchTextFormField(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      //Contains the "Categories" text
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .04,
                        ),
                        child: CustomTextWidget(
                          text: "Categories",
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      // Container that contains the category list view
                      Container(
                        height: MediaQuery.of(context).size.height * .12,
                        child: _categoriesListView(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      //Contain the "Best seller" and "see all" row
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .04,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              text: "Best Selling",
                              fontSize: 18.0,
                            ),
                            CustomTextWidget(
                              text: "See All",
                              fontSize: 17.0,
                              textColor: purpleColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      //Container that contains the product list view
                      Container(
                        height: MediaQuery.of(context).size.height * .35,
                        child: _productsListView(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none, prefixIcon: Icon(Icons.search), hintText: "What would like to find?"),
      ),
    );
  }

  // Categories list view widget
  Widget _categoriesListView() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => ListView.builder(
        itemCount: controller.categoryModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * .01,
                right: MediaQuery.of(context).size.width * .02,
                bottom: MediaQuery.of(context).size.width * .01,
                left: MediaQuery.of(context).size.width * .04,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.width * .04,
                      left: MediaQuery.of(context).size.width * .01,
                      right: MediaQuery.of(context).size.width * .01,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: Colors.grey.shade200,
                    ),
                    height: MediaQuery.of(context).size.height * .075,
                    width: MediaQuery.of(context).size.height * .075,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.height * .05,
                      child: Image.network(
                        controller.categoryModel[index].categoryImage,
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .01,
                  ),
                  CustomTextWidget(
                    text: controller.categoryModel[index].categoryName,
                    textColor: Colors.black54,
                  )
                ],
              ));
        },
      ),
    );
  }

  // Products list view widget
  Widget _productsListView() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => ListView.builder(
        itemCount: controller.productModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * .01,
              right: MediaQuery.of(context).size.width * .02,
              bottom: MediaQuery.of(context).size.width * .01,
              left: MediaQuery.of(context).size.width * .04,
            ),
            child: GestureDetector(
              onTap: () {
                Get.to(ProductDetailsScreen(
                  productModel: controller.productModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 15.0,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .035,
                        ),
                        height: MediaQuery.of(context).size.height * .12,
                        width: MediaQuery.of(context).size.width * .45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade100,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .04,
                          ),
                          child: Column(
                            children: [
                              CustomTextWidget(
                                maxLines: 1,
                                fontSize: 16,
                                text: controller.productModel[index].productName,
                                textColor: Colors.black,
                                alignment: Alignment.bottomLeft,
                              ),
                              CustomTextWidget(
                                text: controller.productModel[index].productCompany,
                                textColor: Colors.black54,
                                fontSize: 14,
                                alignment: Alignment.bottomLeft,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.width * .01,
                              ),
                              CustomTextWidget(
                                text: '\$' + controller.productModel[index].productPrice,
                                fontSize: 16,
                                textColor: purpleColor,
                                alignment: Alignment.bottomLeft,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          imageShadow,
                        ],
                      ),
                      child: Hero(
                        tag: controller.productModel[index].productImage,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            image: NetworkImage(
                              controller.productModel[index].productImage,
                            ),
                            height: MediaQuery.of(context).size.height * .23,
                            width: MediaQuery.of(context).size.width * .42,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
