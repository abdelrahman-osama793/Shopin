import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/view/screens/auth_screens/login_screen.dart';
import 'package:shopin/view/widgets/custom_list_tile_widget.dart';
import 'package:shopin/view/widgets/custom_text_widget.dart';
import 'package:shopin/view_model/profile_view_model.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: SpinKitWave(
                color: purpleColor,
                size: MediaQuery.of(context).size.height * .045,
              ),
            )
          : Scaffold(
              body: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * .05,
                  MediaQuery.of(context).size.height * .1,
                  MediaQuery.of(context).size.width * .05,
                  MediaQuery.of(context).size.width * .05,
                ),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .12,
                            width: MediaQuery.of(context).size.height * .12,
                            decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  MediaQuery.of(context).size.height * .15,
                                ),
                              ),
                            ),
                            child: (controller.userModel == null)
                                ? Icon(
                                    Icons.person_outline,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.height * .1,
                                  )
                                : (controller.userModel.profilePic == "default")
                                    ? Icon(
                                        Icons.person_outline,
                                        color: Colors.white,
                                        size: MediaQuery.of(context).size.height * .1,
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            MediaQuery.of(context).size.height * .15,
                                          ),
                                        ),
                                        child: Image(
                                          image: NetworkImage(
                                            controller.userModel.profilePic,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                text: controller.userModel.name,
                                fontSize: 20,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.width * .01,
                              ),
                              CustomTextWidget(
                                text: controller.userModel.email,
                                fontSize: 16,
                                textColor: Colors.grey,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomListTile(
                            onTap: () {},
                            title: "Edit profile",
                            leadingIcon: Icons.edit_outlined,
                          ),
                          CustomListTile(
                            onTap: () {},
                            title: "My orders",
                            leadingIcon: Icons.departure_board_outlined,
                          ),
                          CustomListTile(
                            onTap: () {},
                            title: "My wishlist",
                            leadingIcon: Icons.favorite_border_outlined,
                          ),
                          CustomListTile(
                            onTap: () {},
                            title: "Shipping address",
                            leadingIcon: Icons.location_on_outlined,
                          ),
                          CustomListTile(
                            onTap: () {},
                            title: "Notifications",
                            leadingIcon: Icons.notifications_outlined,
                          ),
                          CustomListTile(
                            onTap: () {
                              controller.signOutAll();
                              Get.offAll(LoginScreen());
                            },
                            title: "Log out",
                            leadingIcon: Icons.login_outlined,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
