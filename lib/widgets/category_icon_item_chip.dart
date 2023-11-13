import 'package:flutter/material.dart';

class CategoryItemChip extends StatelessWidget {
  const CategoryItemChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: const ShapeDecoration(
            color: Colors.blue,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
            ),
            shadows: [
              BoxShadow(
                color: Colors.blue,
                blurRadius: 25,
                spreadRadius: -12,
                offset: Offset(0, 15),
              ),
            ],
          ),
          child: const Icon(
            Icons.computer,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'همه',
          style: TextStyle(fontFamily: 'SB', fontSize: 12),
        ),
      ],
    );
  }
}
