import 'package:flutter/material.dart';

class TextInputBox extends StatelessWidget {
  final String labeltext;
  final VoidCallback ontap;
  final TextEditingController controller;

  const TextInputBox(
      {Key? key,
      required this.labeltext,
      required this.ontap,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        // onChanged: ontap,
        onTap: ontap,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labeltext,
        ),
      ),
    );
  }
}
