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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .08,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .08,
                                        child: CustomTextWidget(
                                          alignment: Alignment.center,
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
                    CustomTextWidget(
                      text: "\$ 2550",
                      fontSize: 18,
                      textColor: purpleColor,
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
