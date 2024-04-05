import 'package:chessiq/app_style/app_style.dart';
import 'package:chessiq/view/mobile_screens/mobile_register_screen/widgets/back_ground.dart';
import 'package:chessiq/shared/register_form.dart';
import 'package:flutter/material.dart';

class RegisterMobileScreen extends StatelessWidget {
  const RegisterMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackGround(content: RegisterForm(),),
    );
  }
}





