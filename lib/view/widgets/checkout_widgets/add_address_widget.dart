import 'package:flutter/material.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/view/widgets/custom_text_widget.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          RadioListTile(
            value: null,
            groupValue: null,
            onChanged: (value){},
            title: CustomTextWidget(
              text: "Standard Delivery",
              fontSize: 22,
            ),
            subtitle: CustomTextWidget(
              text: StandardDeliveryInfo,
              fontSize: 22,
            ),
            activeColor: purpleColor,

          ),
        ],
      ),
    );
  }
}
