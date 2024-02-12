import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const InputText(this.controller, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(
          maxHeight: 100,
        ),
        child: Padding(padding: const EdgeInsets.all(10),
          child: TextField(
            expands: true,
            maxLines: null,
            minLines: null,
            controller: controller,
            decoration: InputDecoration(hintText: label),
          ),
        )
    );
  }
}