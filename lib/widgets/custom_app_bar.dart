import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.titleText,
    required this.buttonIcon,
    required this.isBackIcon,
  });

  final String titleText;
  final Icon buttonIcon;
  final bool isBackIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isBackIcon
            ? GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              )
            : SizedBox(),
        Text(titleText, style: TextStyle(fontSize: 25)),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color.fromARGB(110, 60, 60, 60),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: IconButton(onPressed: () {}, icon: buttonIcon),
          ),
        ),
      ],
    );
  }
}
