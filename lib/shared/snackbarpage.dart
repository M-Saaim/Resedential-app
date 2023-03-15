import 'package:flutter/material.dart';
import 'package:resedentialapp/shared/constants.dart';

class ShowSnackBar {
  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: kOxfordBlue,
      ),
    );
  }
}
