import 'package:flutter/material.dart';
import 'package:shopin/constants.dart';

import 'custom_text_widget.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Function onTap;

  const CustomListTile({
    this.title,
    this.leadingIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: purpleColor,
        ),
        height: MediaQuery.of(context).size.height * .05,
        width: MediaQuery.of(context).size.height * .05,
        child: Icon(
          leadingIcon,
          color: Colors.white,
        ),
      ),
      title: CustomTextWidget(
        text: title,
        alignment: Alignment.centerLeft,
        fontSize: 18,
      ),
      trailing: Icon(
        Icons.navigate_next,
        color: Colors.black,
      ),
    );
  }
}
//
//
// ClipRRect(
// borderRadius: BorderRadius.circular(10.0),
// child: Container(
// height: MediaQuery.of(context).size.height * .05,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(10.0),
// boxShadow: [imageShadow],
// ),
//
// child: Row(
// children: [
// Container(
// color: purpleColor,
// height: MediaQuery.of(context).size.height * .05,
// width: MediaQuery.of(context).size.height * .05,
// child: Icon(
// Icons.edit_outlined,
// color: Colors.white,
// ),
// ),
// SizedBox(
// width: MediaQuery.of(context).size.width * .06,
// ),
// Expanded(
// child:
// ),
//
// ],
// ),
// ),
// ),
