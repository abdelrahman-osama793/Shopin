import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/view_model/checkout_view_model.dart';

import '../../../constants.dart';
import '../custom_text_widget.dart';

class DeliveryTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: CheckoutViewModel(),
      builder: (controller) => Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * .02,
            MediaQuery.of(context).size.height * .1,
            MediaQuery.of(context).size.width * .02,
            MediaQuery.of(context).size.width * .02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * .05,
              // ),
              RadioListTile(
                value: DeliveryTypes.StandardDelivery,
                groupValue: controller.deliveryType,
                onChanged: (DeliveryTypes value) {
                  controller.changeDeliveryType(value);
                },
                title: CustomTextWidget(
                  text: "Standard Delivery",
                  fontSize: 22,
                ),
                subtitle: CustomTextWidget(
                  text: StandardDeliveryInfo,
                  maxLines: 3,
                ),
                activeColor: purpleColor,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              RadioListTile(
                value: DeliveryTypes.EmergencyDelivery,
                groupValue: controller.deliveryType,
                onChanged: (DeliveryTypes value) {
                  controller.changeDeliveryType(value);
                },
                title: CustomTextWidget(
                  text: "Emergency Delivery",
                  fontSize: 22,
                ),
                subtitle: CustomTextWidget(
                  text: EmergencyDeliveryInfo,
                  maxLines: 3,
                ),
                activeColor: purpleColor,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              RadioListTile(
                value: DeliveryTypes.LazyDelivery,
                groupValue: controller.deliveryType,
                onChanged: (DeliveryTypes value) {
                  controller.changeDeliveryType(value);
                },
                title: CustomTextWidget(
                  text: "Lazy Delivery",
                  fontSize: 22,
                ),
                subtitle: CustomTextWidget(
                  text: LazyDeliveryInfo,
                  maxLines: 3,
                ),
                activeColor: purpleColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
