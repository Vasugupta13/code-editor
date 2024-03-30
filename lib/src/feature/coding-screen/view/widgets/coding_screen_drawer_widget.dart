import 'package:code_editor_ui/src/feature/homepage/controller/home_controller.dart';
import 'package:code_editor_ui/src/global/components/ps_example_text.dart';
import 'package:code_editor_ui/src/global/components/ps_text_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CodingScreenDrawer extends StatelessWidget {
  final int index;
  const CodingScreenDrawer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    ProblemController problemController = Get.find();
    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            PsTextComponent("Problem Statement",problemController.problemList[index].problemStatement),
            PsTextComponent("Input",problemController.problemList[index].input),
            PsTextComponent("Output",problemController.problemList[index].output),
            const Text('Examples',style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500
            ),),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PsExampleTextComponent("Example 1 - ","${problemController.problemList[index].example1.input}","${problemController.problemList[index].example1.output}"),
                  const SizedBox(height: 10,),
                  PsExampleTextComponent("Example 2 - ","${problemController.problemList[index].example2.input}","${problemController.problemList[index].example2.output}"),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            PsTextComponent("Time Complexity",problemController.problemList[index].timeComplexity),
          ],
        ),
      ),
    );
  }
}
