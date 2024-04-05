import 'package:flutter/material.dart';

import '../../../shared/register_form.dart';

class RegisterWebScreen extends StatelessWidget {
  const RegisterWebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Positioned(
              right: MediaQuery.of(context).size.width / 4,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3.5,
                  height: MediaQuery.of(context).size.height,
                  child: const RegisterForm()),
            ),
          ],
        ),
      ),
    );
  }
}
