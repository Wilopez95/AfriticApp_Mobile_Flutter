import 'dart:io';

import 'package:afriticapp/API_Access/Controlador.dart';
import 'package:afriticapp/API_Access/UsuariosControlador.dart';
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
  bool lockScreen = false;
  var correoController = TextEditingController();
  var passController = TextEditingController();
  //Se agrega al scaffold para notificaciones 
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int estado;


  
  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
    estado = -3;
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    correoController.dispose();
    passController.dispose();
    estado = -1;
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

    StaggerAnimation butAnim = new StaggerAnimation
    (
      buttonController:
          _loginButtonController.view,
          function: _playAnimation,
          correo: correoController.text,
          pass: passController.text,
    );


    InkWell boton1 = new InkWell
    (
      onTap: () {
      //bloquea la pantalla
      setState(() {
          lockScreen = true;
        });
      //verifica la informacion
      var c = Controlador();
      c.Login(correoController.text, passController.text).then(
        (response){
          setState(() {
          estado = response;
          lockScreen = false;
          if(estado < 0)
          {
            //Mostrar una notificacion
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text("Usuario o contraseña incorrecto"),
                duration: Duration(seconds: 3),
              )
            );
          }
          else
          {
            _playAnimation();
          }
        }); 
        }
      );
      },
      child: new SignIn()
    );

    

    return (new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          //agregar al scaffold para notificaciones
          key: _scaffoldKey,
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
                              new FormContainer(
                                correoController: correoController,
                                passController: passController,
                              ),
                              new SignUp(
                                funcion: _forgotPass,
                              )
                            ],
                          ),
                          lockScreen ?
                          Container(
                            child: CircularProgressIndicator(
                            ),
                          )  
                          : Container(
                            child: estado >= 0 ? butAnim : boton1,
                          )
                        ],
                      ),
                    ],
                  ))),
        )));
  }
}
