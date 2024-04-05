import 'package:chessiq/view/mobile_screens/mobile_dashboard/mobile_dashboard.dart';
import 'package:flutter/material.dart';

import '../app_style/app_style.dart';
class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.width>600 ? 200:10,
              child: Text(
                "Register",
                style: appTextStyle(
                    36, FontWeight.bold, "Della Respira", Colors.white),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "UserName",
                  style: appTextStyle(
                      13, FontWeight.bold, "Della Respira", Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.white, width: 2)),
                    hintStyle: const TextStyle(
                        color: Color(0xffBCBEC0),
                        fontWeight: FontWeight.bold),
                    hintText: "username@gmail.com",
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Email",
                  style: appTextStyle(
                      13, FontWeight.bold, "Della Respira", Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.white, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    hintStyle: const TextStyle(
                        color: Color(0xffBCBEC0),
                        fontWeight: FontWeight.bold),
                    hintText: "example user123",
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Password",
                  style: appTextStyle(
                      13, FontWeight.bold, "Della Respira", Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.white, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    hintStyle: const TextStyle(
                        color: Color(0xffBCBEC0),
                        fontWeight: FontWeight.bold),
                    hintText: "password",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  width: MediaQuery.of(context).size.width - 36,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/mobiledashboard");
                      },
                      child: Text(
                        "Create Account",
                        style: appTextStyle(
                          15,
                          FontWeight.bold,
                          "Della Respira",
                          const Color(0xff5F374B),
                        ),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}