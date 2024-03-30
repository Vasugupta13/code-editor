import 'package:code_editor_ui/src/res/strings.dart';
import 'package:flutter/material.dart';

class PsExampleTextComponent extends StatelessWidget {
  final String title;
  final String input;
  final String output;
  const PsExampleTextComponent(this.title, this.input, this.output,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: const TextStyle(
            fontSize: 16,
            color: AppColors.kPrimaryOrangeColor,
            fontWeight: FontWeight.w400
        ),),
        Text("input - $input",style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400
        ),),
        Text("output - $output",style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400
        ),),
      ],
    );
  }
}
