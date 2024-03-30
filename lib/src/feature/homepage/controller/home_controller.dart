import 'dart:convert';
import 'package:code_editor_ui/src/model/problem_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
class ProblemController extends GetxController {
  final _problemList = RxList<ProblemModel>();
  final _loading = RxBool(true);
  bool get loading => _loading.value;
  get problemList => _problemList;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), (){
     return loadProblems();
    });
  }

  void loadProblems() async {
    try {
      String jsonString = await rootBundle.loadString('asset/problems.json');
      final raw = jsonDecode(jsonString);
      for (var i in raw) {
        _problemList.add(ProblemModel.fromMap(i));
      }
      _loading.value = false;
    } catch (e) {
      debugPrint('[HomeController ERROR] - $e');
      _loading.value = false;
    }
  }
}