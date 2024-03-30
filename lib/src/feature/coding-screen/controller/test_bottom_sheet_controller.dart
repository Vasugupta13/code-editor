

import 'package:get/get.dart';

class TestBottomSheetController extends GetxController{
  final RxBool _loadingTestCase1 = true.obs;
  final RxBool _loadingTestCase2 = true.obs;

  bool get loadingTestCase1 => _loadingTestCase1.value;
  bool get loadingTestCase2 => _loadingTestCase2.value;

  void loadingTestCase (){
    Future.delayed(const Duration(seconds: 2),(){
      _loadingTestCase1.value = false;
    }).then((value) => Future.delayed(const Duration(seconds: 2),(){
      _loadingTestCase2.value = false;
    }));
  }
  void closeTestCaseResults (){
    _loadingTestCase1.value = true;
    _loadingTestCase2.value = true;
  }
}