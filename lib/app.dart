import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app_test_task/screens/transaction_screen.dart';
import 'package:payment_app_test_task/utils/global_colors.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: GlobalColors.primary,
      ),
      title: 'Money App',
      home: TransactionScreen(),
    );
  }
}
