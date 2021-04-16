import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    bool hasClose = false,
    Function? onClosePressed,
  }) : super(
          elevation: 0,
          title: Text(
            'MoneyApp',
            style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: hasClose
              ? [
                  IconButton(
                    icon: Icon(Icons.cancel),
                    splashRadius: 22,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ]
              : [],
          leading: SizedBox.shrink(),
        );
}
