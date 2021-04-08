import 'package:flutter/material.dart';
import 'package:flutter_jwt_auth/widgets/ui_widgets.dart';

bool _value = false;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 50),
            _textField(UIWidget.email, false),
            SizedBox(height: 20),
            _textField(UIWidget.password, true),
            SizedBox(height: 20),
            _keepLogin,
            _loginButton,
          ],
        ),
      ),
    );
  }

  Widget _textField(String text, bool obscure) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: TextField(
          obscureText: obscure,
          decoration: new InputDecoration(
            focusedBorder: new OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0xFF5ABD8C), width: 2),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            enabledBorder: new OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0x80EFEFEF), width: 2),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Color(0x75000000)),
            hintText: text,
          ),
        ),
      );
  Widget get _keepLogin => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Checkbox(
                checkColor: Color(0xFFFFFFFF),
                activeColor: Color(0xFF5ABD8C),
                onChanged: (bool value) {
                  setState(() {
                    _value = value;
                  });
                },
                value: _value),
            Text(UIWidget.stayLoggedIn,
                style: TextStyle(
                    color: Color(0x50212121), fontWeight: FontWeight.w300)),
          ],
        ),
      );
  Widget get _loginButton => Padding(
      padding: const EdgeInsets.all(20),
      child: MaterialButton(
        height: 56,
        minWidth: double.infinity,
        color: Color(0xFF5ABD8C),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)),
        onPressed: () {},
        child: Text(
          "Sign In",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ));
}
