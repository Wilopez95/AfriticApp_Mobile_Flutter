import 'package:flutter/material.dart';

class InputNumFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final controller;
  InputNumFieldArea({this.hint, this.obscure, this.icon, this.controller});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
      ),
      child: new TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        obscureText: obscure,
        style: const TextStyle(
          color: Color.fromRGBO(247, 64, 106, 1.0),
        ),
        decoration: new InputDecoration(
          icon: new Icon(
            icon,
            color: Colors.white,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Color.fromRGBO(247, 64, 106, 1.0), fontSize: 15.0),
          contentPadding: const EdgeInsets.only(
              top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
        ),
      ),
    ));
  }
}
