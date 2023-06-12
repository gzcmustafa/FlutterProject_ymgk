import 'package:flutter/material.dart';

class OnboardWidgetItem extends StatelessWidget {
  final String assets;
  final String btnText;
  final VoidCallback onPressed;
  const OnboardWidgetItem({super.key, required this.assets, required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 650,
              width: double.infinity,
              decoration:
                  BoxDecoration(image: DecorationImage(image: AssetImage(assets), fit: BoxFit.fitWidth), borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
        Positioned(
          right: 30,
          bottom: 210,
          child: GestureDetector(
            onTap: onPressed,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.blue),
                    child: Center(
                      child: Text(btnText, style: const TextStyle(color: Colors.white, letterSpacing: 0.2)),
                    ))),
          ),
        ),
      ],
    );
  }
}
