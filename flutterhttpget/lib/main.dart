import 'package:flutter/material.dart';
import 'package:flutterhttpget/Controlador.dart';

void main() => runApp(new MaterialApp(
  home: new HomePage(),
));

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

  Controlador controlador = new Controlador();


@override
void initState()
{
  super.initState();
  this.controlador.Acceso.postToApi();
}

  @override
  Widget build(BuildContext context) 
  {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.controlador.UsuariosC.ListaUsuarios.toString()),
      ),
    );
  }
}