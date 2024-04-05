import 'package:chessiq/view/mobile_screens/mobile_register_screen/mobile_register_screen.dart';
import 'package:chessiq/view/web_screens/register_web_screen/register_web_screen.dart';
import 'package:flutter/material.dart';
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth>600){
        return const RegisterWebScreen();
      }
      else {
       return const RegisterMobileScreen();

      }
    },);
  }
}
