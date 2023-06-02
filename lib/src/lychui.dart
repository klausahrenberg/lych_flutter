import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class UI {
  static TextButton button(String title, VoidCallback? callback) {
    return TextButton(
      child: Text(title),
      onPressed: callback,
    );
  }
}
