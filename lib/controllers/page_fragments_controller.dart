import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageFragmentsController extends GetxController {
  RxInt _pageIndex = 0.obs;
  RxBool _reverse = false.obs;
  final List<Widget> _children;

  RxInt get pageIndex => _pageIndex;

  RxBool get reverse => _reverse;

  List<Widget> get children => _children;

  PageFragmentsController(this._children);

  Widget getCurrentChild() => _children[pageIndex.value];

  goBack() {
    if (pageIndex.value == 0) {
      Get.back();
      return;
    }

    _reverse.value = true;
    _pageIndex.value--;
    update();
  }

  goNext() {
    if (pageIndex.value == children.length - 1) return;

    _reverse.value = false;
    _pageIndex.value++;
    update();
  }
}
