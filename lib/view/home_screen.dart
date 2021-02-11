import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/view/widgets/custom_text_widget.dart';
import 'package:shopin/view_model/bottom_nav_bar_vm.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = <String>[
    'Men',
    'Women',
    'g',
    'a',
    't',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBarWidget(),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .07,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .04,
              ),
              child: _searchTextFormField(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
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
            Container(
              height: MediaQuery.of(context).size.height * .12,
              child: _categoriesListView(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
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
            Container(
              height: MediaQuery.of(context).size.height * .35,
              child: _productsListView(),
            ),
          ],
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
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            hintText: "What would like to find?"),
      ),
    );
  }

  // Categories list view widget
  Widget _categoriesListView() {
    return ListView.builder(
      itemCount: categories.length,
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
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .04,
                    left: MediaQuery.of(context).size.width * .01,
                    right: MediaQuery.of(context).size.width * .01,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: Colors.grey.shade200,
                  ),
                  height: MediaQuery.of(context).size.height * .075,
                  width: MediaQuery.of(context).size.height * .075,
                  child: Image.asset('lib/assets/images/men-shoes-128.png'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .01,
                ),
                CustomTextWidget(
                  text: categories[index],
                  textColor: Colors.black54,
                )
              ],
            ));
      },
    );
  }

  // Products list view widget
  Widget _productsListView() {
    return ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * .01,
            right: MediaQuery.of(context).size.width * .02,
            bottom: MediaQuery.of(context).size.width * .01,
            left: MediaQuery.of(context).size.width * .04,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * .4,
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
                    width: MediaQuery.of(context).size.width * .4,
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
                            fontSize: 16,
                            text: 'Diesel Watch',
                            textColor: Colors.black,
                            alignment: Alignment.bottomLeft,
                          ),
                          CustomTextWidget(
                            text: 'Diesel',
                            textColor: Colors.black54,
                            fontSize: 14,
                            alignment: Alignment.bottomLeft,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * .01,
                          ),
                          CustomTextWidget(
                            text: '\$755',
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
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage(
                        "lib/assets/images/watch.jpg",
                      ),
                      height: MediaQuery.of(context).size.height * .23,
                      width: MediaQuery.of(context).size.width * .35,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // Bottom navigation bar widget
  Widget _bottomNavBarWidget() {
    return GetBuilder<BottomNavBarViewModel>(
      init: BottomNavBarViewModel(),
      builder: (controller)=>
      BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'My Cart',
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person_outlined,
            ),
          ),
        ],
        currentIndex: controller.navigationIndex,
        onTap: (index)=> controller.changeNavigationIndex(index),
        // elevation: 0,
        backgroundColor: Colors.white,
      ),
    );
  }
}
