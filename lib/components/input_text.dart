import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool? mandatory;
  const InputText(this.controller, this.label, {super.key, this.mandatory});

  @override
  Widget build(BuildContext context) {
    final int numChars = controller.text.length;
    double numLines = numChars / 40;
    numLines = numLines == 0 ? 1 : numLines;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: AutoSizeTextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: label,
            border: mandatory ?? false
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent))
                : null),
        fullwidth: true,
        minFontSize: 20,
        maxLines: numLines.ceil(),
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),

      /*TextField(
        expands: true,
        maxLines: null,
        minLines: null,
        controller: controller,
        decoration: ,
      ),*/
    );
  }
}
