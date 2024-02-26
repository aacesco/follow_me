import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool? mandatory;
  const InputText(this.controller, this.label, {super.key, this.mandatory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: label,
            border: mandatory ?? false
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent))
                : null),
        maxLines: null,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
