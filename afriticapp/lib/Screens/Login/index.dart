import 'dart:io';

import 'package:flutter/material.dart';
import 'styles.dart';
import 'loginAnimation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import '../../Components/SignUpLink.dart';
import '../../Components/Form.dart';
import '../../Components/SignInButton.dart';
import '../../Components/WhiteTick.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  var animationStatus = 0;
  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }
  

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('¿Esta seguro?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () =>
                    exit(0),
                child: new Text('Si'),
              ),
            ],
          ),
        ) ??
        false;
  }


   Future<bool> _forgotPass() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Recuperar contraseña'),
            content: TextField(
              decoration: InputDecoration(hintText: "Correo"),
              cursorColor: Color.fromRGBO(247, 64, 106, 1.0),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Enviar'),
                textColor:  Color.fromRGBO(247, 64, 106, 1.0),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('Cancelar'),
                textColor:  Color.fromRGBO(247, 64, 106, 1.0),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return (new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          body: new Container(
              child: new Container(
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                    colors: <Color>[
                      const Color.fromRGBO(162, 146, 199, 0.8),
                      const Color.fromRGBO(51, 51, 63, 0.9),
                    ],
                    stops: [0.2, 1.0],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                  )),
                  child: new ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: <Widget>[
                      new Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height/10,
                                ),
                                child: new Tick(image: tick),
                              ),              
                              new FormContainer(),
                              new SignUp(
                                funcion: _forgotPass,
                              )
                            ],
                          ),
                          animationStatus == 0
                              ? new Padding(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  child: new InkWell(
                                      onTap: () {
                                        setState(() {
                                          animationStatus = 1;
                                        });
                                        _playAnimation();
                                      },
                                      child: new SignIn()),
                                )
                              : new StaggerAnimation(
                                  buttonController:
                                      _loginButtonController.view),
                        ],
                      ),
                    ],
                  ))),
        )));
  }
}
