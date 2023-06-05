import 'package:flutter/material.dart';

abstract class UI {
  static Text text(String title) {
    return Text(title);
  }

  static TextButton button(String title, VoidCallback? callback) {
    return TextButton(
      child: Text(title),
      onPressed: callback,
    );
  }
}
