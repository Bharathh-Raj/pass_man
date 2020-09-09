import 'package:flutter/material.dart';

class BgGradient extends StatelessWidget {
  // final Widget child;
  // BgGradient({this.child});
  @override
  Widget build(BuildContext context) {
    return bg_gradient();
    // return Stack(
    //   children: [
    //     bg_gradient(),
    //     child,
    //   ],
    // );
  }

  Container bg_gradient() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.4, 1.0],
          colors: [Color(0xFF0AEAFE), Color(0xFF05757F)],
        ),
      ),
    );
  }
}


