// import 'package:flutter/material.dart';
//
// class LoadingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(
//           top: MediaQuery.of(context).size.height * .07,
//         ),
//         child: Column(
//           children: [
//             //Contains the search bar
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: MediaQuery.of(context).size.width * .04,
//               ),
//               child: _loadingSearchBar(),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .03,
//             ),
//             //Contains the "Categories" text
//             Padding(
//               padding: EdgeInsets.only(
//                 left: MediaQuery.of(context).size.width * .04,
//               ),
//               child: CustomTextWidget(
//                 text: "Categories",
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .02,
//             ),
//             // Container that contains the category list view
//             Container(
//               height: MediaQuery.of(context).size.height * .12,
//               child: _loadingCategoriesListView(),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .02,
//             ),
//             //Contain the "Best seller" and "see all" row
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: MediaQuery.of(context).size.width * .04,
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.baseline,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     color: Colors.grey.shade200,
//                   ),
//                   Container(
//                     color: Colors.grey.shade200,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .01,
//             ),
//             //Container that contains the product list view
//             Container(
//               height: MediaQuery.of(context).size.height * .35,
//               child: _productsListView(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _loadingSearchBar() {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: Colors.grey.shade200,
//       ),
//     );
//   }
//
//   Widget _loadingCategoriesListView() {
//     return ListView.builder(
//       itemCount: 5,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         return Padding(
//             padding: EdgeInsets.only(
//               top: MediaQuery.of(context).size.width * .01,
//               right: MediaQuery.of(context).size.width * .02,
//               bottom: MediaQuery.of(context).size.width * .01,
//               left: MediaQuery.of(context).size.width * .04,
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   padding: EdgeInsets.only(
//                     // top: MediaQuery.of(context).size.width * .04,
//                     left: MediaQuery.of(context).size.width * .01,
//                     right: MediaQuery.of(context).size.width * .01,
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(150),
//                     color: Colors.grey.shade200,
//                   ),
//                   height: MediaQuery.of(context).size.height * .075,
//                   width: MediaQuery.of(context).size.height * .075,
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * .05,
//                     width: MediaQuery.of(context).size.height * .05,
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.width * .01,
//                 ),
//                 Container(
//                   color: Colors.grey.shade200,
//                 ),
//               ],
//             ));
//       },
//     );
//   }
//
//   Widget _productsListView() {
//     return ListView.builder(
//       itemCount: 3,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: EdgeInsets.only(
//             top: MediaQuery.of(context).size.width * .01,
//             right: MediaQuery.of(context).size.width * .02,
//             bottom: MediaQuery.of(context).size.width * .01,
//             left: MediaQuery.of(context).size.width * .04,
//           ),
//           child: Container(
//             width: MediaQuery.of(context).size.width * .4,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Stack(
//               alignment: Alignment.topCenter,
//               children: [
//                 Positioned(
//                   bottom: 15.0,
//                   child: Container(
//                     padding: EdgeInsets.only(
//                       top: MediaQuery.of(context).size.height * .035,
//                     ),
//                     height: MediaQuery.of(context).size.height * .12,
//                     width: MediaQuery.of(context).size.width * .4,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.0),
//                       color: Colors.grey.shade200,
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width * .04,
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             color: Colors.grey.shade200,
//                             alignment: Alignment.bottomLeft,
//                           ),
//                           Container(
//                             color: Colors.grey.shade200,
//                             alignment: Alignment.bottomLeft,
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.width * .01,
//                           ),
//                           CustomTextWidget(
//                             text: '\$755',
//                             fontSize: 16,
//                             textColor: purpleColor,
//                             alignment: Alignment.bottomLeft,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black26,
//                         offset: Offset(0.0, 2.0),
//                         blurRadius: 6.0,
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10.0),
//                     child: Image(
//                       image: AssetImage(
//                         "lib/assets/images/watch.jpg",
//                       ),
//                       height: MediaQuery.of(context).size.height * .23,
//                       width: MediaQuery.of(context).size.width * .35,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
