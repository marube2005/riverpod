import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // Initialize the device dimensions inside build()
    late double _deviceHeight = MediaQuery.of(context).size.height;
    late double _deviceWidth = MediaQuery.of(context).size.width;

    return _UIbuild(_deviceHeight, _deviceWidth);
  }

  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();

  void _showPopUpError(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Ok"))
            ],
          );
        });
  }

  void _showPopUpSuccessful(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success!"),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Ok"))
            ],
          );
        });
  }

  void _validateEntry() {
    if (_textController.text.isEmpty) {
      _showPopUpError("Please enter your email");
    } else {
      _showPopUpSuccessful("Correct cresidentials!");
    }
  }

  Widget _UIbuild(double height, double width) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.03),
          height: width * 0.97,
          width: height * 0.97,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _loginTittle(),
              SizedBox(height: 20),
              _loginForm(),
            ],
          )),
    );
  }

  Widget _loginTittle() {
    return Container(
      //height: _deviceHeight * 0.10,
      child: Text(
        "Chatify App",
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Container(
        child: Form(
         key: _loginFormKey,
         child:  Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Username", 
                    border: OutlineInputBorder()
                    ),
                controller: _textController,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _validateEntry, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
