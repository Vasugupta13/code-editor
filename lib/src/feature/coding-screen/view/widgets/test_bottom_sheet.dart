import 'package:code_editor_ui/src/feature/coding-screen/controller/test_bottom_sheet_controller.dart';
import 'package:code_editor_ui/src/feature/coding-screen/view/widgets/alert_box_widget.dart';
import 'package:code_editor_ui/src/global/components/custom_button.dart';
import 'package:code_editor_ui/src/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TestBottomModalSheet extends StatelessWidget {

  const TestBottomModalSheet({super.key});


  @override
  Widget build(BuildContext context) {
    TestBottomSheetController testBottomSheetController = Get.find();
    return Container(
        height: 250,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Test-case Results ",style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black
                  ),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Text("Test Case 1 : ",style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.black
                      ),),
                      Obx(() =>  testBottomSheetController.loadingTestCase1 ?
                      Transform.scale(
                          scale: 0.6,
                          child: const CircularProgressIndicator()): const Row(children: [Icon(Icons.check,color: Colors.green,),Text(' Passed')],)
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Test Case 2 : ",style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.black
                      ),),
                      Obx(() =>  testBottomSheetController.loadingTestCase2?
                      Transform.scale(
                          scale: 0.6,
                          child: const CircularProgressIndicator()): const Row(children: [Icon(Icons.check,color: Colors.green,),Text(' Passed')],)
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: CustomButton(
                      title: 'Close', onPressed: () {
                      testBottomSheetController.closeTestCaseResults();
                      Get.back();
                    },backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,),
                  ),
                  const SizedBox(width: 40,),
                  Expanded(
                    child: CustomButton(
                      title: 'Submit', onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertBoxWidget();
                        },
                      );
                    },backgroundColor: AppColors.kLightOrangeColor,),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
