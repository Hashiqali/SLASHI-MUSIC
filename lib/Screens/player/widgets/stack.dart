import 'package:flutter/material.dart';

class Stackitem extends StatelessWidget {
  const Stackitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -155,
          left: -138,
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/Screenshot_2023-09-23_090710-removebg.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          top: -155,
          right: -138,
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/top.png'),
                    fit: BoxFit.cover)),
          ),
        ),
      ],
    );
  }
}
