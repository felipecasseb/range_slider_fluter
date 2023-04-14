import 'package:flutter/material.dart';

class ContainerTamanho extends StatelessWidget {
  final Color? color;
  final String text;
  const ContainerTamanho({
    this.color,
    required this.text,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      width: 95,
      decoration: BoxDecoration(
          color: color == null ? Color(0xFFD9D9D9) : color, borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: Text(
        "$text",
        style: TextStyle(fontWeight: FontWeight.w600, color: color == null ? Colors.black87 : Colors.white),
      )),
    );
  }
}
