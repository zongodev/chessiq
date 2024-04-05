import 'package:flutter/material.dart';
class BackGround extends StatelessWidget {
  const BackGround({
    super.key, required this.content,
  });
  final Widget content ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/bgmobile.jpeg",
              ),
              fit: BoxFit.cover)),
      child: content,
    );
  }
}