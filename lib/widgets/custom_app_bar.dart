import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Notes', style: TextStyle(fontSize: 25)),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color.fromARGB(110, 60, 60, 60),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, size: 26),
            ),
          ),
        ),
      ],
    );
  }
}
