import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pass_man/core/widgets/background_gradient.dart';
import 'package:pass_man/features/generate_password/data/data_sources/gather_characters.dart';
import 'package:pass_man/features/generate_password/data/data_sources/generate_password.dart';
import 'package:pass_man/features/generate_password/data/data_sources/generate_protocol.dart';
import 'package:pass_man/features/generate_password/data/data_sources/sub_passwords.dart';

class GeneratePasswordPage extends StatelessWidget {
  TextEditingController domainController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [BgGradient(), contentLayer()],
      ),
    );
  }

  Widget contentLayer() {
    return Container(
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Generate your password!',
                style: GoogleFonts.pacifico().copyWith(color: Colors.white).copyWith(fontSize: 26),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Enter the domain name:'),
              controller: domainController,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Here is your password!'),
            ),
          ),
          Expanded(
              flex: 2,
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Protocol protocol = new Protocol();
                    GeneratePassword password = new GeneratePassword(domain: 'google', username: 'bharath');
                  }
                  // generateProtocol(domainController.text.toString()),
                  )),
        ],
      ),
    );
  }
}
