
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 37, 53, 66),
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            fixedSize: Size(360, 55),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontFamily: 'Playfair_Display',
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}