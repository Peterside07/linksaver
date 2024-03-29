import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFieldWithIcon extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextFieldWithIcon({super.key, 
    required this.labelText,
    required this.iconData,
     this.onChanged,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 10),
            child: CircleAvatar(
              minRadius: 15,
              maxRadius: 20,
              backgroundColor: Colors.blueGrey[100],
              child: FaIcon(iconData, color: Colors.blueGrey[700]),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
