import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final String imgUrl;
  bool isActive = false;

  BottomNavbar({required this.imgUrl, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imgUrl,
          width: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(1000),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
