import 'package:chessiq/responsive_layout/responsive_layout.dart';
import 'package:chessiq/view/mobile_screens/mobile_chess_board/mobile_chess_board.dart';
import 'package:chessiq/view/mobile_screens/mobile_dashboard/mobile_dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        "/mobiledashboard" : (context) =>  const MobileDashboard(),
      },
      home: const ResponsiveLayout(),
    );
  }
}



