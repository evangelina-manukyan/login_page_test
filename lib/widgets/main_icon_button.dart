import 'package:flutter/material.dart';

class MainIconButton extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;

  const MainIconButton(this.iconData, this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(iconData, color: Colors.white,),
      ),
    );
  }
}