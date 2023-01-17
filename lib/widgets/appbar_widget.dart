import 'package:flutter/material.dart';
import 'package:mythical_app/widgets/text_widget.dart';

PreferredSizeWidget AppbarWidget(String title, BuildContext context) {
  return AppBar(
    elevation: 3,
    foregroundColor: Colors.white,
    backgroundColor: Color(0xffDE3535),
    title: TextRegular(text: title, fontSize: 16, color: Colors.white),
    centerTitle: true,
  );
}
