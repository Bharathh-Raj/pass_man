import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pass_man/core/widgets/background_gradient.dart';

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
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.redAccent,
                  primaryColorDark: Colors.red,
                ),
                child: TextField(
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Enter the Domain name here",
                )),
              )),
          Expanded(
              flex: 1,
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.redAccent,
                  primaryColorDark: Colors.red,
                ),
                child: TextField(
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Enter the User name here",
                )),
              )),
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
                    // GeneratePassword password = new GeneratePassword(domain: 'google', username: 'bharath');
                  }
                  // generateProtocol(domainController.text.toString()),
                  )),
        ],
      ),
    );
  }
}
