import 'package:code_editor_ui/src/res/strings.dart';
import 'package:flutter/material.dart';

class PsTextComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  const PsTextComponent(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500
        ),),
        Text(subtitle,style: TextStyle(
            fontSize: 14,
            color: subtitle == "Easy" ? Colors.green: subtitle == "Medium" ?AppColors.kPrimaryOrangeColor : Colors.black,
            fontWeight: FontWeight.w400
        ),),
        const SizedBox(height: 10,),
      ],
    );
  }
}
