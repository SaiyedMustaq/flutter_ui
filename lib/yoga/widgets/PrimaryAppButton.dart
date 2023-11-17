import 'package:flutter/material.dart';
import 'package:flutter_ui/yoga/yougaUtils/YColors.dart';

class PrimaryAppButton extends StatelessWidget {
  PrimaryAppButton(
      {super.key,
      required this.text,
      this.textStyle = const TextStyle(color: Colors.white),
      required this.onClick});
  final TextStyle textStyle;
  final String text;
  final Function onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 55,
        decoration: BoxDecoration(
            color: YColors.yPrimaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(30.0))),
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
