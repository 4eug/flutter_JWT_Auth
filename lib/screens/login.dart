import 'package:flutter/material.dart';
import 'package:flutter_jwt_auth/screens/addUser.dart';
import 'package:flutter_jwt_auth/screens/home.dart';
import 'package:flutter_jwt_auth/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var name, password, token;

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
            _textField1(context),
            SizedBox(height: 20),
            _textField2(context),
            SizedBox(height: 20),
            _loginButton,
            SizedBox(height: 20),
            _addUserButton(context),
          ],
        ),
      ),
    );
  }

  Widget _textField1(context) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: new InputDecoration(
            labelText: 'Name',
            isCollapsed: false,
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
          ),
          onChanged: (val) {
            name = val.trim();
          },
        ),
      );

  Widget _textField2(context) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: new InputDecoration(
            labelText: 'Password',
            isCollapsed: false,
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
          ),
          onChanged: (val) {
            password = val.trim();
          },
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
        onPressed: () {
          AuthService().login(name, password).then((val) {
            if (val.data['success']) {
              token = val.data['token'];
              Fluttertoast.showToast(
                  msg: 'Authenticated',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 20.0);

              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            }
          });
        },
        child: Text(
          "Authenticate",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ));
}

// ignore: non_constant_identifier_names
Widget _addUserButton(BuildContext context) => Padding(
    padding: const EdgeInsets.all(20),
    child: MaterialButton(
      height: 56,
      minWidth: double.infinity,
      color: Color(0xFF5ABD8C),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddUserScreen()),
        );
      },
      child: Text(
        "Add User",
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    ));
