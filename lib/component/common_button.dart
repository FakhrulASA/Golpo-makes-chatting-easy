import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String buttonText;
  final Function? onPress;

  const CommonButton({Key? key, required this.buttonText, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress;
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 148, 31, 31),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
