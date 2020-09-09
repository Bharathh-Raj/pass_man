import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pass_man/core/utils/sizeConf.dart';
import 'package:pass_man/core/widgets/background_gradient.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          BgGradient(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        'assets/images/lock.svg',
                        height: 60,
                        width: 60,
                      ),
                    ),
                    Text(
                      'PassMan',
                      style: GoogleFonts.pacifico()
                          .copyWith(color: Colors.white)
                          .copyWith(fontSize: 26),
                    ),
                  ],
                ),
                //Login Container
                Container(
                  height: 140,
                  width: 317.00,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, -8.00),
                        color: Color(0xffffffff).withOpacity(0.36),
                        blurRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(19.00),
                  ),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Login',
                            style: GoogleFonts.pacifico()
                                .copyWith(color: Colors.blueGrey)
                                .copyWith(fontSize: 16),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            // margin: EdgeInsets.symmetric(horizontal: 8.0),
                            height: 50.0,
                            width: 260,
                            child: RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xFF05757F), Color(0xFF0AEAFE)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Container(
                                  constraints:
                                  BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'G',
                                          style: GoogleFonts.pacifico()
                                              .copyWith(color: Colors.white)
                                              .copyWith(fontSize: 18),
                                        ),
                                      ),
                                      Text(
                                        "Google",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: SizedBox(
                                          width: 8.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
